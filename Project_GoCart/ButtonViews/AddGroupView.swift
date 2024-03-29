//
//  AddGroupView.swift
//  Project_GoCart
//
//  Created by Gil on 2023-02-17.
//  Created by Gil Dobrovinsky 101304972 on 2023-03-16.

// REFERENCE
// https://developer.apple.com/documentation/swiftui/textfield
//

import SwiftUI
import CoreData


struct AddGroupView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(entity: Groups.entity(), sortDescriptors: [])
    var groups: FetchedResults<Groups>

    
    @State public var newGroupName = ""
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(red: 0.87, green: 0.94, blue: 0.91)
                    .ignoresSafeArea()
                
                VStack {
                    HStack{
                        BackButton()
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
                    HStack{
                        Spacer()
                    }
                    .padding()
                    Spacer()
                }
                VStack{
                    Text("Product Group Name")
                        .font(.custom("Noto Sans Oriya Bold", size: 20))
                    TextField(
                        "Product Group Name",
                        text: $newGroupName
                    )
                    .padding(.all, 4.0)
                    .font(.custom("Noto Sans Oriya Bold", size: 20))
                    .background(Color(.white))
                    .cornerRadius(10)
                    AddButton() //on add button click -> append group to list
                    CancelButton()
                    
                }
                .padding()
            }
            .navigationBarTitle("")
            

        }
    }
    func BackButton() -> some View {
        return Button("Back") {
            dismiss()
        }
        .bold()
        .foregroundColor(.white)
        .frame(width: 100, height: 50, alignment: .center)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke())
        .font(.custom("Noto Sans Oriya Bold", size: 20))
        .background(Color(red: 0.19215686274509805, green: 0.6274509803921569, blue: 0.49019607843137253))
        .cornerRadius(10)
    }
    func CancelButton() -> some View {
        return Button("Cancel") {
            dismiss()
        }
        .bold()
        .frame(width: 130, height: 40, alignment: .center)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke())
        .font(.custom("Noto Sans Oriya Bold", size: 20))
        .background(Color(red: 1, green: 0.2863, blue: 0.4235))
        .cornerRadius(10)
        .foregroundColor(.white)
    }
    
    func AddButton() -> some View {
        return Button("Add") {
            let newGroup = Groups(context: self.context)
            newGroup.name = newGroupName
            try? self.context.save()
            dismiss()
        }
        .bold()
        .frame(width: 130, height: 40, alignment: .center)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke())
        .font(.custom("Noto Sans Oriya Bold", size: 20))
        .background(Color(red: 0.19215686274509805, green: 0.6274509803921569, blue: 0.49019607843137253))        .cornerRadius(10)
        .foregroundColor(.white)
    }
}

struct AddGroupView_Previews: PreviewProvider {
    static var previews: some View {
        AddGroupView()
    }
}
