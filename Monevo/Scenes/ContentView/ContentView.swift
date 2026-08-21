//
//  ContentView.swift
//  Monevo
//
//  Created by Emil Piórkowski on 17/08/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "Wydatki"
    var body: some View {
        TabView(selection: $selectedTab) {
            ExpenseView()
                .tabItem {
                    Label("Wydatki", systemImage: "dollarsign.bank.building")
                }
            CategoryListView()
                .tabItem {
                    Label("Kategorie", systemImage: "bag")
                }
        }
    }
}

#Preview {
    ContentView()
}
