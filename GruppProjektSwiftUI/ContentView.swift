//
//  ContentView.swift
//  GruppProjektSwiftUI
//
//  Created by Pontus Croneld on 2020-11-27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello")
        }.onAppear(){
            MusicPlayer.shared.startBackgroundMusic()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
