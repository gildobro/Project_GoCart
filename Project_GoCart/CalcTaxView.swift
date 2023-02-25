//
//  CalcTaxView.swift
//  Project_GoCart
//
//  Created by Gil on 2023-02-17.
//

import SwiftUI

struct CalcTaxView: View {
    @State var totalCost: Float = 169.92
    @State var sliderValue : Float = 1.13
    var totalAfterTaxes: Float {
        totalCost * sliderValue
    }

    var body: some View {
        NavigationView {
            ZStack{
                Color.white
                    .ignoresSafeArea()
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
                    Text("Costs &\n Taxes")
                        .font(.custom("Noto Sans Oriya Bold", size: 45.0))
                        .foregroundColor(Color(red: 0.19215686274509805, green: 0.6274509803921569, blue: 0.49019607843137253))
                    Spacer()
                    VStack(alignment: .center){
                        List {
                            //This will be a calculation where if the tax rate is adjusted, the total taxes will change based on the $sliderValue
                            Text("Total Cost Before Tax").bold()
                            Text("$\(totalCost, specifier: "%.2f")")
                            Text("Total Cost After Tax").bold()
                            Text("$\(totalAfterTaxes, specifier: "%.2f")")
                            Text("Tax Rate").bold()
                            Text("\((sliderValue * 100 - 100), specifier: "%.2f")%")
                        }
                        .scrollContentBackground(.hidden)
                        .background(Color(red: 0.87, green: 0.94, blue: 0.91))
                        
                        Text("Adjust Tax Rate")
                            .font(.custom("Noto Sans Oriya Bold", size: 20))
                            .foregroundColor(Color(red: 0.19215686274509805, green: 0.6274509803921569, blue: 0.49019607843137253))
                        Slider(value: $sliderValue, in: 1...2) {
                            Text("Slider")
                        } minimumValueLabel: {
                            Text("1.00").font(.title2).fontWeight(.thin)
                        } maximumValueLabel: {
                            Text("2.00").font(.title2).fontWeight(.thin)
                        }.tint(.green)
                        // 3
                            .padding(.top, -25.0)
                            .padding(.horizontal)

                    }

                }
                
            }
            .navigationBarTitle("")
        }
    }
    
//    func TotalTax(slider: Float) -> Float {
//        let total = 169.92 * self.sliderValue
//        return total
//    }
}


struct CalcTaxView_Previews: PreviewProvider {
    static var previews: some View {
        CalcTaxView()
    }
}
