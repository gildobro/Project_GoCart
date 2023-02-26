//
//  MedicationDetailView.swift
//  Project_GoCart
//
//  Created by Gil on 2023-02-25.
//

import SwiftUI

struct blahMedicationDetailView: View {
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

struct blahMedicationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        blahMedicationDetailView(medication: .init(name: "Advil", price: 12.99))
    }
}
