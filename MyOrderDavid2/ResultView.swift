//
//  ResultView.swift
//  MyOrderDavid2
//
//  Created by David C on 2024-10-16.
//

import SwiftUI

struct ResultView: View {
    @StateObject var vm = PizzasViewModel()
    
    let date = Date() // Current date
    let dateFormatter = DateFormatter()
    
    init(){
        dateFormatter.dateStyle = .medium // You can choose .short, .medium, .long, or .full
        dateFormatter.timeStyle = .short // Set this to .none if you don't want to include time
    }
    

    
    var body: some View {

        NavigationView {
            List {
                    ForEach(vm.pizzaList, id: \.self) { singlePizza in
                            NavigationLink(destination: UpdateView(pizzaOrder: singlePizza)) {
                                Text("\(Int(singlePizza.amount)) \(singlePizza.pizzaTopping!) \(dateFormatter.string(from: singlePizza.date ?? Date()))")
                            }
                        }.onDelete(perform: vm.deletePizza)

                    
                }
            
                .onAppear(perform: vm.fetchPizzas)
                .navigationTitle("Pizza Main Page")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        NavigationLink(destination: OrderView()){
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
            Text("Pizza Order: \(vm.pizzaList.count)")
        }
    }
}


#Preview {
    ResultView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

