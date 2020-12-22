//
//  MenuDraft.swift
//  GruppProjektSwiftUI
//
//  Created by Pontus Croneld on 2020-12-16.
//

import SwiftUI

struct MenuDraft: View {
    
    var dataLoader = DataLoader()
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
                ZStack{
                    Image("background")
                        .resizable()
                        .ignoresSafeArea()
                    VStack {
                        HStack{
                            Spacer()
                            Button(action: MusicPlayer.shared.pausemusic) {
                                MuteButton()
                                    .padding(.top, 80)
                                    .padding(.trailing, 100)
                            }
                        }
                        Spacer()
                        Spacer()
                        ScrollView{
                            ForEach(0..<dataLoader.gameCategories.count) { category in
                                Button(action: {
                                    print("Tryckt på \(dataLoader.gameCategories[category].categoryName)")
                                    
                                        categoryName = dataLoader.gameCategories[category].categoryName
                                    self.isShowingGameView = true
                                }) {
                                    
                                    Text(dataLoader.gameCategories[category].categoryName)
                                        .fontWeight(.bold)
                                        .font(.system(size: 60))
                                        .padding(.top)
                                        .frame(width: 500, height: 100)
                                        .background(
                                            Image("sign")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 500, height: 400))
                                        .foregroundColor(.white)
                                        .padding()
                                }
                                .padding()
                                .shadow(radius: 10)
                                .shadow(radius: 10)
                            }
                            
                        }.padding(.bottom, 40.0).frame(width: 600, height:800, alignment: .center)
                        Spacer()
                    }
                }
            }
    }
}


struct MenuDraft_Previews: PreviewProvider {
    static var previews: some View {
        MenuDraft()
    }
}
