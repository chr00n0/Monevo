//
//  CategoryView.swift
//  Monevo
//
//  Created by Emil Piórkowski on 21/08/2026.
//

import SwiftUI

struct CategoryView: View {
        @State private var isPresented = false
        @State private var vm = CategoryViewModel()
        let category: CategoryTab

        var body: some View {
            NavigationStack {
                Group {
                    if vm.expenses.isEmpty {
                        Text("Brak wydatków w danej kategorii")
                    } else {
                        List(vm.expenses) { expense in
                            Button(expense.title ?? "unknown") {
                                isPresented = true
                            }
                        }
                    }
                }
                .searchable(text: $vm.searchKeyword)
                .onAppear{vm.fetchExpenses(for: category)}
            }
            
            .sheet(isPresented: $isPresented) {
                if let expense = vm.selectedExpense {
                    ExpenseSheet(expense: expense) {
                        vm.selectedExpense = nil
                    }
                }
            }
        }
    }

#Preview {
    CategoryView(category: .currentExpenses)
}
