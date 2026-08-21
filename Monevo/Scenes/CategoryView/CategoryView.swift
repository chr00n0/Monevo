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
    
    var body: some View {
        if vm.listOfExpenses.isEmpty {
            Text("Brak wydatków w danej kategorii")
        } else {
            NavigationStack {
                List(vm.listOfExpenses) {
                    Button($0.title ?? "unknown") {
                        
                    }
                }
            }
            .searchable(text: $vm.searchKeyword)
            .onAppear(perform: vm.fetchCategory)
        }
            
            
    }

}

#Preview {
    CategoryView()
}
