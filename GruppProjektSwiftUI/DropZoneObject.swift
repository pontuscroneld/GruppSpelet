//
//  DropZoneObject.swift
//  GruppProjektSwiftUI
//
//  Created by Mac on 12/8/20.
//

import SwiftUI

struct DropZoneObject: View {
    var objectName: String
       
    @State private var animationAmount: CGFloat = 1
    @State private var animate = false
    
    var body: some View {
        Image("\(objectName).black").resizable()
            .frame(width: 100, height: 100, alignment: .center)
            .scaleEffect(animate ? 1.7 : 1)
            .animation(
                Animation.linear(duration: 0.4)
            )
//            .overlay(
//                Circle()
//                    .stroke(Color.red, lineWidth: 3)
//                    .shadow(color: Color.red, radius: 20, x: 20, y: 20)
//                    .scaleEffect(animationAmount)
//
//                    .opacity(Double(2 - animationAmount))
//                    .animation(
//                        Animation.easeInOut(duration: 1)
//                            .repeatCount(1, autoreverses: false)
//                    )
//            )
            .padding(20)
            .onAppear(){
//                animationAmount += 1
                animateDropZone()
            }
    }
    
    func animateDropZone(){
        withAnimation(
            Animation.interactiveSpring()
        ){animate.toggle()}

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(
                Animation.easeInOut(duration: 0.4)
            ){animate.toggle()}
        }
    }
}

struct DropZoneObject_Previews: PreviewProvider {
    static var previews: some View {
        DropZoneObject(objectName: "triangle")
    }
}
