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
    
    var body: some View {
        Image("\(objectName).black").resizable()
            .frame(width: 100, height: 100, alignment: .center)
            .overlay(
                Circle()
                    .stroke(Color.red, lineWidth: 3)
                    .shadow(color: Color.red, radius: 20, x: 20, y: 20)
                    .scaleEffect(animationAmount)
                    
                    .opacity(Double(2 - animationAmount))
                    .animation(
                        Animation.easeInOut(duration: 1)
                            .repeatCount(1, autoreverses: false)
                    )
            )
            .padding(20)
//            .scaleEffect(animationAmount)
//            .animation(
//                Animation.easeOut(duration: 1)
//                    .repeatCount(3, autoreverses: true)
//            )
            .onAppear(){
                animationAmount += 1
               
            }
    }
}

struct DropZoneObject_Previews: PreviewProvider {
    static var previews: some View {
        DropZoneObject(objectName: "triangle")
    }
}
