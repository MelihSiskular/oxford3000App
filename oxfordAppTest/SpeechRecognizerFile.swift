//
//  SpeechRecognizerFile.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 22.02.2025.
//

import Foundation
import Speech

class SpeechRecognizer: ObservableObject {
    @Published var transcribedText: String = ""
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    // 📌 **Uygulama açıldığında otomatik olarak izin iste**
    init() {
        requestAuthorization()
    }
    

    
    // 🎙️Start to Speech Recognizing for 3 seconds
    func startTranscribing() {
        transcribedText = ""
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let recognitionRequest = recognitionRequest else { return }
        recognitionRequest.shouldReportPartialResults = true
        
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
            
            let inputNode = audioEngine.inputNode
            let recordingFormat = inputNode.outputFormat(forBus: 0)
            inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
                recognitionRequest.append(buffer)
            }
            
            audioEngine.prepare()
            try audioEngine.start()
            
            recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest) { [self] result, error in
                if let result = result {
                    DispatchQueue.main.async {
                        self.transcribedText = result.bestTranscription.formattedString
                    }
                    
                }
                if error != nil {
                    self.stopTranscribing()
                }
            }
            
            // 🕒 **3 saniye sonra kaydı durdur**
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [self] in
                self.stopTranscribing()
                
            }
            
        } catch {
            print("🎤 Hata: \(error.localizedDescription)")
            stopTranscribing()
        }
    }
    
    // 🛑 Stop Speech Recognizing
    func stopTranscribing() {
        recognitionTask?.cancel()
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        recognitionRequest?.endAudio()
        recognitionRequest = nil
        recognitionTask = nil
        audioEngine.stop()
    }
    
    func levenshteinDistance(_ s1: String, _ s2: String) -> Int {
        let empty = [Int](repeating: 0, count: s2.count)
        var last = [Int](0...s2.count)
        
        for (i, tLett) in s1.enumerated() {
            var cur = [i + 1] + empty
            for (j, sLett) in s2.enumerated() {
                cur[j + 1] = tLett == sLett ? last[j] : min(last[j], last[j + 1], cur[j]) + 1
            }
            last = cur
        }
        return last.last!
    }
    
    func similarityPercentage(_ s1: String, _ s2: String) -> Double {
        let maxLength = max(s1.count, s2.count)
        if maxLength == 0 { return 100.0 } // Boş string kontrolü
        let distance = Double(levenshteinDistance(s1, s2))
        return (1.0 - (distance / Double(maxLength))) * 100.0
    }
    
}
// 🎙️ **Mikrofon ve Konuşma İzni Alma**
public func requestAuthorization() {
    SFSpeechRecognizer.requestAuthorization { status in
        DispatchQueue.main.async {
            switch status {
            case .authorized:
                print("✅ Mikrofon ve konuşma izni verildi.")
            case .denied, .restricted, .notDetermined:
                print("🚫 Mikrofon ve konuşma izni verilmedi.")
            @unknown default:
                break
            }
        }
    }
}


