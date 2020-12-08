//
//  DropZoneObject.swift
//  GruppProjektSwiftUI
//
//  Created by Mac on 12/8/20.
//

import SwiftUI

struct DropZoneObject: View {
    var objectName: String
    
    var body: some View {
        Text(objectName)
            .frame(width: 100, height: 100, alignment: .center)
            .background(Color.gray)
            .allowsHitTesting(false)
    }
}

struct DropZoneObject_Previews: PreviewProvider {
    static var previews: some View {
        DropZoneObject(objectName: "Drop zone")
    }
}
