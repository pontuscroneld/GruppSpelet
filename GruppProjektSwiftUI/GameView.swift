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
    
    // The objects available
    @State var availableObjects = [String]()

    var dataLoader = DataLoader()
    @Binding var chosenCategory : String
    
    @State private var isGameEnded = false
    
    @State private var isShowingmenuDraft = false
    @State var appeared: Double = 0
    
   
    var body: some View {
        if(isShowingmenuDraft == true)
        {
            MenuDraft()
                .opacity(appeared)
                .animation(.easeInOut(duration: 1), value: appeared)
                .onAppear {self.appeared = 1.0}

        }else{
            ZStack{
                Image("bg3")
                    .resizable()
                    .ignoresSafeArea()
                    .zIndex(0)
                
                VStack{
                    HStack{
                        Button(action: {
                           isShowingmenuDraft = true
                        }) {
                            Image(systemName: "arrowshape.turn.up.left.fill")
                                .resizable()
                                .frame(width: 96, height: 96)
                                .foregroundColor(.white)
                        }
                        .padding(.leading, 90.0)
                        .padding(.top, 60)
                        Spacer()
                        Button(action: MusicPlayer.shared.pausemusic) {
                            MuteButton()
                                .padding(.top, 60)
                                .padding(.trailing, 90)
                        }
                    }
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
                            DragObject(objectName: availableObjects[number], onChanged: objectMoved, onDrop: objectDropped)
                       
                                
                        }
                    }
                    .frame(minHeight: 100)
                   
                    Spacer()
                }
                
                endGameAlert(isShown: $isGameEnded, onPlayagain: startGame, onBack: startGame)
                
               
            }.onAppear(){
                startGame()
                MusicPlayer.shared.startBackgroundMusic()
        }

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
            
            // TODO: Check if there are any objects left in availableObjects and show new dropZoneObject
            if (availableObjects.count == 0)
            {
                isGameEnded = true
            }
            else{
                dropZoneObjectName = availableObjects.randomElement()!
            }
            
            // Animate dropZone
            
        
        case .bad:
            EffectPlayer.shared.effectSound(effect: "no")
        
        case .unknown:
            return 
        }
        
    }
    
    func startGame(){
        
        // TODO: Load the objects
       
        availableObjects = dataLoader.getObjects(chosenCategory: chosenCategory)
        print("CAT: " + chosenCategory)
        // TODO: Set which object should be dragged
        dropZoneObjectName = availableObjects.randomElement()!
        
        // Load some objects
        
    }
}



struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(chosenCategory: .constant("animals"))
    }
}

