//
//  PizzaModel.swift
//  MyOrderDavid2
//
//  Created by David C on 2024-10-16.
//

import Foundation

//struct Pizza : Identifiable, Hashable {
//    var id = UUID()
//    var amount : Float = 1;
//    var pizzaSize : PizzaSize = PizzaSize.Medium;
//    var pizzaTopping : PizzaTopping = PizzaTopping.Pepperoni;
//    var crust : Crust = Crust.Regular
//    
//}

enum PizzaSize: String {
    case Small = "Small", Medium = "Medium", Large = "Large"
}

enum PizzaTopping: String{
    case Cheese = "Cheese", Pepperoni = "Pepperoni", Veggie = "Veggie Lover", MeatLovers = "Meat Lover", Hawaiian = "Hawaiian", NewYork = "New York"
}

enum Crust: String {
    case Thin = "Thin", Regular = "Regular", Thick = "Thick"
}

