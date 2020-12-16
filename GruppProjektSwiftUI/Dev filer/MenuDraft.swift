//
//  MenuDraft.swift
//  GruppProjektSwiftUI
//
//  Created by Pontus Croneld on 2020-12-16.
//

import SwiftUI

struct MenuDraft: View {
    
    var animals = ["cat", "dog", "horse", "mouse", "duck", "rabbit"]
    var ocean = ["shark", "crab", "dolphin", "whale", "turtle", "octopus"]
    var farm = ["cow", "horse", "chicken", "rooster", "pig", "turkey"]
    var africa = ["lion", "elephant", "snake", "crocodile", "camel", "giraffe"]
    var dogs = ["dog1", "dog2", "dog3", "dog4", "dog5", "dog6"]
    var birds = ["parrot", "gull", "owl", "hummingbird", "swan", "duck"]
    
    @State var categories = ["animals", "ocean", "farm", "africa", "dogs", "birds"]
    @State var colors : [Color] = [.green, .orange, .red, .yellow, .blue, .purple]
    
    var body: some View {
        
        VStack {
            ForEach(0..<categories.count) { category in
                
                Button(action: {
                    
                }) {
                    Text(categories[category])
                } .padding()
                .frame(width: 100, height: 50)
                .background(colors[category])
                .foregroundColor(.white)

            }

        } // End VStack
        
    }
}

struct MenuDraft_Previews: PreviewProvider {
    static var previews: some View {
        MenuDraft()
    }
}
