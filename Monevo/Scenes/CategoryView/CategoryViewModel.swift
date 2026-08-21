//
//  CategoryViewModel.swift
//  Monevo
//
//  Created by Emil Piórkowski on 21/08/2026.
//

import Foundation
import Observation
import CoreData

@Observable
final class CategoryViewModel {
    private(set) var listOfExpenses: [Expense] = []
    private(set) var error: String?
    
    var searchKeyword = "" {
        didSet {
            fetchCategory()
        }
    }
    
    func fetchCategory() {
        let context = PersistenceController.shared.container.viewContext
        let request = Expense.fetchRequest()
        
        do {
            if !searchKeyword.isEmpty {
                request.predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchKeyword)
            }
            listOfExpenses = try context.fetch(request)
        } catch {
            self.error = error.localizedDescription
        }
    }
}
