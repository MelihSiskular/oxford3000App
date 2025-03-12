//
//  StoriesView.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 27.02.2025.
//

import SwiftUI

struct StoriesView: View {
    
    @State private var testList = [
        Stories(storyTitle: "Order Food", topic: .life, popUpText: "There will be a brief about story..", boolScript: false, boolTest: false, boolWords: false, storyCompleted: false, pointInTest: 0),
        Stories(storyTitle: "At Shopping", topic: .life, popUpText: "There will be a brief about story..", boolScript: true, boolTest: true, boolWords: true, storyCompleted: true, pointInTest: 0),
        Stories(storyTitle: "Ask Direction", topic: .travel, popUpText: "Momo & Bobo arrived the city but they dont know any road in there, They need to be confident and ask people who knows this city well.", boolScript: true, boolTest: false, boolWords: false, storyCompleted: false, pointInTest: 0),
        Stories(storyTitle: "At The Airport", topic: .travel, popUpText: "blablabla", boolScript: false, boolTest: false, boolWords: false, storyCompleted: false, pointInTest: 0),
        Stories(storyTitle: "Exam!", topic: .school, popUpText: "There will be a brief about story...", boolScript: false, boolTest: false, boolWords: false, storyCompleted: false, pointInTest: 0),
        Stories(storyTitle: "Arrange The Meeting!", topic: .friends, popUpText: "There will be a brief about story...", boolScript: false, boolTest: false, boolWords: false, storyCompleted: false, pointInTest: 0),
        Stories(storyTitle: "Apply A Job", topic: .work, popUpText: "There will be a brief about story...", boolScript: true, boolTest: true, boolWords: true, storyCompleted: true, pointInTest: 0),
        
    ]
    
    @State private var expandedItem: String?
    @State var isActive = false
    @State private var isFirstActive1 = false
    @State private var isFirstActive2 = false
    @State private var isFirstActive3 = false
    @State private var isFirstActive4 = false


    @State var title = ""
    @State var text = ""
    
  
   

    var body: some View {
        NavigationStack {
            ZStack {
                ViewBackGround()
                
                VStack {
                    
                    HStack {
                        Text("stories_text".localized)
                            .bold()
                            .font(.largeTitle)
                        
                        Spacer()
                    }.padding(.horizontal)
                    
                    
                    
                    ZStack {
                        VStack {
                            Text("momo_bobo_text".localized)
                                .font(.largeTitle)
                                .italic()
                                .fontWeight(.medium)
                                .fontDesign(.serif)
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .opacity(isFirstActive1 ? 1 : 0)
                            RoundedRectangle(cornerRadius: 0, style: .continuous)
                                .frame(maxWidth: 220,maxHeight: 1)
                                .offset(x : isFirstActive2 ? 0 : 600)
                            

                            Text("momo_bobo_text2".localized)
                                .lineLimit(3)
                                .multilineTextAlignment(.center)
                                .frame(width:300)
                                .opacity(isFirstActive3 ? 1 : 0)

                        }.offset(x: isActive ? 800:0)
                            .onAppear {
                                onAppeared()
                            }
                            .onDisappear {
                                disAppeared()
                            }
                            
                        
                        popUpTextView(isActive: $isActive, storyTitle: title , popUpText: text, action: {})
                            .offset(x:isActive ? 0 : -800)
                  
                    }

                    
                    Spacer()
                    
                    List {
                        ForEach(topic.allCases, id: \.self) { category in
                            Section(header: Text(category.rawValue.localized))
                              {
                                ForEach(testList.filter{$0.topic == category},id: \.storyTitle) { story in
                                    HStack {
                                        Circle()
                                            .stroke()
                                            .foregroundStyle(.black)
                                            .background(Circle().fill(story.storyCompleted ? .green:.red))
                                        
                                          
                                        
                                        VStack(alignment: .leading) {
                                            
                                            Text(story.storyTitle)
                                                .font(.headline)
                                                .fontWeight(.black)
                                                .italic()
                                            
                                            
                                            Text("Points:" + story.pointInTest.description)
                                                .font(.subheadline)
                                                .fontWeight(.thin)
                                                .fontWidth(.condensed)
                                         
                                        }
                                  

                                        .onTapGesture {
                                            withAnimation {
                                                expandedItem = expandedItem == story.storyTitle ? nil : story.storyTitle
                                                if expandedItem != nil{
                                                    title = story.storyTitle
                                                    text = story.popUpText
                                                    isActive = true
                                                }else {
                                                    isActive = false
                                                }
                                               
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        Button {
                                            //TODO
                                            
                                        }label: {
                                            
                                            ZStack(alignment: .center) {
                                                RoundedRectangle(cornerRadius: 6)
                                                    .frame(width:32,height:32)
                                                    .foregroundStyle(story.boolScript ? .green.opacity(0.5): .cyan.mix(with: .white, by: 0.4))
                                                Image(systemName: "book.pages.fill")
                                            }
                                        }
                                        Button {
                                            //TODO

                                        }label: {
                                            ZStack(alignment:.center) {
                                                RoundedRectangle(cornerRadius: 6)
                                                    .frame(width:32,height:32)
                                                    .foregroundStyle(story.boolTest ? .green.opacity(0.5) : .cyan.mix(with: .white, by: 0.5))
                                                Image(systemName: "applepencil.gen1")
                                               
                                            }
                                        }
                                        Button {
                                            //TODO

                                        }label: {
                                            ZStack(alignment: .center) {
                                                RoundedRectangle(cornerRadius: 6)
                                                    .frame(width:32,height:32)
                                                    .foregroundStyle(story.boolWords ? .green.opacity(0.5) : .cyan.mix(with: .white, by: 0.6))
                                                Image(systemName: "brain.head.profile")
                                            }
                                        }
                                  
                                    
                                        
                                    }.padding()
                                        .listRowBackground(
                                            RoundedRectangle(cornerRadius: 36)
                                                .fill(Color.white)
                                                .padding(.vertical,2)
                                                .padding(.horizontal,5)
                                            
                                        )
                                        .listRowSeparator(.hidden)
                                        .frame(height: 50)
                                  
                                    if expandedItem == story.storyTitle {
                                        
                                        
                                    }
                                }
                            }
                         

                        }
                       

                        
                        
                    }.padding(.horizontal)
                        .headerProminence(.increased)
                        .listStyle(.grouped)
                        .scrollContentBackground(.hidden)
                        .shadow(radius: 1)
                        .offset(y:isFirstActive4 ? 0 : 800)
                          // Tüm liste arka planını şeffaf yapar

                    
                    Spacer()
                        
                }
            }
            
        }
        
    }
    func disAppeared() {
        isFirstActive1 = false
        isFirstActive2 = false
        isFirstActive3 = false
        isFirstActive4 = false
    }
    func onAppeared() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation(.bouncy(duration: 2)) {
                isFirstActive1 = true
                
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(.bouncy(duration: 1)) {
                isFirstActive2 = true
                isFirstActive4 = true
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4 ) {
            withAnimation(.bouncy(duration: 2)) {
                isFirstActive3 = true
                
            }
        }
    }
}

#Preview {
    StoriesView()
}
struct BubbleView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .foregroundColor(.white)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.blue)
                    .shadow(radius: 4)
            )
         
    }
}

