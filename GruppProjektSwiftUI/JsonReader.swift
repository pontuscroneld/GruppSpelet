//
//  jsonHelper.swift
//  GruppProjektSwiftUI
//
//  Created by Erik Persson on 2020-12-16.
//

import Foundation
import SwiftUI

struct GameCategory: Codable {
    let categoryName:String
    let objects:[String]
}

public class DataLoader: ObservableObject {
    
    @Published var gameCategories = [GameCategory]()
    
    init() {
        load()
    }
    
    func load() {
        if let fileLocation = Bundle.main.url(forResource: "categories", withExtension: "json"){
            
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([GameCategory].self , from: data)
                
                self.gameCategories = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
    func getObjects(chosenCategory: String) -> [String]{
        var counter = 0
        var availableObjects = [String]()
        for _ in gameCategories {
            if(gameCategories[counter].categoryName == chosenCategory)
            {
                availableObjects = gameCategories[counter].objects
            }
            counter += 1
        }
        availableObjects.shuffle()
        return availableObjects
    }
}
