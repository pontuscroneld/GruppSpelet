//
//  dragObject.swift
//  DragNDropTest
//
//  Created by Erik Persson on 2020-11-27.
//

import SwiftUI

enum DragState{
    case unknown
    case good
    case bad
}


struct DragObject: View {
    
    @State var dragAmount = CGSize.zero
    @State private var dragState = DragState.unknown
    @State var frame: CGRect?
    
    @State private var animate = true
    var objectName: String
    
    @Binding var parentZIndex: Double
    
    // Functions for handling when the object is moved and dropped
    var onChanged: ((CGRect, String) -> DragState)?
    var onDrop: ((String, DragState) -> Void)?

    var body: some View {
        
        GeometryReader { geo in
            Image(objectName)
                .resizable()
                .aspectRatio(1.1, contentMode: .fit)
                .offset(dragAmount)
                .animation(animate ? .spring() : nil)
                .gesture(
                    DragGesture(coordinateSpace: .global)
                        .onChanged {
                            animate = false
                            self.dragAmount = CGSize(width: $0.translation.width, height: $0.translation.height)
                            
                            frame = geo.frame(in: .global).offsetBy(dx: $0.translation.width, dy: $0.translation.height)

                            self.dragState = self.onChanged?(frame!, self.objectName) ?? .unknown
                            
                            self.parentZIndex = 1
                            print("IN the object\(parentZIndex)")
                        }
                        .onEnded {_ in
                            // If dragState is not good, set animate to true
                            if dragState != .good {
                                animate = true
                            }
                            
                            self.dragAmount = .zero
                            self.parentZIndex = .zero
                            self.onDrop?(objectName, dragState)
                        }
                )
                .onAppear{
                    frame = geo.frame(in: .global)
                }
            }
//            .frame(width: 100, height: 100)
            .zIndex(dragAmount == .zero ? 0 : 10)
    }
    
}

struct dragObject_Previews: PreviewProvider {
    static var previews: some View {
        DragObject(objectName: "circle", parentZIndex: .constant(0.0))
    }
}
