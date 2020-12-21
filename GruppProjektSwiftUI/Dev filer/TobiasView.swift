//
//  TobiasView.swift
//  GruppProjektSwiftUI
//
//  Created by Pontus Croneld on 2020-11-27.
//

import SwiftUI

struct TobiasView: View {
    var body: some View {
        
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            
            
            VStack {
                Spacer()
                Spacer()
                ScrollView{
                    Button(action: {
                        print("Tryckt på Former")
                    }) {
                        Text(Image("former"))
                            .fontWeight(.bold)
                            .font(.system(size: 60))
                            .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            //.cornerRadius(25)
                            //.foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.white, lineWidth: 3)
                            )
                    }
                   // .border(Color.white, width: 5)
                    .padding()
                    .shadow(radius: 10)
                    .shadow(radius: 10)
                  
                    
                    Button(action: {
                        print("Tryckt på Former")
                    }) {
                        Text("FÄRGER")
                            .fontWeight(.bold)
                            .font(.system(size: 60))
                            .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(25)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.white, lineWidth: 3)
                            )
                    }
                   // .border(Color.white, width: 5)
                    .padding()
                    .shadow(radius: 10)
                    .shadow(radius: 10)
                    
                    Button(action: {
                        print("Tryckt på Former")
                    }) {
                        Text("TEST")
                            .fontWeight(.bold)
                            .font(.system(size: 60))
                            .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(25)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.white, lineWidth: 3)
                            )
                    }
                   // .border(Color.white, width: 5)
                    .padding()
                    .shadow(radius: 10)
                    .shadow(radius: 10)
                    
                    Button(action: {
                        print("Tryckt på Former")
                    }) {
                        Text("TEST")
                            .fontWeight(.bold)
                            .font(.system(size: 60))
                            .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(25)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.yellow)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.white, lineWidth: 3)
                            )
                    }
                   // .border(Color.white, width: 5)
                    .padding()
                    .shadow(radius: 10)
                    .shadow(radius: 10)
                }.padding(.bottom, 40.0).frame(width: .infinity, height:800, alignment: .center)
                //.background(Color.gray)
                Spacer()
            }
        }
        
    }
    
}








struct TobiasView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
