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

    var dataLoader = DataLoader()
    @Binding var chosenCategory : String
    
    @State private var isGameEnded = false
    
    @State private var isShowingmenuDraft = false
    @State var appeared: Double = 0
    
   
    var body: some View {
        
        if(isShowingmenuDraft == true){
            NewMenu()
                .opacity(appeared)
                .animation(.easeInOut(duration: 1), value: appeared)
                .onAppear {self.appeared = 1.0}

        }else{
            GeometryReader { geo in
                ZStack{
                    Image("bg3")
                        .resizable()
                        .ignoresSafeArea()
                        .aspectRatio(contentMode: .fill)
                        
                    // Top level VStack
                    VStack{
            
                        // Menu header and drop zone container
                        VStack{
                            
                            // Menu header
                            HStack{
                                Button(action: {
                                   isShowingmenuDraft = true
                                }) {
                                    Image(systemName: "arrowshape.turn.up.left.circle")
                                        .resizable()
                                        .frame(width: 96, height: 96)
                                        .foregroundColor(.white)
                                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                }

                                .padding(.leading, 90.0)
                                .padding(.top, 60)
                                
                                Spacer()
                                Image("bazug")
                                    .resizable()
                                    .frame(width: 100, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(.top,70)
                                
                                Spacer()
                                Button(action: MusicPlayer.shared.pausemusic) {
                                    MuteButton()
                                        .padding(.top, 60)
                                        .padding(.trailing, 90)
                                }
                            }
                            Spacer()
                            
                            // Drop zone
                            DropZoneObject(objectName: dropZoneObjectName, animate: $dropzoneIsAnimating)
                                
                                .frame(width: geo.size.width / 4, height: geo.size.width / 4)
//                                .background(Color.red)
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
                        
                        
                    // Available ocbjects VStack
                        VStack(spacing: 0){
                            GridStack(columns: 3, items: availableObjects) { row, col, maxColumns in
                                let index = (row * maxColumns + col)
                                if index < availableObjects.count {
                                    DragObject(objectName: availableObjects[index], onChanged: objectMoved, onDrop: objectDropped)
                                        .frame(width: geo.size.width / 4, height: geo.size.width / 4)
//                                        .background(Color.blue)
                                }
                            }
                        } // Vstack
                        .frame(minWidth: geo.size.width, idealWidth: geo.size.width, maxWidth: geo.size.width, minHeight: geo.size.height / 2, idealHeight: geo.size.height / 2, maxHeight: geo.size.height / 2, alignment: .top)
                            
                       
                    }// VStack
                    .frame(width: geo.size.width, height: geo.size.height / 2, alignment: .center)
                   
                    // End game modal window
                    endGameAlert(isShown: $isGameEnded, onPlayagain: startGame, onBack:{ isShowingmenuDraft = true})
                    
                } // ZStack
                .onAppear(){
                
                    startGame()
                    //MusicPlayer.shared.startBackgroundMusic()
                    //MusicPlayer.shared.startBackgroundMusic()
                    
                    
                }
                .frame(minWidth: geo.size.width, maxHeight: geo.size.height)
                        
            
            } // Geo reader
        } // Else statement
    } // Body
    
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
    
//    func objectMoved(frame: CGRect, objectName: String) -> DragState{
    func objectMoved(frame: CGRect, objectName: String) -> DragState {
        
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
            EffectPlayer.shared.effectSound(effect: "oops")
        
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
        
        // Animate drop zone
        animateDropZone()
        
        
    }
    
    func loadObjects(){
        // TODO: Load list of object names from file
        
        
    }
}



struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(chosenCategory: .constant("animals"))
    }
}

