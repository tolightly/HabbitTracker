//
//  Habbits.swift
//  HabbitTracker
//
//  Created by Denys Nazymok on 02.04.2023.
//

import Foundation

class Habbits: ObservableObject {
    @Published var habbitsList: [Habbit] {
        didSet {
            if let encoded = try? JSONEncoder().encode(habbitsList) {
                UserDefaults.standard.set(encoded, forKey: "Habbits")
            }
        }
    }
    init() {
        if let loadHabbits = UserDefaults.standard.data(forKey: "Habbits") {
            if let decodedHabbits = try? JSONDecoder().decode([Habbit].self, from: loadHabbits) {
                habbitsList = decodedHabbits
                return
            }
        }
        habbitsList = [Habbit]()
    }
}
