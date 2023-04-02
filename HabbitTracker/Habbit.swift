//
//  Habbit.swift
//  HabbitTracker
//
//  Created by Denys Nazymok on 02.04.2023.
//

import Foundation

struct Habbit: Identifiable, Codable, Equatable {
    let id = UUID()
    let name: String
    let description: String
    var counter: Int = 0
}
