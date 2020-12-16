//
//  jsonHelper.swift
//  GruppProjektSwiftUI
//
//  Created by Erik Persson on 2020-12-16.
//

import Foundation

struct GameCategory: Codable {
    let categoryName:String
    let objects:[String]
}

public class DataLoader {
    
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
}
