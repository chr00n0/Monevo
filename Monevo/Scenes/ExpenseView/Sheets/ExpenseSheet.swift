//
//  ExpenseSheet.swift
//  Monevo
//
//  Created by Emil Piórkowski on 21/08/2026.
//

import SwiftUI

struct ExpenseSheet: View {
    let expense: Expense
    var onDismiss: () -> Void
    
    var body: some View {
        VStack {
            Text(expense.title ?? "")
            Text(String(expense.amount))
            Text(expense.category ?? "")
        }
        .onDisappear(perform: onDismiss)
    }
}

