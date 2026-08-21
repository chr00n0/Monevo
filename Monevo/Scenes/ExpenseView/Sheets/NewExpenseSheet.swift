//
//  NewExpenseSheet.swift
//  Monevo
//
//  Created by Emil Piórkowski on 21/08/2026.
//

import SwiftUI

struct NewExpenseSheet: View {

    @State var vm = ExpenseViewModel()
    
     var body: some View {
        Form {
            Section("Wydatek") {
                TextField("Nazwa wydatku", text: $vm.title)

                TextField("0.00", text: $vm.amount)
                    .keyboardType(.decimalPad)

                TextField("Notatka", text: $vm.note)
            }

            Section("Kategoria") {
                Picker("Kategorie", selection: $vm.selectedCategory) {
                    ForEach(CategoryTab.allCases) { category in
                        Text(category.rawValue)
                            .tag(category)
                    }
                }
            }
        }
 
    }
}

#Preview {
    NewExpenseSheet()
}
