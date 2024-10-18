//
//  PizzaController.swift
//  MyOrderDavid2
//
//  Created by David C on 2024-10-16.
//
//




import Foundation
import SwiftUI
import CoreData

class PizzasViewModel: ObservableObject {
    @Published var pizzaList: [Pizza] = []
    
    let context : NSManagedObjectContext
    
    init() {
        self.context = PersistenceController().container.viewContext
        print("Initializing fetching pizzas [PizzaViewModel()]")
        fetchPizzas()
    }
    
    func fetchPizzas() {
        
        let request = NSFetchRequest<Pizza>(entityName: "Pizza")
        
//        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true) // Change to false for descending order
//            request.sortDescriptors = [sortDescriptor]
        
        do {
            pizzaList = try context.fetch(request).sorted(by: {($0.date ?? Date()) > ($1.date ?? Date())})
            print("Pizzas fetched: \(pizzaList.count) items")
        } catch {
            print("Error fetching pizzas: \(error)")
        }
    }
    
    func savePizzas() {
        do {
            try context.save()
            print("Pizzas saved.")
            
//            ForEach(pizzaList){ pizza in
//                print("\(pizza.amount) \(pizza.pizzaSize)")
//            }
        } catch {
            print("Error saving pizzas: \(error)")
        }
    }
    
    func addPizza(amount: Float, crust: String, pizzaSize: String, pizzaTopping: String) {
        guard !amount.isZero, !crust.isEmpty, !pizzaSize.isEmpty, !pizzaTopping.isEmpty else {
            print("Insufficient information to add pizza.")
            return
        }
        
        
        
//        formatter.dateStyle = .short
//        formatter.timeStyle = .medium
        
        let newPizza = Pizza(context: context)
        newPizza.id = UUID()
        newPizza.date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .short
        newPizza.dateString = dateFormatter.string(from: newPizza.date!)
        newPizza.amount = amount
        newPizza.crust = crust
        newPizza.pizzaSize = pizzaSize
        newPizza.pizzaTopping = pizzaTopping
        
        savePizzas() // Save the new pizza
        
        // Fetch pizzas after saving to update the list
        fetchPizzas()
        print("Pizza added. Current pizzas count: \(pizzaList.count)")
    }
    
    func deletePizza(indexSet: IndexSet) {
        indexSet.map { pizzaList[$0] }.forEach(context.delete)
//        for index in indexSet {
//            let pizza = pizzaList[index]
//            context.delete(pizza)
//        }
        
        savePizzas() // Save changes after deletion
        fetchPizzas() // Fetch pizzas to refresh the list
    }
}



//class PizzasViewModel : ObservableObject {
//    
//    @Environment(\.managedObjectContext) private var viewContext
//    //@ObservedObject var pizza : Pizza
//    
//    
//   @Published var pizzaList : [Pizza] = []
//    
//    let context : NSManagedObjectContext
//    
//    init () {
//        self.context = PersistenceController.shared.container.viewContext
//        fetchPizzas()
//    }
//    
//    func fetchPizzas(){
//        let request = NSFetchRequest<Pizza>(entityName:"Pizza")
//        
//        do {
//            pizzaList = try context.fetch(request)
//            print("Pizzas fetched.")
//        }catch{
//            print("PizzaViewModel.fetchPizzas() is not working!")
//        }
//    }
//    
//    func savePizzas(){
//        do{
//            try context.save()
//            print("Pizzas saved.")
//        }catch{
//            print("PizzaViewModel.savePizzas() is not working!")
//        }
//    }
//    
//    func addPizza(_amount : Float, _crust: String, _pizzaSize: String, _pizzaTopping: String){
//        guard !_amount.isZero, !_crust.isEmpty, !_pizzaSize.isEmpty, !_pizzaTopping.isEmpty else {
//            print("Insufficient Information!")
//            return
//        }
//        
//        do{
//                let newPizza = Pizza(context: context)
//                newPizza.amount = _amount
//                newPizza.crust = _crust
//                newPizza.pizzaSize = _pizzaSize
//                newPizza.pizzaTopping = _pizzaTopping
//            print("Pizza added. Current pizzas \(pizzaList.count)")
//                endFunction()
//            
//        }catch{
//            print("PizzaViewModel.addPizza() is not working!")
//        }
//    }
//    
//    func endFunction(){
//        savePizzas()
//        fetchPizzas()
//    }
//    
//    func deletePizza(indexSet: IndexSet){
//        for index in indexSet{
//            let pizza = pizzaList[index]
//            context.delete(pizza)
//        }
//        endFunction()
//    }
//    
//}
//
