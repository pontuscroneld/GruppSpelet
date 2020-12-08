//
//  GameView.swift
//  GruppProjektSwiftUI
//
//  Created by Mac on 12/8/20.
//

import SwiftUI

struct GameView: View {
    
    // the drop zone
    @State var dropZone: CGRect?
    
    // The drop zone object
    @State private var dropZoneObjectName = ""
    
    // The objects available
    @State private var availableObjects = [""]
    
    var body: some View {
        Text("This is the game view")
        VStack{
            Spacer()
                DropZoneObject(objectName: dropZoneObjectName)
                .overlay(
                    GeometryReader { geo in
                        Color.clear
                            .onAppear{
                                dropZone = geo.frame(in: .global)
                            }
                    }
                    
                   
                )
                
            Spacer()
            HStack{
                ForEach(0..<availableObjects.count, id: \.self) { number in
                    DragObject(objectName: availableObjects[number], onChanged: objectMoved, onEnded: objectDropped)
                }
            }
            Spacer()
        }
        .onAppear(){
            startGame()
        }
    }
    
    func objectMoved(location: CGPoint, objectName: String) -> DragState{
        print("Object beeing moved")
        
        // Check if the object is over the drop zone
        if (dropZone!.contains(location))  {
            
            if objectName == dropZoneObjectName {
                return .good
            } else {
                return .bad
            }
            
        } else {
            return .unknown
        }
    }
    
    func objectDropped(objectName: String) {
        print("Object dropped")
        // If the object is over the drop zone, remove it from the availableObjects array
        availableObjects.removeAll { (availableObject) -> Bool in
            return objectName == availableObject
        }
        
        // TODO: Check if there are any objects left in availableObjects and show new dropZoneObject
        dropZoneObjectName = availableObjects.randomElement()!
        
    }
    
    func startGame(){
        
        // TODO: Load the objects
        availableObjects = ["rectangle", "circle", "square"]
        
        // TODO: Set which object should be dragged
        dropZoneObjectName = availableObjects.randomElement()!
        
        // Load some objects
       
    }
    func endGame(){
        
    }
}



struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
