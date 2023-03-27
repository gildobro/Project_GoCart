//
//  LaunchView.swift
//  Project_GoCart
//
//  Created by Gil Dobrovinsky 101304972 on 2023-03-16.
//

import SwiftUI
import UIKit

struct LaunchView: View {
    
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                VStack(alignment: .center){
                    Image(systemName: "cart.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                        .padding([.leading, .bottom], -40.0)
                        .scaledToFit()
                        .foregroundColor(Color(red: 0.19215686274509805, green: 0.6274509803921569, blue: 0.49019607843137253))
                    
                    Text("GoCart")
                        .padding(.bottom, 400.0)
                        .font(.custom("Noto Sans Oriya Bold", size: 45.0))
                        .foregroundColor(Color(red: 0.19215686274509805, green: 0.6274509803921569, blue: 0.49019607843137253))
                    
                    
                    
                    Text("By Gil Dobrovinsky")
                        .font(.custom("Noto Sans Oriya Bold", size: 22))
                        .foregroundColor(Color(red: 0.19215686274509805, green: 0.6274509803921569, blue: 0.49019607843137253))


                }

            }
            .edgesIgnoringSafeArea(.all)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    self.isActive = true
                }
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
