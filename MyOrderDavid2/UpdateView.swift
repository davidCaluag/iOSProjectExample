//
//  UpdateView.swift
//  MyOrderDavid2
//
//  Created by David C on 2024-10-16.
//

import SwiftUI
struct UpdateView: View {
    @StateObject var vm: PizzasViewModel = PizzasViewModel()
    @ObservedObject var pizzaOrder: Pizza // Make sure this is the correct type of your Core Data entity
    

    var body: some View {
        VStack {
            List {
                Picker("Pizza Size", selection: Binding(
                    get: {
                        PizzaSize(rawValue: pizzaOrder.pizzaSize ?? "") ?? .Medium // Provide default if nil
                    },
                    set: {
                        pizzaOrder.pizzaSize = $0.rawValue // Set the raw value of the enum
                    }
                )) {
                    Text("Small").tag(PizzaSize.Small)
                    Text("Medium").tag(PizzaSize.Medium)
                    Text("Large").tag(PizzaSize.Large)
                }
                .padding()

                Picker("Pizza Topping", selection: Binding(
                    get: {
                        PizzaTopping(rawValue: pizzaOrder.pizzaTopping ?? "") ?? .Cheese // Provide default if nil
                    },
                    set: {
                        pizzaOrder.pizzaTopping = $0.rawValue // Set the raw value of the enum
                    }
                )) {
                    Text("Cheese").tag(PizzaTopping.Cheese)
                    Text("Pepperoni").tag(PizzaTopping.Pepperoni)
                    Text("Veggie").tag(PizzaTopping.Veggie)
                    Text("Meat Lovers").tag(PizzaTopping.MeatLovers)
                    Text("Hawaiian").tag(PizzaTopping.Hawaiian)
                    Text("New York").tag(PizzaTopping.NewYork)
                }
                .padding()

                Picker("Pizza Crust", selection: Binding(
                    get: {
                        Crust(rawValue: pizzaOrder.crust ?? "") ?? .Regular // Provide default if nil
                    },
                    set: {
                        pizzaOrder.crust = $0.rawValue // Set the raw value of the enum
                    }
                )) {
                    Text("Thin").tag(Crust.Thin)
                    Text("Regular").tag(Crust.Regular)
                    Text("Thick").tag(Crust.Thick)
                }
                .pickerStyle(.segmented)
                .padding()

                Slider(value: Binding(
                    get: { pizzaOrder.amount },
                    set: { pizzaOrder.amount = $0 }
                ), in: 1...20, step: 1)
                .padding()

                Text("Amount: \(Int(pizzaOrder.amount))").padding()
            }
            .padding()
        }
        .navigationTitle("Update Pizza") // Set navigation title
    }
}
