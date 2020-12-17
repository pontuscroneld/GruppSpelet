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
            Image("bg2")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            
            VStack {
                
                //TODO: Image("Logga")
                
                Spacer()
                
//                Text("VÄLJ KATEGORI")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color("AccentColor"))
//
//
//
                Spacer()
                    
                    
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    cat_button()
                }
                .padding(.bottom, 100)
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    cat_button()
                }
                .padding(.bottom, 100)
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    cat_button()
                }
                .padding(.bottom, 100)
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    cat_button()
                        
                }
                Spacer()
                
                    
                
            }
            
        }
    }
    
}


struct TobiasView_Previews: PreviewProvider {
    static var previews: some View {
      TobiasView()
    }
}
