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
    
    var objectName: String
    
    // Functions for handling when the object is moved and dropped
    var onChanged: ((CGRect, String) -> DragState)?
    var onEnded: ((String) -> Void)?

    var body: some View {
        
        GeometryReader { geo in
            Image(objectName).resizable()
                .offset(dragAmount)
                .animation(dragAmount == .zero ? .spring() : nil)
                .zIndex(dragAmount == .zero ? 0 : 10)
                .gesture(
                    DragGesture(coordinateSpace: .global)
                        .onChanged {
                            self.dragAmount = CGSize(width: $0.translation.width, height: $0.translation.height)
                            
                            frame = geo.frame(in: .global).offsetBy(dx: $0.translation.width, dy: $0.translation.height)

                            self.dragState = self.onChanged?(frame!, self.objectName) ?? .unknown
                        }
                        .onEnded {_ in
                            if self.dragState == .good {
                                self.onEnded?(objectName)
                                EffectPlayer.shared.effectSound(effect: "yes")
                            }
                            if self.dragState == .bad{
                                EffectPlayer.shared.effectSound(effect: "no")
                            }
                            
                            self.dragAmount = .zero
                        }
                )
                .onAppear{
                    frame = geo.frame(in: .global)
                }
            }
            .frame(width: 100, height: 100)
    
    }
    
}

struct dragObject_Previews: PreviewProvider {
    static var previews: some View {
        DragObject(objectName: "circle")
    }
}
