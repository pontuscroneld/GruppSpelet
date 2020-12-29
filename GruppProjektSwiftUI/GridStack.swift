//
//  GridStack.swift
//  GruppProjektSwiftUI
//
//  Created by Mac on 12/21/20.
//

import SwiftUI


struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let items: [String]
    let content: (Int, Int, Int, Binding<Double>) -> Content
//    var index: Int
    @State var zIndex = [0.0, 0.0, 0.0]

    var body: some View {
        
        Spacer()
        VStack {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack {
                    ForEach(0 ..< self.columns, id: \.self) { column in
                        self.content(row, column, columns, $zIndex[row])
                    }
                }
                .zIndex(zIndex[row])
                
            }
        }
    
        Spacer()
    }

    init(columns: Int, items: [String], @ViewBuilder content: @escaping (Int, Int, Int, Binding<Double>) -> Content) {
        self.rows = items.count / columns + items.count % columns
        self.columns = columns
        self.items = items
        self.content = content
        
        // Experimental stuff
        
//        self.zIndex = [Double]()
//        print(zIndex)
//        var tempArray = [Double]()
//        
//        for index in 0...rows {
//            print(index)
//            tempArray.append(0.0)
//        }
//        print(tempArray)
//        _zIndex = State(initialValue: tempArray)
//        print("Final:  \(zIndex)")
        
    }
}
