//
//  CategoryViewModel.swift
//  Monevo
//
//  Created by Emil Piórkowski on 21/08/2026.
//

import CoreData
import Foundation
import Observation

@Observable
final class CategoryViewModel {
    private(set) var expenses: [Expense] = []
    private(set) var error: String?
    private var category: CategoryTab = .currentExpenses
    
    var searchKeyword = "" {
        didSet {
            fetchExpenses(for: category)
        }
    }
    var selectedExpense: Expense?
    let context = PersistenceController.shared.container.viewContext

    func fetchExpenses(for category: CategoryTab) {
        self.category = category
        let request = Expense.fetchRequest()
        if !searchKeyword.isEmpty {
            request.predicate = NSPredicate(format: "category == %@ AND title CONTAINS[cd] %@", category.rawValue, searchKeyword)
        } else {
            request.predicate = NSPredicate(format: "category == %@", category.rawValue)
        }
        
        do {
            expenses = try context.fetch(request)
        } catch {
            self.error = error.localizedDescription
        }
    }

}
