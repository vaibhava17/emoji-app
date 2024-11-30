//
//  ContentView.swift
//  Emoji Lover
//
//  Created by Vaibhav Agarwal on 30/11/24.
//

import SwiftUI
import SwiftData

enum Emoji: String, CaseIterable {
    case 😂,😍,😘,😭
}

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State var selection: Emoji = .😂

    var body: some View {
        NavigationView{
            VStack {
                Text(selection.rawValue).font(.system(size: 150))
                Picker("Select Emoji", selection: $selection){
                    ForEach(Emoji.allCases, id: \.self) { emoji in
                        Text(emoji.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            .padding()
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
