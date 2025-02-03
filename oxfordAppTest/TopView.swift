//
//  TopView.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 3.02.2025.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        VStack {
            Text("The Oxford 3000")
                .font(.custom("Thonburi Bold", size: 40, relativeTo: .footnote))
                .padding(.top,30)
                .shadow(radius: 4)
        }
       
     
    }
}

#Preview {
    TopView()
}
