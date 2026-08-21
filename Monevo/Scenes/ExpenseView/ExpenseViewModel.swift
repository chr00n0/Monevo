//
//  ExpenseViewModel.swift
//  Monevo
//
//  Created by Emil Piórkowski on 17/08/2026.
//

import Foundation
import CoreData
import Observation


@Observable
final class ExpenseViewModel {
    var title = ""
    var amount = ""
    var note = ""
    var searchKeyword = "" {
        didSet {
            fetchExpense()
        }
    }
    
    var selectedCategory: CategoryTab = .currentExpenses

    private(set) var expenses: [Expense] = []
    private(set) var error: String?
    
    let context = PersistenceController.shared.container.viewContext
    
    func fetchExpense() {
        let request = Expense.fetchRequest()
        if !searchKeyword.isEmpty {
            request.predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchKeyword)
        }
        do {
            expenses = try context.fetch(request)
        } catch {
            self.error = error.localizedDescription
        }
    }
    
    func save() {
        do {
            let expense = Expense(context: context)
            expense.id = UUID()
            expense.title = title
            expense.note = note
            expense.category = selectedCategory.rawValue
            expense.amount = Double(amount) ?? 0.00
            
            try context.save()
            clear()
        } catch {
            self.error = error.localizedDescription
        }
    }
    
    func delete(_ expense: Expense?) {
        do {
            guard let expense else { return }
            
            context.delete(expense)
            try context.save()
            fetchExpense()
        } catch {
            self.error = error.localizedDescription
        }
    }
    
    func clear() {
        title = ""
        amount = ""
        note = ""
        selectedCategory = .currentExpenses
    }

}
