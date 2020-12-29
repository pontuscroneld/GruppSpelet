//
//  NewMenu.swift
//  GruppProjektSwiftUI
//
//  Created by Pontus Croneld on 2020-12-29.
//

import SwiftUI

struct NewMenu: View {
    
    let screenSize = UIScreen.main.bounds
    @State private var isShowingGameView = false
    @State var categoryName:String = ""
    @State var appeared: Double = 0
    
    var body: some View {
        if(isShowingGameView == true)
        {
            GameView(chosenCategory: $categoryName)
                .opacity(appeared)
                .animation(.easeInOut(duration: 1), value: appeared)
                .onAppear {self.appeared = 1.0}
            
        }else{
            ZStack {
                
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                
                
                
                VStack {
                    
                    HStack{
                        Spacer()
                        
                        Button(action: {MusicPlayer.shared.pausemusic()}, label: {
                            MuteButton()
                        })
                        .padding()
                    }
                   
                    Spacer()
                    
                    
                    
                    HStack {
                        Button(action: {
                            categoryName = "animals"
                            self.isShowingGameView = true
                        }, label: {
                            Image("animalsbutton")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .padding(5)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        })
                        
                        Button(action: {
                            categoryName = "farm"
                            self.isShowingGameView = true
                        }, label: {
                            Image("farmbutton")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .padding(5)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        })
                    }
                    
                    HStack {
                        Button(action: {
                            categoryName = "dogs"
                            self.isShowingGameView = true
                        }, label: {
                            Image("dogbutton2")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .padding(5)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        })
                        Button(action: {
                            categoryName = "birds"
                            self.isShowingGameView = true
                        }, label: {
                            Image("birdbutton")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .padding(5)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        })
                    }
                    HStack {
                        Button(action: {
                            categoryName = "africa"
                            self.isShowingGameView = true
                        }, label: {
                            Image("africabutton")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .padding(5)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        })
                        
                        Button(action: {
                            categoryName = "ocean"
                            self.isShowingGameView = true
                        }, label: {
                            Image("oceanbutton")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .padding(5)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        })
                    }
                    
                    Spacer()
                }
            }.onAppear(){
                
                if((MusicPlayer.shared.audioPlayer?.isPlaying) != nil){
                print("Yay")
                } else{
                MusicPlayer.shared.startBackgroundMusic()
                }
            }
            
        }
    }
}

struct NewMenu_Previews: PreviewProvider {
    static var previews: some View {
        NewMenu()
    }
}
