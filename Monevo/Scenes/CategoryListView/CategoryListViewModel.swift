//
//  CategoryListViewModel.swift
//  Monevo
//
//  Created by Emil Piórkowski on 21/08/2026.
//

import Foundation
import Observation

@Observable
final class CategoryListViewModel {
    let categories = CategoryTab.allCases
}
