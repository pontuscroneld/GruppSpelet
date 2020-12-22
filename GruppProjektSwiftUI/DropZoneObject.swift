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
    @Binding var animate : Bool

    
    var body: some View {
     
       
            Image("\(objectName).black").resizable()
                .aspectRatio(1.1, contentMode: .fit)
//                .frame(width: 100, height: 100, alignment: .center)
                .scaleEffect(animate ? 1.7 : 1.1)
    //            .animation(
    //                Animation.spring()
    //            )
                .onChange(of: objectName, perform: { _ in
//                    animateDropZone()
                })
//                .padding(20)
                .onAppear(){
                    animateDropZone()
                }
    }
    
    func animateDropZone() {
        withAnimation(
            Animation.interactiveSpring()
        ){animate.toggle()}

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation(
                Animation.easeInOut(duration: 0.2)
            ){animate.toggle()}
        }
    }
}

struct DropZoneObject_Previews: PreviewProvider {
    
    static var previews: some View {
        DropZoneObject(objectName: "triangle", animate: .constant(false))
    }
}
