//
//  ContentView.swift
//  GruppProjektSwiftUI
//
//  Created by Pontus Croneld on 2020-11-27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack
        {
            dragObject(dragAmount: CGSize(width: 100, height: 100), targetSize: CGSize(width: 100, height: 300))

        
            dragObject(dragAmount: CGSize(width: 100, height: 300))
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
