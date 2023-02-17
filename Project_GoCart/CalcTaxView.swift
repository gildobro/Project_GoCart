//
//  CalcTaxView.swift
//  Project_GoCart
//
//  Created by Gil on 2023-02-17.
//

import SwiftUI

struct CalcTaxView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color.green
                    .ignoresSafeArea()
            }
            .navigationBarTitle("Calc Taxes")
            
        }
    }
}

struct CalcTaxView_Previews: PreviewProvider {
    static var previews: some View {
        CalcTaxView()
    }
}
