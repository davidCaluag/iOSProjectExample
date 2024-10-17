//
//  OrderView.swift
//  MyOrderDavid2
//
//  Created by David C on 2024-10-16.
//

import SwiftUI


struct OrderView: View {
    //@Binding var addPizza: () -> Void
    @StateObject var vm = PizzasViewModel()
    @State var pizzaOrder : PizzaStructure = PizzaStructure()
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
            VStack{
                List {
                Picker("Pizza Size", selection: $pizzaOrder.pizzaSize) {
                    Text("Small").tag(PizzaSize.Small)
                    Text("Medium").tag(PizzaSize.Medium)
                    Text("Large").tag(PizzaSize.Large)
                }.padding()
                
                
                Picker("Pizza Topping", selection: $pizzaOrder.pizzaTopping) {
                    Text("Cheese").tag(PizzaTopping.Cheese)
                    Text("Pepperoni").tag(PizzaTopping.Pepperoni)
                    Text("Veggie").tag(PizzaTopping.Veggie)
                    Text("Meat Lovers").tag(PizzaTopping.MeatLovers)
                    Text("Hawaiian").tag(PizzaTopping.Hawaiian)
                    Text("New York").tag(PizzaTopping.NewYork)
                }.padding()
                
                
                Picker("Pizza Crust", selection: $pizzaOrder.crust) {
                    Text("Thin").tag(Crust.Thin)
                    Text("Regular").tag(Crust.Regular)
                    Text("Thick").tag(Crust.Thick)
                }.pickerStyle(.segmented).padding()
                
                
                Slider(
                    value: $pizzaOrder.amount,
                    in: 1...20,
                    step: 1).padding()
                    
                    Text("Amount: \(Int(pizzaOrder.amount))").padding()
                
                }.padding()
                
                HStack{
                    Button(action: {
                        vm.addPizza(amount: pizzaOrder.amount, crust: pizzaOrder.crust.rawValue, pizzaSize: pizzaOrder.pizzaSize.rawValue, pizzaTopping: pizzaOrder.pizzaTopping.rawValue)
                    }){
                        Text("Add Pizza")
                    }.frame(width: 150, height: 50)
                        .font(.title2)
                        .background(.white)
                        .foregroundColor(.blue)
                        .border(Color.gray)
                    
                    
//                    Button(action: {presentationMode.wrappedValue.dismiss()}){
//                        Text("View Orders")
//                            .font(.title2)
//                            .frame(width: 150, height: 50)
//                            .background(.white)
//                            .foregroundColor(.blue)
//                            .border(Color.gray)
//                        
//                    }.buttonStyle(.automatic)
                }
        }
        
    }
}

