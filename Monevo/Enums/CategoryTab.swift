//
//  CategoryTab.swift
//  Monevo
//
//  Created by Emil Piórkowski on 21/08/2026.
//

import Foundation

enum CategoryTab: String, Identifiable, CaseIterable {
    var id: String { rawValue }
    case currentExpenses = "Wydatki bieżące"
    case entertainmnet = "Rozrywka i wypoczynek"
    case transportation = "Transport"
    case bills = "Rachunki"
    case clothes = "Odzież i dodatki"
    case house = "Dom"
    case health = "Zdrowie"
    case education = "Edukacja"
    case otherExpenses = "Wydatki inne"
}
