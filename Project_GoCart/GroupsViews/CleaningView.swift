//
//  CleaningView.swift
//  Project_GoCart
//
//  Created by Gil on 2023-02-25.
//

import SwiftUI



struct CleaningView: View {
    
    var cleanings: [Cleaning] = [.init(name: "Mop", price: 14.23),
                          .init(name: "Magic Erasers", price: 19.43),
                          .init(name: "Windex", price: 4.98),
                          .init(name: "Sponge", price: 6.99),
                          .init(name: "Bucket", price: 2.99),
    ]

    @State var showModal = false

    
    var body: some View {
        NavigationStack {
            ZStack{
                VStack {
                    HStack{
                        Spacer()
                        Image(systemName: "cart.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio( contentMode: .fill)
                            .foregroundColor(Color(red: 0.19215686274509805, green: 0.6274509803921569, blue: 0.49019607843137253))
                    }
                    Spacer()
                }
                .padding()
                VStack{
                    Text("Cleaning")
                        .font(.custom("Noto Sans Oriya Bold", size: 45.0))
                        .foregroundColor(Color(red: 0.19215686274509805, green: 0.6274509803921569, blue: 0.49019607843137253))
                        .padding()
                        List{
                            //destination: FoodDetailView(food: food)
                            ForEach(cleanings, id: \.name){ cleaning in
                                NavigationLink(cleaning.name) {
                                    CleaningDetailView(cleaning: cleaning)
                                }
                            }
                        }
                        .scrollContentBackground(.hidden)
                        .background(Color(red: 0.87, green: 0.94, blue: 0.91))
                    AddItemButton()

                }
//                AddItemButton()
//                VStack{
//                    Spacer()
//                    AddItemButton()
//                }
            }
        }
    }
    
    func AddItemButton() -> some View {
        return Button(action: {
            self.showModal.toggle()
        }, label: {
            Text("Add Item")
                .foregroundColor(.white)
        })
        .sheet(isPresented: $showModal, content: {
            AddItemView()
        })
        .frame(width: 130, height: 40, alignment: .center)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke())
        .font(.custom("Noto Sans Oriya Bold", size: 19))
        .background(Color(red: 0.19215686274509805, green: 0.6274509803921569, blue: 0.49019607843137253))
        .cornerRadius(10)
    }
    
//    @ViewBuilder func createView(for food: Food) -> some View {
////        sdasd;kfajls;dkfla;jk
//    }
}

struct Cleaning: Identifiable, Hashable {
    let id: UUID
    let name: String
    let price: Float
    
    init(name: String, price: Float){
        self.id = UUID()
        self.name = name
        self.price = price
    }
}

struct CleaningDetailView: View {
    let cleaning: Cleaning

    var body: some View {
        ZStack{
            Color.init(red: 0.87, green: 0.94, blue: 0.91)
                .ignoresSafeArea()
            VStack{
                Text("Item Name")
                Text("\(cleaning.name)")
                Text("Item Price")
                Text("$\(cleaning.price, specifier: "%.2f")")
                Spacer()

            }
            .font(.custom("Noto Sans Oriya Bold", size: 30))
                .foregroundColor(Color(red: 0.19215686274509805, green: 0.6274509803921569, blue: 0.49019607843137253))
                .padding()
        }
        .navigationTitle("Item Details")
    }
}



struct CleaningView_Previews: PreviewProvider {
    static var previews: some View {
        CleaningView()
    }
}
