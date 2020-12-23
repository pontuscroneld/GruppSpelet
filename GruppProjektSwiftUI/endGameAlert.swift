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
        VStack(){
            Spacer()
            HStack(spacing: 20) {
                Spacer()
                Button(action: {
                    self.isShown = false
                    self.onBack()
                }, label: {
                    Image(systemName: "arrowshape.turn.up.backward.circle")
                        .resizable()
                        .frame(width: screenSize.width * 0.1, height: screenSize.width * 0.1)
                        .foregroundColor(.red)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                })
                .padding()
                Spacer()
                Button(action: {
                    self.isShown = false
                    self.onPlayagain()
                }, label: {
                    Image(systemName: "play.circle")
                        .resizable()
                        .frame(width: screenSize.width * 0.1, height: screenSize.width * 0.1)
                        .foregroundColor(.green)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                })
                .padding()
                Spacer()
            }
        }
        .frame(width: screenSize.width * 0.5, height: screenSize.height * 0.4)
        .background(Image("grattis")
                        .resizable()
                        .aspectRatio(contentMode: .fill))
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
