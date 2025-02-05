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
                    
                    
                    Text("Information about App")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top)
                    
                    RoundedRectangle(cornerRadius: 0, style: RoundedCornerStyle.continuous)
                        .frame(alignment: .top)
                        .frame(maxWidth: .infinity,maxHeight: 1)
                        .padding([.horizontal,.bottom])
                    
                    Text("What is \"The Oxford 3000\"?")
                        .font(.title2)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal)
                        .fontDesign(.serif)
                        .fontWeight(.black)
                    Text("The Oxford 3000 is a list of the 3000 core words that every learner of English needs to know.")
                        .font(.title3)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding([.horizontal,.bottom])
                        .fontDesign(.serif)
                    
                    Text("Target?")
                        .font(.title2)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal)
                        .fontDesign(.serif)
                        .fontWeight(.black)
                    Text("One of the rule about learning new langugage is knowing the words as much as we can, in our mother language how many words we are using in a day? Did you think about it before? There are many topic many interests. As The Oxford 3000 said we need to know these words for better communication. According to many people who can speak various languagaes that is \"we cant speak If we dont know vocabs!\"")
                        .font(.title3)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding([.horizontal,.bottom])
                        .fontDesign(.serif)
                    
                    Text("How it works??")
                        .font(.title2)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal)
                        .fontDesign(.serif)
                        .fontWeight(.black)
                    Text("To already speak english or not in either way learning new words is essential. In app, The words show up, You can see the turkish meaning after tapping the words twice. If you know skip it, If you seen first time or did you find that word hard, discriminate to categories. As a result your words going to be saved in App and you able to reach them whenever you want from left and right screen that from in menu bar. ")
                        .font(.title3)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding([.horizontal,.bottom])
                        .fontDesign(.serif)
                    
                    Text("What this app provide to you?")
                        .font(.title2)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal)
                        .fontDesign(.serif)
                        .fontWeight(.black)
                    Text("The most important vocablaries, being aware of your missing & bad parts, Also dont bother to note all of the words to notepads just select in here and test yourself with our various instructive Quiz. If you have some \"Hard Words\" in your list this App going to send you a reminder about these words.")
                        .font(.title3)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding([.horizontal,.bottom])
                        .fontDesign(.serif)
                    
                    Text("Meanings?")
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
                            
                            Text("If you seen the word for the first time.")
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
                            
                            Text("Althought many times you seen the word still you get difficulted to remember and use.")
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
                            
                            Text("If You've already learned the word succesfully.")
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
                            
                            Text("To speak and record your pronuncation.")
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
                            
                            Text("Listen your pronuncation.")
                                .font(.title3)
                            
                                .padding([.horizontal,.bottom])
                                .fontDesign(.serif)
                            
                            Spacer()
                        }
                        
                    }
   
                    

                
                    
                    Text("What will have  in the future?")
                        .font(.title2)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal)
                        .fontDesign(.serif)
                        .fontWeight(.black)
                    Text("For now we recording our audio and we able to listen ourselves, in the future also we can hear the correct pronuncation from dictioanary and also when we talk to app we will able to see is it correct spelling or not.\n\nAnd nowadays as a developer of this App I'm working on learning Italian so in the future also there is gonna be 3000 Italian words as well. \n\nOne of my other dream about this app is making a interview with native speakers, recording them on video and provide to you hear native accent and live.")
                        .font(.title3)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding([.horizontal,.bottom])
                        .fontDesign(.serif)
                    
                    Text("Developer of this App?")
                        .font(.title2)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal)
                        .fontDesign(.serif)
                        .fontWeight(.black)
                    Text("Melih Şişkular \nEmail: melihsiskular@gmail.com     ")
                        .font(.title3)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding([.horizontal,.bottom])
                        .fontDesign(.serif)
                    
                    Spacer()
                    
                    
                    ///Dismiss button
                    Button {
                        dismiss()
                    } label: {
                        Text("Done")
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
