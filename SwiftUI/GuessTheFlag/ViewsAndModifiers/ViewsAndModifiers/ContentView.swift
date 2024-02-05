//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Шермат Эшеров on 9/1/24.
//

import SwiftUI


struct GridStack<Content: View>: View {
    
    let rows: Int
    let columns: Int
    
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0...rows, id: \.self) { rows in
                HStack {
                    ForEach(0...columns, id: \.self) { columns in
                        content(rows, columns)
                    }
                }
            }
        }
    }
}

extension View {
    func createGrid(row: Int, column: Int) -> some View
    {
        GridStack(rows: row, columns: column) { row, column in
            Text("R:\(row) C:\(column)")
        }
    }
}

struct ContentView: View {
    
    var body: some View {
        ZStack {
            
        }.createGrid(row: 5, column: 5)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
