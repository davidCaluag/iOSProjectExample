//
//  PizzaController.swift
//  MyOrderDavid2
//
//  Created by David C on 2024-10-16.
//

import Foundation
import SwiftUI


class PizzaViewModel : ObservableObject {
    
    @Environment(\.managedObjectContext) private var viewContext
    //@ObservedObject var pizza : Pizza
    
    
   @Published var pizzaList : [Pizza] = []
    
    let context : NSManagedObjectContext
    
    init () {
        self.context = PersistenceController().container.viewContext
    }
    
    func fetchPizzas(){
        let request = NSFetchRequest<Pizza>(entityName:"Pizza")
        
        do {
            pizzaList = try context.fetch(request)
        }catch{
            print("PizzaViewModel.fetchPizzas() is not working!")
        }
    }
    
    func savePizzas(){
        do{
            try context.save()
        }catch{
            print("PizzaViewModel.savePizzas() is not working!")
        }
    }
    
    func addPizza(_amount : Float, _crust: String, _pizzaSize: String, _pizzaTopping: String){
        guard !_amount.isZero, !_crust.isEmpty, !_pizzaSize.isEmpty, !_pizzaTopping.isEmpty {
            print("Insufficient Information!")
            return
        }
        
        try{
            let newPizza = Pizza(context: context)
            newPizza.amount = _amount
            newPizza.crust = _crust
            newPizza.pizzaSize = _pizzaSize
            newPizza.pizzaTopping = _pizzaTopping
            
            endFunction()
        }catch{
            print("PizzaViewModel.addPizza() is not working!")
        }
    }
    
    func endFunction(){
        savePizzas()
        fetchPizzas()
    }
    
    func deletePizza(indexSet: IndexSet){
        for index in indexSet{
            let pizza = pizzaList[index]
            context.delete(pizza)
        }
        endFunction()
    }
    

}

