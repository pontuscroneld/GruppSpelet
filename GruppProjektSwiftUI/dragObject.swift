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
    
    var objectName: String
    var targetSize : CGSize!
    
    // Functions for handling when the object is moved and dropped
    var onChanged: ((CGPoint, String) -> DragState)?
    var onEnded: ((CGPoint,String) -> Void)?

    var body: some View {
        Image(objectName)
            .resizable()
            .frame(width: 100, height: 100)
            .offset(dragAmount)
            .zIndex(dragAmount == .zero ? 0 : 10)
            .gesture(
                DragGesture(coordinateSpace: .global)
                    .onChanged {
                        self.dragAmount = CGSize(width: $0.translation.width, height: $0.translation.height)
                        self.dragState = self.onChanged?($0.location, self.objectName) ?? .unknown
                    }
                    .onEnded {
                        if self.dragState == .good {
                            self.onEnded?($0.location, objectName)
                        }
                        self.dragAmount = .zero
                    }
            )
    }
}

struct dragObject_Previews: PreviewProvider {
    static var previews: some View {
        DragObject(objectName: "circle")
    }
}
