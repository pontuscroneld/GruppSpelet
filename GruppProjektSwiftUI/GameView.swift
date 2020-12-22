//
//  GameView.swift
//  GruppProjektSwiftUI
//
//  Created by Mac on 12/8/20.
//

import SwiftUI

struct GameView: View {
    
    // The drop zone
    @State var dropZone: CGRect?
    
    // The drop zone object
    @State private var dropZoneObjectName = ""
    @State private var dropzoneIsAnimating = false
    
    // The objects available
    @State var availableObjects = [String]()
   
    
    @State private var isGameEnded = false
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                Image("bg3")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
                   
                VStack(){
//                    Spacer()
                    
                    // Drop zone VStack
                    VStack{
                        DropZoneObject(objectName: dropZoneObjectName, animate: $dropzoneIsAnimating)
                            .background(Color.red)
    //                        .frame(height: geo.size.height / 5)
                            .frame(width: geo.size.width / 4, height: geo.size.width / 4)
        //                    .scaleEffect(dropzoneIsAnimating ? 1.7 : 1)
                            .padding(30)
                            .overlay(
                                GeometryReader { geo in
                                    Color.clear
                                        .onAppear{
                                            dropZone = geo.frame(in: .global)
                                        }
                                }
                            )
                        
                    }
                    
                    .frame(minWidth: geo.size.width, idealWidth: geo.size.width, maxWidth: geo.size.width, minHeight: geo.size.height / 2, idealHeight: geo.size.height / 2, maxHeight: geo.size.height / 2, alignment: .center)
//                    .background(Color.pink)
                    
                    
                    VStack(spacing: 0){
                        GridStack(columns: 3, items: availableObjects) { row, col, maxColumns in
                            let index = (row * maxColumns + col)
                            if index < availableObjects.count {
                                DragObject(objectName: availableObjects[index], onChanged: objectMoved, onDrop: objectDropped)
                                    .background(Color.blue)
                                    .frame(width: geo.size.width / 4, height: geo.size.width / 4)
                            }
                        }
//                        .frame(maxWidth: geo.size.width, minHeight: geo.size.height / 2, alignment: .top)
                        .background(Color.green)

                        Spacer()
                    }
                    .frame(minWidth: geo.size.width, idealWidth: geo.size.width, maxWidth: geo.size.width, minHeight: geo.size.height / 2, idealHeight: geo.size.height / 2, maxHeight: geo.size.height / 2, alignment: .top)
                    
                    
//                    HStack{
//                        ForEach(0..<availableObjects.count, id: \.self) { number in
//                            DragObject(objectName: availableObjects[number], onChanged: objectMoved, onDrop: objectDropped)
//                                .background(Color.blue)
//                                .frame(height: geo.size.height / 5)
//
//
//                        }
//                    }
//                    .frame(minHeight: 100)
                   
//                    Spacer()
                }
//                .frame(alignment: .center)
                
                endGameAlert(isShown: $isGameEnded, onPlayagain: startGame, onBack: startGame)
            }.onAppear(){
            
                startGame()
                //MusicPlayer.shared.startBackgroundMusic()
            }
            .frame(minWidth: geo.size.width, maxHeight: geo.size.height)
        }
        
    }
    
    func animateDropZone(){
        withAnimation(
            Animation.interactiveSpring()
        ){dropzoneIsAnimating.toggle()}

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation(
                Animation.easeInOut(duration: 0.2)
            ){dropzoneIsAnimating.toggle()}
        }
    }
    
    func objectMoved(frame: CGRect, objectName: String) -> DragState {
        
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
    }
    
    func objectDropped(objectName: String, dragState: DragState) {
       
        switch dragState {
        case .good:
            // If the drop is good, remove from array
            availableObjects.removeAll { (availableObject) -> Bool in
                return objectName == availableObject
            }
            
            // Play sound
            EffectPlayer.shared.effectSound(effect: "yes")
            
            // Animate drop zone
            animateDropZone()
            
            // TODO: Check if there are any objects left in availableObjects and show new dropZoneObject
            if (availableObjects.count == 0)
            {
                isGameEnded = true
            }
            else{
                dropZoneObjectName = availableObjects.randomElement()!
            }
            
       
            
        
        case .bad:
            EffectPlayer.shared.effectSound(effect: "no")
        
        case .unknown:
            return 
        }
        
    }
    
    func startGame(){
        
        // TODO: Load the objects
       
        availableObjects = ["cat", "dog", "rabbit", "horse", "duck", "mouse"]
        
        // TODO: Set which object should be dragged
        dropZoneObjectName = availableObjects.randomElement()!
        
        // Load some objects
        
        // Animate drop zone
        animateDropZone()
        
        
    }
    
    func loadObjects(){
        // TODO: Load list of object names from file
        
        
        // LOAD TEST DATA
        let shapes = ["cat", "dog", "rabbit", "horse", "duck", "mouse"]
    }
}



struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(availableObjects: ["shark", "camel", "turkey"])
    }
}
