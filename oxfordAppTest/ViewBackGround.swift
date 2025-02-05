//
//  ViewBackGround.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 3.02.2025.
//

import SwiftUI

struct ViewBackGround: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.cyan.mix(with: .white, by: 0.2),.white]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
        
    }
}

#Preview {
    ViewBackGround()
}
