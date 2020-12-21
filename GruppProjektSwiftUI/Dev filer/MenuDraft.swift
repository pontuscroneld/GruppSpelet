//
//  MenuDraft.swift
//  GruppProjektSwiftUI
//
//  Created by Pontus Croneld on 2020-12-16.
//

import SwiftUI

struct MenuDraft: View {
    
    var dataLoader = DataLoader()
    @State var colors : [Color] = [.green, .orange, .red, .yellow, .blue, .purple]
    
    var body: some View {
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
                            print("Tryckt på Former")
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
