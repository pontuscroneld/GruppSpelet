//
//  MenuDraft.swift
//  GruppProjektSwiftUI
//
//  Created by Pontus Croneld on 2020-12-16.
//

import SwiftUI

struct MenuDraft: View {
    
    var dataLoader = DataLoader()
    @State private var isShowingGameView = false
    @State var categoryName:String = ""
    
    var body: some View {
        NavigationView {
            /*
            NavigationLink(destination: GameView(), isActive: $isShowingGameView) {
                Text("A")
                Text("B")
            }
            */
            
            //Text(categoryName)
            
            EmptyView().fullScreenCover(isPresented: $isShowingGameView, content: {
                GameView(chosenCategory: $categoryName)
            })
            
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
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
                            // .border(Color.white, width: 5)
                            .padding()
                            .shadow(radius: 10)
                            .shadow(radius: 10)
                        }
                        
                    }.padding(.bottom, 40.0).frame(width: 600, height:800, alignment: .center)
                    //.background(Color.gray)
                    Spacer()
                }
            }
        }
    }
    
    /*
     VStack {
     ForEach(0..<dataLoader.gameCategories.count) { category in
     
     Button(action: {
     
     }) {
     Text(dataLoader.gameCategories[category].categoryName)
     } .padding()
     .frame(width: 100, height: 50)
     .background(colors[category])
     .foregroundColor(.white)
     
     }*/
    
    // End VStack
    
    
    struct MenuDraft_Previews: PreviewProvider {
        static var previews: some View {
            MenuDraft()
        }
    }
}
