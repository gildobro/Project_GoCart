//
//  MedicationView.swift
//  Project_GoCart
//
//  Created by Gil on 2023-02-25.
//

import SwiftUI



struct MedicationView: View {
    
    var meds: [Medication] = [.init(name: "Adderall", price: 129.32),
                              .init(name: "Ativan", price: 43.12),
                              .init(name: "Ozempic", price: 432.42),
                              .init(name: "Methadone", price: 23.12),
                              .init(name: "Viagra", price: 11.24),
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
                    Text("Medication")
                        .font(.custom("Noto Sans Oriya Bold", size: 45.0))
                        .foregroundColor(Color(red: 0.19215686274509805, green: 0.6274509803921569, blue: 0.49019607843137253))
                        .padding()
                        List{
                            //destination: FoodDetailView(food: food)
                            ForEach(meds, id: \.name){ med in
                                NavigationLink(med.name) {
                                    MedicationDetailView(medication: med)
                                }
                            }
                        }
                        .scrollContentBackground(.hidden)
                        .background(Color(red: 0.87, green: 0.94, blue: 0.91))
                    AddItemButton()

                
                }
//                VStack{
//                    Spacer()
//                    AddGroupButton()
//                }
//                AddGroupButton()
            }
        }
    }
    func AddItemButton() -> some View {
        return Button(action: {
            self.showModal.toggle()
        }, label: {
            Text("Add Group")
                .foregroundColor(.white)
        })
        .sheet(isPresented: $showModal, content: {
            AddGroupView()
        })
        .frame(width: 130, height: 40, alignment: .center)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke())
        .font(.custom("Noto Sans Oriya Bold", size: 19))
        .background(Color(red: 0.19215686274509805, green: 0.6274509803921569, blue: 0.49019607843137253))
        .cornerRadius(10)
    }
}

struct Medication: Identifiable, Hashable {
    let id: UUID
    let name: String
    let price: Float
    
    init(name: String, price: Float) {
        self.id = UUID()
        self.name = name
        self.price = price
    }
}

struct MedicationDetailView: View {
    let medication: Medication

    var body: some View {
        ZStack{
            Color.init(red: 0.87, green: 0.94, blue: 0.91)
                .ignoresSafeArea()
            VStack{
                Text("Item Name")
                Text("\(medication.name)")
                Text("Item Price")
                Text("$\(medication.price, specifier: "%.2f")")
                Spacer()

            }
            .font(.custom("Noto Sans Oriya Bold", size: 30))
                .foregroundColor(Color(red: 0.19215686274509805, green: 0.6274509803921569, blue: 0.49019607843137253))
                .padding()
        }
        .navigationTitle("Item Details")
    }
}


struct MedicationView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationView()
    }
}
