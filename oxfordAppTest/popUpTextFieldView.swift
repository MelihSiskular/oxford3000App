//
//  popUpTextFieldView.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 2.03.2025.
//

import SwiftUI
import SwiftData

struct popUpTextFieldView: View {
    
    //MARK: NEEDS FIX!
    
    
    @Environment(\.modelContext) var modelContext
    @Query  var savedFirstData : [ListFirstDataNew]
    
    @FocusState private var isTextFieldFocused: Bool
    
    @Binding var index: Int
    @Binding var isActive : Bool
    @Binding var textFieldText : String
    @Binding var wordEn : String
    var action: () -> ()
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Make a sentence about " )
                    
                    .fontWeight(.bold)
                    .italic()
                    .foregroundStyle(.white)
                    
                Text(wordEn).underline()
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    
            }
            .font(.system(size: 18))
            .padding(.top,30)
            TextField("Enter...", text: $textFieldText)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .focused($isTextFieldFocused)
            
            Button("Save") {
                isTextFieldFocused = false
                save()
                textFieldText = ""
                withAnimation {
                    isActive = false

                }
            }   .shadow(color: .black, radius: 0.5, x: 0.5, y: 0.5)
                .fontWeight(.bold)
                .font(.title2)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle)
                .tint(.orange.mix(with: .white, by: 0.5))
                .foregroundStyle(Color.black)
                .padding()
                .frame(maxWidth: .infinity)
            
        }
        .fixedSize(horizontal: false, vertical: true)
        .background(.orange.mix(with: .white, by: 0.1))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding()
        .overlay {
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        close()
                        isTextFieldFocused = false
                       
                    }label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                    .tint(.black)
                    .padding(.horizontal,25)
                    .padding(.vertical,25)
                }
                Spacer()
                
            }
        }
        .offset(x: isActive ? 0 : -600)
    }
    func close() {
        withAnimation {
            isActive = false

        }
    }
    func save() {
        savedFirstData[index].sentence = textFieldText
        
        //we will update datas like that
        do {
            try modelContext.save() //Save process not working accurately thats why there's a code like that
        } catch { }
    }
    
    
    
   
        
}

#Preview {
    popUpTextFieldView(index: .constant(0), isActive: .constant(true), textFieldText: .constant(""), wordEn: .constant("hello"), action: {})
}
