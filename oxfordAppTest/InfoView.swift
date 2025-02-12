//
//  InfoView.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 4.02.2025.
//

import SwiftUI

struct InfoView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            ViewBackGround()
            
            ScrollView {
                VStack {
                    TopView()
                        .padding(.top)
                    
                    
                    Text("info_text".localized)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top)
                    
                    RoundedRectangle(cornerRadius: 0, style: RoundedCornerStyle.continuous)
                        .frame(alignment: .top)
                        .frame(maxWidth: .infinity,maxHeight: 1)
                        .padding([.horizontal,.bottom])
                    
                    Text("what_is_3000".localized)
                        .font(.title2)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal)
                        .fontDesign(.serif)
                        .fontWeight(.black)
                    Text("answer_what_is_3000".localized)
                        .font(.title3)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding([.horizontal,.bottom])
                        .fontDesign(.serif)
                    
                    Text("target_text".localized)
                        .font(.title2)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal)
                        .fontDesign(.serif)
                        .fontWeight(.black)
                    Text("answer_target_text".localized)
                        .font(.title3)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding([.horizontal,.bottom])
                        .fontDesign(.serif)
                    
                    Text("how_works_text".localized)
                        .font(.title2)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal)
                        .fontDesign(.serif)
                        .fontWeight(.black)
                    Text("answer_how_works_text".localized)
                        .font(.title3)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding([.horizontal,.bottom])
                        .fontDesign(.serif)
                    
                    Text("provide_text".localized)
                        .font(.title2)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal)
                        .fontDesign(.serif)
                        .fontWeight(.black)
                    Text("answer_provide_text".localized)
                        .font(.title3)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding([.horizontal,.bottom])
                        .fontDesign(.serif)
                    
                    Text("meanings_text".localized)
                        .font(.title2)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal)
                        .fontDesign(.serif)
                        .fontWeight(.black)
                    VStack {
                        HStack {
                            Image(systemName: "bolt")
                                .foregroundStyle(.orange)
                                .fontWeight(.bold)
                                .font(.title3)
                                .tint(Color.red)
                                .frame(alignment: .leading)
                                .padding([.horizontal,.bottom])
                                .fontDesign(.serif)
                            
                            Text("bolt_text".localized)
                                .font(.title3)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .padding([.horizontal,.bottom])
                                .fontDesign(.serif)
                            
                            Spacer()
                        }
                        HStack {
                            Image(systemName: "exclamationmark.3")
                                .foregroundStyle(.red)
                                .fontWeight(.bold)
                                .font(.title3)
                                .tint(Color.red)
                                .frame(alignment: .leading)
                                .padding([.horizontal,.bottom])
                                .fontDesign(.serif)
                            
                            Text("exclamination_text".localized)
                                .font(.title3)
                            
                                .padding([.horizontal,.bottom])
                                .fontDesign(.serif)
                            
                            Spacer()
                        }
                        HStack {
                            Image(systemName: "graduationcap")
                                .foregroundStyle(.green)
                                .fontWeight(.bold)
                                .font(.title3)
                                .tint(Color.red)
                                .frame(alignment: .leading)
                                .padding([.horizontal,.bottom])
                                .fontDesign(.serif)
                            
                            Text("graduationcap_text".localized)
                                .font(.title3)
                            
                                .padding([.horizontal,.bottom])
                                .fontDesign(.serif)
                            
                            Spacer()
                        }
                        HStack {
                            Image(systemName: "microphone")
                                .foregroundStyle(.pink)
                                .fontWeight(.bold)
                                .font(.title3)
                                .tint(Color.red)
                                .frame(alignment: .leading)
                                .padding([.horizontal,.bottom])
                                .fontDesign(.serif)
                            
                            Text("microphone_text".localized)
                                .font(.title3)
                            
                                .padding([.horizontal,.bottom])
                                .fontDesign(.serif)
                            
                            Spacer()
                        }
                        HStack {
                            Image(systemName: "speaker.wave.3")
                                .foregroundStyle(.gray)
                                .fontWeight(.bold)
                                .font(.title3)
                                .tint(Color.red)
                                .frame(alignment: .leading)
                                .padding([.horizontal,.bottom])
                                .fontDesign(.serif)
                            
                            Text("speaker_text".localized)
                                .font(.title3)
                            
                                .padding([.horizontal,.bottom])
                                .fontDesign(.serif)
                            
                            Spacer()
                        }
                        
                    }
                    
                    Text("future_text".localized)
                        .font(.title2)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal)
                        .fontDesign(.serif)
                        .fontWeight(.black)
                    Text("answer_future_text".localized)
                        .font(.title3)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding([.horizontal,.bottom])
                        .fontDesign(.serif)
                    
                    Text("developer_app_text".localized)
                        .font(.title2)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal)
                        .fontDesign(.serif)
                        .fontWeight(.black)
                    Text("Melih Şişkular \nEmail: melihsiskular@gmail.com")
                        .font(.title3)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding([.horizontal,.bottom])
                        .fontDesign(.serif)
                    
                    
                    Spacer()
                    
                    
                    ///Dismiss button
                    Button {
                        dismiss()
                    } label: {
                        Text("done_button".localized)
                            .fontWeight(.bold)
                    }

                    
                    Spacer()
                }
            }
            
            
            
        }
    }
}

#Preview {
    InfoView()
}
