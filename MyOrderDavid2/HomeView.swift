//
//  HomeView.swift
//  MyOrderDavid2
//
//  Created by David C on 2024-10-16.
//

import SwiftUI

struct HomeView: View {
    
    @State var pizzaOrder : Pizza = Pizza()
    
    @State var listOfPizzas : [Pizza] = []
    
    var body: some View {
        Text("Order Pizza").font(.title).bold()
            NavigationView{
            
                
                NavigationLink(destination: OrderView(pizzaOrder: $pizzaOrder, listOfPizzas: $listOfPizzas)){
                                Text("Order")
                            }.buttonStyle(.automatic)
            
        }.padding()
    }
}


struct OrderView: View {
    @Binding var pizzaOrder : Pizza
    @Binding var listOfPizzas : [Pizza]
    
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
                    Text("Pepperoni").tag(PizzaTopping.Cheese)
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
                        listOfPizzas += [pizzaOrder]
                    }){
                        Text("Add Pizza")
                    }.frame(width: 150, height: 50)
                        .font(.title2)
                        .background(.white)
                        .foregroundColor(.blue)
                        .border(Color.gray)
                    
                    NavigationLink(destination: ResultView(pizza: $pizzaOrder, listPizza: $listOfPizzas)){
                        Text("View Orders")
                            .font(.title2)
                            .frame(width: 150, height: 50)
                            .background(.white)
                            .foregroundColor(.blue)
                            .border(Color.gray)
                        
                    }.buttonStyle(.automatic)
                }
        }
        
    }
}


#Preview {
    HomeView()
}
