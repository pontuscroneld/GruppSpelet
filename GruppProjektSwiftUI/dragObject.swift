//
//  dragObject.swift
//  DragNDropTest
//
//  Created by Erik Persson on 2020-11-27.
//

import SwiftUI

struct dragObject: View {
    @State var dragAmount = CGSize.zero
    
    @State var startDrag : CGSize?
    
    var targetSize : CGSize!

    var body: some View {
        Image("frog")
            .resizable()
            .frame(width: 100, height: 100)
            .offset(dragAmount)
            .gesture(
                DragGesture(coordinateSpace: .global)
                    .onChanged{ gesture in
                        
                        if(startDrag == nil)
                        {
                            startDrag = dragAmount
                        }
                        
                        self.dragAmount = CGSize(width: gesture.translation.width + startDrag!.width, height: gesture.translation.height + startDrag!.height)
                        
                        
                        var diffX = abs(dragAmount.width - targetSize.width)
                        var diffY = abs(dragAmount.height - targetSize.height)

                        
                        var totalDiff = diffX + diffY
                        
                        print(totalDiff)
                        if(diffX + diffY < 50)
                        {
                            print("YEY HIT")
                        }
                        
                        
                    }
                    .onEnded{ gesture in
                        //self.dragAmount = CGSize(width: gesture.translation.width, height: gesture.translation.height)
                        
                        startDrag = nil
                        
                        //self.dragAmount = .zero
                    }
            )
        
        
    }
}

struct dragObject_Previews: PreviewProvider {
    static var previews: some View {
        dragObject()
            .previewLayout(.sizeThatFits)
    }
}
