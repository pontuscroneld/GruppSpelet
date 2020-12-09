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
    
    @State private var isGameEnded = false
    
    var body: some View {
        Text("This is the game view")
        ZStack{
            VStack{
                Spacer()
                DropZoneObject(objectName: dropZoneObjectName)
                    .padding(10)
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
            
            endGameAlert(isShown: $isGameEnded, onPlayagain: startGame, onBack: startGame)
        }.onAppear(){
            startGame()
        }
    }
    
    func objectMoved(frame: CGRect, objectName: String) -> DragState{
        
        print("Object beeing moved")
        print(frame)
        print(dropZone)
        
        if dropZone!.contains(frame){
            print("Dropzone contains object")
            if objectName == dropZoneObjectName {
                return .good
            } else {
                return .bad
            }

        } else {
            return .unknown
        }
        
        // Check if the object is over the drop zone
//        if (dropZone!.contains(location))  {
//
//            if objectName == dropZoneObjectName {
//                return .good
//            } else {
//                return .bad
//            }
//
//        } else {
//            return .unknown
//        }
     
    }
    
    func objectDropped(objectName: String) {
        print("Object dropped")
        // If the object is over the drop zone, remove it from the availableObjects array
        availableObjects.removeAll { (availableObject) -> Bool in
            return objectName == availableObject
        }
    
        // TODO: Check if there are any objects left in availableObjects and show new dropZoneObject
        if (availableObjects.count == 0)
        {
            isGameEnded = true
        }
        else{
            dropZoneObjectName = availableObjects.randomElement()!
        }
        
    }
    
    func startGame(){
        
        // TODO: Load the objects
        availableObjects = ["triangle", "star", "circle", "square"]
        
        // TODO: Set which object should be dragged
        dropZoneObjectName = availableObjects.randomElement()!
        
        // Load some objects
        
    }
}



struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
