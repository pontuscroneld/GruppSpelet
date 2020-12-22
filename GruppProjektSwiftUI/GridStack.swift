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
    let content: (Int, Int, Int) -> Content
//    var index: Int
//    @Binding var zIndex: Double

    var body: some View {
        Spacer()
        VStack {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack {
                    ForEach(0 ..< self.columns, id: \.self) { column in
                        self.content(row, column, columns)
                        
                    }
                }
//                .zIndex(zIndex)
                
            }
        }
    
        Spacer()
    }

    init(columns: Int, items: [String], @ViewBuilder content: @escaping (Int, Int, Int) -> Content) {
//        self.rows = rows
        self.rows = items.count / columns + items.count % columns
        self.columns = columns
        self.items = items
        self.content = content
//        self.zIndex = 0
    }
}
