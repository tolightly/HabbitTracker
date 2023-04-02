//
//  AddNewHabbitView.swift
//  HabbitTracker
//
//  Created by Denys Nazymok on 02.04.2023.
//

import SwiftUI

struct AddNewHabbitView: View {
    @State private var name: String = ""
    @State private var description: String = ""
    @ObservedObject var habbits: Habbits
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section {
                Text("Enter title name for your habbit")
                TextField("Enter title name for your habbit", text: $name)
            }
            Section {
                Text("Enter description for your habbit")
                TextField("Enter description for your habbit", text: $description)
            }
            Button("Add new habbit") {
                let newHabbit = Habbit(name: name, description: description)
                habbits.habbitsList.append(newHabbit)
                dismiss()
            }
        }
    }
}

struct AddNewHabbitView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewHabbitView(habbits: Habbits())
    }
}
