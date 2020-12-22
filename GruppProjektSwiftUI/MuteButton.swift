//
//  MuteButton.swift
//  GruppProjektSwiftUI
//
//  Created by Pontus Croneld on 2020-12-22.
//

import SwiftUI

struct MuteButton: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.red)
                .frame(width: 96 , height: 96)
                .shadow(radius: 10)
            
            Image(systemName: "speaker.slash.circle")
                .resizable()
                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
        }
    }
}

struct MuteButton_Previews: PreviewProvider {
    static var previews: some View {
        MuteButton()
            .previewLayout(.sizeThatFits)
    }
}
