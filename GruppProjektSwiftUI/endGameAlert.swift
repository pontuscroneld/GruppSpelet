//
//  endGameAlert.swift
//  GruppProjektSwiftUI
//
//  Created by Erik Persson on 2020-12-08.
//

import SwiftUI

struct endGameAlert: View {
    let screenSize = UIScreen.main.bounds
    @Binding var isShown: Bool
    var onPlayagain: () -> Void = { }
    var onBack: () -> Void = { }
    
    
    var body: some View {
        VStack(spacing: 20){
            Image("frog")
                .resizable()
            Spacer()
            HStack(spacing: 20) {
                Spacer()
                Button("Play Again") {
                    self.isShown = false
                    self.onPlayagain()
                }
                Spacer()
                Button("Back") {
                    self.isShown = false
                    self.onBack()
                }
                Spacer()
            }
        }
        .padding()
        .frame(width: screenSize.width * 0.5, height: screenSize.height * 0.3)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
        .offset(y: isShown ? 0 : screenSize.height)
        .animation(.spring())
        .shadow(color: Color.black ,radius: 15, x: 0, y: 0)
        
    }
}

struct endGameAlert_Previews: PreviewProvider {
    static var previews: some View {
        endGameAlert(isShown: .constant(true))
    }
}
