//
//  ExpenseView.swift
//  Monevo
//
//  Created by Emil Piórkowski on 17/08/2026.
//

import SwiftUI

struct ExpenseView: View {

    @State private var vm = ExpenseViewModel()
    @State private var isPresented = false

    var body: some View {
        NavigationStack {
            
            if vm.expenses.isEmpty {
                Text("Brak wydatków")
            } else {
                List(vm.expenses) {
                    Button($0.title ?? "unknown") {
                        isPresented = true
                    }
                }
                .swipeActions(edge: .leading) {
                    
                }
            }

            Button {
                isPresented = true
            } label: {
                VStack {
                    ZStack {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 80, height: 80)
                        Text("+")
                            .foregroundStyle(.white)
                            .font(.system(size: 32))
                    }
                    .padding()
                }
            }

        }
        .searchable(text: $vm.searchKeyword)
        .onAppear(perform: vm.fetchExpense)
    }
        
        
}

#Preview {
    ExpenseView()
}
