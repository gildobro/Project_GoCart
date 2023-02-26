//
//  VideoGameView.swift
//  Project_GoCart
//
//  Created by Gil on 2023-02-25.
//

import SwiftUI



struct VideoGameView: View {
    
    var games: [Game] = [.init(name: "Call of Duty", price: 89.99),
                          .init(name: "Hogwarts Legacy", price: 89.99),
                          .init(name: "God Of War: Ragnarok", price: 89.99),
                          .init(name: "Lego Star Wars", price: 89.99),
                          .init(name: "No Man's Sky", price: 89.99),
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
                    Text("Video Games")
                        .font(.custom("Noto Sans Oriya Bold", size: 45.0))
                        .foregroundColor(Color(red: 0.19215686274509805, green: 0.6274509803921569, blue: 0.49019607843137253))
                        .padding(.trailing, 40.0)
                        List{
                            //destination: FoodDetailView(food: food)
                            ForEach(games, id: \.name){ game in
                                NavigationLink(game.name) {
                                    GameDetailView(game: game)
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

struct Game: Identifiable, Hashable {
    let id: UUID
    let name: String
    let price: Float
    
    init(name: String, price: Float){
        self.id = UUID()
        self.name = name
        self.price = price
    }
}

struct GameDetailView: View {
    let game: Game

    var body: some View {
        ZStack{
            Color.init(red: 0.87, green: 0.94, blue: 0.91)
                .ignoresSafeArea()
            VStack{
                Text("Item Name")
                Text("\(game.name)")
                Text("Item Price")
                Text("$\(game.price, specifier: "%.2f")")
                Spacer()

            }
            .font(.custom("Noto Sans Oriya Bold", size: 30))
                .foregroundColor(Color(red: 0.19215686274509805, green: 0.6274509803921569, blue: 0.49019607843137253))
                .padding()
        }
        .navigationTitle("Item Details")
    }
}



struct VideoGameView_Previews: PreviewProvider {
    static var previews: some View {
        VideoGameView()
    }
}
