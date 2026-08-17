//
//  ExpenseViewModel.swift
//  Monevo
//
//  Created by Emil Piórkowski on 17/08/2026.
//

import Foundation
import CoreData
import Observation


struct CategoryTab: Identifiable, Hashable {
    var id = UUID()
    var title: String
}

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
    
    private(set) var categories: [CategoryTab] = [
        CategoryTab(title: "Wydatki bieżące"),
        CategoryTab(title: "Rozrywka i wypoczynek"),
        CategoryTab(title: "Transport"),
        CategoryTab(title: "Rachunki"),
        CategoryTab(title: "Odzież i dodatki"),
        CategoryTab(title: "Dom"),
        CategoryTab(title: "Zdrowie"),
        CategoryTab(title: "Edukacja"),
        CategoryTab(title: "Wydatki inne")
    ]

    var selectedCategory: CategoryTab?
    
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
            let expense = Expense()
            expense.id = UUID()
            expense.title = title
            expense.note = note
            expense.category = selectedCategory?.title
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
        selectedCategory = nil
    }

}
