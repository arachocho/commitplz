//
//  ContentView.swift
//  ListActions
//
//  Created by 조아라 on 4/24/24.
//

import SwiftUI

struct ContentView: View {
    @State var numbers = [1,2,3,4]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(numbers, id: \.self) { number in
                    Text("\(number)")
                }
                .onMove(perform: moveRow)
                .onDelete(perform: { indexSet in
                    numbers.remove(atOffsets: indexSet)
                })
            }
            .navigationTitle("Number List")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Add") {
                        addItemtoRow()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
            }
        }
    }
}
    private func moveRow(source: IndexSet, detination: Int) {
        numbers.move(fromOffsets: source, toOffset: detination)
}

private func addItemtoRow() {
    numbers.append(Int.random(in: 5..<100))
}
}

#Preview {
    ContentView()
}
