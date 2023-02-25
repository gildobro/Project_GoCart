//
//  AddGroupView.swift
//  Project_GoCart
//
//  Created by Gil on 2023-02-17.
//

import SwiftUI

struct AddGroupView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color(red: 0.87, green: 0.94, blue: 0.91)

                    .ignoresSafeArea()
            }
            .navigationBarTitle("Add Group Screen")
            
        }
    }
}

struct AddGroupView_Previews: PreviewProvider {
    static var previews: some View {
        AddGroupView()
    }
}
