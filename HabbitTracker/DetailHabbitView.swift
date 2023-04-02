//
//  DetailHabbitView.swift
//  HabbitTracker
//
//  Created by Denys Nazymok on 02.04.2023.
//

import SwiftUI

struct DetailHabbitView: View {
    @State var habbit: Habbit
    @ObservedObject var habbits: Habbits
    @State var index: Int = 0
    
    var body: some View {
        Form {
            Text("\(habbit.name)")
            Text("\(habbit.description)")
            Text("\(habbit.counter)")
            Button("Add counter") {
                habbit.counter += 1
            }
        }
        .onAppear {
            index = habbits.habbitsList.firstIndex(of: habbit) ?? 0
        }
        .onDisappear {
            let changedHabbit = habbit
            habbits.habbitsList[index] = changedHabbit
        }
    }
}

struct DetailHabbitView_Previews: PreviewProvider {
    static var previews: some View {
        DetailHabbitView(habbit: Habbit(name: "Testing", description: "Testing-testing", counter: 3), habbits: Habbits())
    }
}
