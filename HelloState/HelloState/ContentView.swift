//
//  ContentView.swift
//  HelloState
//
//  Created by Jovin Menezes on 21/04/20.
//  Copyright © 2020 Jovin Menezes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var name = "Jovin"
    @State private var isSpicy = false

 var model = Dish.all()
    var body: some View {

        List{
            Toggle(isOn: $isSpicy){
               Text("spicy")
            }

            ForEach(model.filter {$0.isSpicy == self.isSpicy})
            { dish in
                HStack{
                Image(dish.imageURL)
                    .resizable()
                    .frame(width: 100, height: 100)
                Text(dish.name)
                .lineLimit(nil)
                    Spacer()
                    if dish.isSpicy{
                Image("spicy-icon")
                    .resizable()
                    .frame(width: 30, height: 30)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
