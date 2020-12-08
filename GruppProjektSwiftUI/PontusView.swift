//
//  PontusView.swift
//  GruppProjektSwiftUI
//
//  Created by Pontus Croneld on 2020-11-27.
//

import SwiftUI

struct PontusView: View {
    
    @State var myshapes = ["square", "circle", "triangle", "star"]
    
    
    var body: some View {
    
        VStack {
            
            Spacer()
            
            DragObject(objectName: holeInTheMiddle())
                .overlay(Color.clear)
                .allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                .zIndex(1)
                
            
            Spacer()
            
            HStack{
                
                
                
                ForEach(0..<4) { shape in
                    
                    DragObject(objectName: myshapes[shape])
                        .padding()
                        .zIndex(5)
                } // End loop
                
                Button(action: {
                    
                    let shuffledshapes = myshapes.shuffled()
                    
                    myshapes = shuffledshapes
                    
                }, label: {
                    Text("Shuffle")
                }).padding()
                
            }// End Hstack
           
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
            holeInTheMiddle()
        }
    }
    
    func holeInTheMiddle() -> String
    
    {
        
        var randomShape = myshapes.randomElement()! + ".black" ?? "missing"
        
        print(randomShape)
        return randomShape
    }
    
}

struct PontusView_Previews: PreviewProvider {
    static var previews: some View {
        PontusView()
    }
}
