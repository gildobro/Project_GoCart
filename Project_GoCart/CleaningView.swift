//
//  CleaningView.swift
//  Project_GoCart
//
//  Created by Gil on 2023-02-25.
//

import SwiftUI

struct CleaningView: View {
    var body: some View {
        ZStack{
            VStack {
                HStack{
                    Text("Cleaning")
                        .font(.custom("Noto Sans Oriya Bold", size: 45.0))
                        .foregroundColor(Color(red: 0.19215686274509805, green: 0.6274509803921569, blue: 0.49019607843137253))
                        .padding(0.0)
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
            .background(Color(red: 0.87, green: 0.94, blue: 0.91))
        
        }    }
}

struct CleaningView_Previews: PreviewProvider {
    static var previews: some View {
        CleaningView()
    }
}
