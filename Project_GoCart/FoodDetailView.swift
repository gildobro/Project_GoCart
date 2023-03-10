//
//  FoodDetailView.swift
//  Project_GoCart
//
//  Created by Gil on 2023-02-25.
//

import SwiftUI

struct blahFoodDetailView: View {
    let food: Food

    var body: some View {
        ZStack{
            Color.init(red: 0.87, green: 0.94, blue: 0.91)
                .ignoresSafeArea()
            VStack{
                Text("Item Name")
                Text("\(food.name)")
                Text("Item Price")
                Text("$\(food.price, specifier: "%.2f")")
                Spacer()

            }
            .font(.custom("Noto Sans Oriya Bold", size: 30))
                .foregroundColor(Color(red: 0.19215686274509805, green: 0.6274509803921569, blue: 0.49019607843137253))
                .padding()
        }
        .navigationTitle("Item Details")
    }
}

struct blahFoodDetailView_Previews: PreviewProvider {
    static var previews: some View {
        blahFoodDetailView(food: .init(name: "Advil", price: 12.99))
    }
}
