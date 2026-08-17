//
//  ExpenseView.swift
//  Monevo
//
//  Created by Emil Piórkowski on 17/08/2026.
//

import SwiftUI

struct ExpenseView: View {

    @State private var viewModel = ExpenseViewModel()
    @State private var isPresented = false

    var body: some View {
        if viewModel.expenses.isEmpty {

            VStack {
                Text("Brak wydatków")
                Button {
                    isPresented = true
                } label: {
                    Label("Dodaj wydatek", systemImage: "plus")
                }
            }
        } else {
            NavigationStack {

            }
            .sheet(
                isPresented: $isPresented) {
                    VStack {
                        HStack {
                            Text("Nazwa wydatku")
                            TextField("Nazwa wydatku", text: $viewModel.title)
                        }
                    }
                }
        }
    }

}

#Preview {
    ExpenseView()
}
