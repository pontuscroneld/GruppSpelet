//
//  PontusView.swift
//  GruppProjektSwiftUI
//
//  Created by Pontus Croneld on 2020-11-27.
//

import SwiftUI

struct PontusView: View {
    var body: some View {
    
        VStack {
            
            Spacer()
            
            HStack {
                Image("square").resizable().frame(width: 200, height: 200).padding()
                Image("circle").resizable().frame(width: 200, height: 200).padding()
            }
           
            HStack {
                Image("star").resizable().frame(width: 200, height: 200).padding()
                Image("triangle").resizable().frame(width: 200, height: 200).padding()
            }
           
            
            
            Spacer()
            
            HStack{
                Button(action: {
                    
                    MusicPlayer.shared.pausemusic()
                //Link to Game 1
                    
                }, label: {
                    Text("Djur")
                    
                    
                })
                .padding(75)
                
                Button(action: {
                    
                    EffectPlayer.shared.effectSound(effect: "yes")
                //Link to Game 1
                    
                }, label: {
                    Text("Bra ljud")
                }).padding(75)
            }
            
            
            
            HStack{
                
                Button(action: {
                //Link to Game 1
                    
                    EffectPlayer.shared.effectSound(effect: "no")
                    
                    
                }, label: {
                    Text("Dåligt ljud")
                }).padding(75)
                
                Button(action: {
                //Link to Game 1
                    
                }, label: {
                    Text("Fordon")
                }).padding(75)
                
                
                
            }
            
            Spacer()
            
        }.onAppear(){
            MusicPlayer.shared.startBackgroundMusic()
        }
    }
}

struct PontusView_Previews: PreviewProvider {
    static var previews: some View {
        PontusView()
    }
}
