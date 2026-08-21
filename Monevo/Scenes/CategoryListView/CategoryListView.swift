//
//  CategoryListView.swift
//  Monevo
//
//  Created by Emil Piórkowski on 21/08/2026.
//

import SwiftUI

struct CategoryListView: View {
    
    @State private var vm = CategoryListViewModel()
    
    var body: some View {
        NavigationStack {
            List(vm.categories) { categories in
                NavigationLink {
                    CategoryView()
                } label: {
                    Text(categories.rawValue)
                }
            }
        }
      
    }
}

#Preview {
    CategoryListView()
}
