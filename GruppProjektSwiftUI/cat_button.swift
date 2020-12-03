//
//  cat_button.swift
//  GruppApp
//
//  Created by Tobias Lehning on 2020-11-30.
//

import SwiftUI

struct cat_button: View {
    
    @State var catName = ""
    
    var body: some View {
        
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 500.0, height: 100.0)
                    .foregroundColor(.gray)
                
                Button(action: {}) {
                    Text(catName)
                        .font(.largeTitle)
                }
                .frame(width: 500.0, height: 100.0)
                .foregroundColor(.white)
                
            }
            
        }
        
    }
}

struct cat_button_Previews: PreviewProvider {
    static var previews: some View {
        cat_button()
    }
}
