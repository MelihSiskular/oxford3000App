//
//  StoriesView.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 27.02.2025.
//

import SwiftUI

struct StoriesView: View {
    
    @State private var testList = [
        Stories(storyTitle: "Order Food", topic: .life, popUpText: "blablabla", boolScript: false, boolTest: false, boolWords: false, storyCompleted: false, pointInTest: 0),
        Stories(storyTitle: "At Shopping", topic: .life, popUpText: "blablabla", boolScript: true, boolTest: true, boolWords: true, storyCompleted: true, pointInTest: 0),
        Stories(storyTitle: "Ask Direction", topic: .travel, popUpText: "blablabla", boolScript: true, boolTest: false, boolWords: false, storyCompleted: false, pointInTest: 0),
        Stories(storyTitle: "At The Airport", topic: .travel, popUpText: "blablabla", boolScript: false, boolTest: false, boolWords: false, storyCompleted: false, pointInTest: 0),
        Stories(storyTitle: "Exam!", topic: .school, popUpText: "blablaaaabla", boolScript: false, boolTest: false, boolWords: false, storyCompleted: false, pointInTest: 0),
        Stories(storyTitle: "Arrange The Meeting!", topic: .friends, popUpText: "blablabla", boolScript: false, boolTest: false, boolWords: false, storyCompleted: false, pointInTest: 0),
        Stories(storyTitle: "Apply A Job", topic: .work, popUpText: "blablabla", boolScript: true, boolTest: true, boolWords: true, storyCompleted: true, pointInTest: 0),
        
    ]
    
    @State private var expandedItem: String?
    @State var isActive = false
    
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
                            RoundedRectangle(cornerRadius: 0, style: .continuous)
                                .frame(maxWidth: 220,maxHeight: 1)
                            Text("momo_bobo_text2".localized)
                                .lineLimit(3)
                                .multilineTextAlignment(.center)
                                .frame(width:300)
                        }.offset(x: isActive ? 800:0)
                        
                        popUpTextView(isActive: $isActive, storyTitle: title , popUpText: text, action: {})
                            .offset(x:isActive ? 0 : -800)
                  
                    }

                    
                    Spacer()
                    
                    List {
                        ForEach(topic.allCases, id: \.self) { category in
                            Section(header: Text(category.rawValue)) {
                                
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
                        .listStyle(.plain)
                        .shadow(radius: 1)
                 
                    Spacer()
                        
                }
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

