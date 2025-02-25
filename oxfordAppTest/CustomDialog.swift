//
//  CustomDialog.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 22.02.2025.
//

import SwiftUI

struct CustomDialog: View {
    @Binding var isActive : Bool
    let tittle: String
    let message: String
    let buttonTittle: String
    let action: () -> ()
    @State private var offset : CGFloat = 1000
    
    var body: some View {
 
        VStack {
            
        
                Text(tittle)
                    .font(.title2)
                    .bold()
                    .padding()
                
                Text(message)
                    .font(.body)
                    .multilineTextAlignment(.center)
                
                Button {
                    //TODO:
                    action()
                    close()
                } label: {
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.cyan)
                        
                        Text(buttonTittle)
                            .font(.system(size: 16,weight: .bold))
                            .foregroundStyle(.white)
                            .padding()
                    }
                    .padding()
                }
           
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 20)
            .padding(30)
            .offset(x:0,y:offset)
            .onAppear {
                withAnimation(.spring()) {
                    offset = 200
                    
                }
            }
        }
    
    
    func close() {
        withAnimation(.spring()) {
            offset = 1000
            isActive = false
        }
    }
}

//I GAVE THE VALUES TO SEE IN PREVIEW LIVE
#Preview {
    CustomDialog(isActive: .constant(true), tittle: "Test Tittle", message: "There's gonna be here our messages what we wanna show", buttonTittle: "OK", action: {})
}
