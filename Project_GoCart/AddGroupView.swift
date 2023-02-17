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
                Color.green
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
