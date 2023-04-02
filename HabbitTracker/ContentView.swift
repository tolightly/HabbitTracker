//
//  ContentView.swift
//  HabbitTracker
//
//  Created by Denys Nazymok on 02.04.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habbits = Habbits()
    @State private var showAddNewHabbitSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(habbits.habbitsList) { habbit in
                        NavigationLink {
                            DetailHabbitView(habbit: habbit, habbits: habbits)
                        } label: {
                            Text(habbit.name)
                        }
                    }
                    .onDelete(perform: removeRow)
                }
                Button("Add new habbit") {
                    showAddNewHabbitSheet = true
                }
            }
            .sheet(isPresented: $showAddNewHabbitSheet) {
                AddNewHabbitView(habbits: habbits)
            }
        }
    }
    func removeRow(at offsets: IndexSet) {
        habbits.habbitsList.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
