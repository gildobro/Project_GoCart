//
//  ContentView.swift
//  Project_GoCart
//
//  Created by Gil Dobrovinsky 101304972 on 2023-03-16.


/*REFERENCES
 
 FOR DELETING ITEMS FROM LIST
 https://sarunw.com/posts/swiftui-list-ondelete/
 
 FOR EDITING ITEMS IN LIST
 https://www.hackingwithswift.com/quick-start/swiftui/how-to-enable-editing-on-a-list-using-editbutton#:~:text=If%20you%20have%20configured%20a,by%20adding%20an%20EditButton%20somewhere.&text=When%20that%20is%20run%2C%20you,the%20items%20in%20the%20list.

 */
//

import SwiftUI
import CoreData


struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Groups.entity(), sortDescriptors: []) var groups: FetchedResults<Groups>
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
                    Text("Product \nGroups")
                        .font(.custom("Noto Sans Oriya Bold", size: 45.0))
                        .foregroundColor(Color(red: 0.19215686274509805, green: 0.6274509803921569, blue: 0.49019607843137253))
                        .padding()
                    List{
                        ForEach(groups, id: \.self){ group in
                            Text("\(group.name!)")
                                .onTapGesture {
                                    //self.group.name
                                }
                        }
                        .onDelete{ indexSet in
                            for index in indexSet {
                                self.context.delete(self.groups[index])
                                try? self.context.save()
                            }
                            
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color(red: 0.87, green: 0.94, blue: 0.91))
                    AddGroupButton()
                    CalcTaxButton()
                    
                }
            }
        }
    }
    func AddGroupButton() -> some View {
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
    
    func CalcTaxButton() -> some View {
        return NavigationLink {
            CalcTaxView()
        } label: {
            Text("Calculate Taxes")
                .bold()
                .foregroundColor(.white)
            
        }
        .frame(width: 130, height: 40, alignment: .center)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke())
        .font(.custom("Noto Sans Oriya Bold", size: 16))
        .background(Color(red: 0.19215686274509805, green: 0.6274509803921569, blue: 0.49019607843137253))
        .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct Group: Identifiable, Hashable {
//    let id: UUID
//    let name: String
//    let imageName: String
//
//    init(name: String, imageName: String) {
//        self.id = UUID()
//        self.name = name
//        self.imageName = imageName
//    }
//}
//
//struct GroupDetailView: View {
//    let group: Group
//    // MAYBE A DYNAMIC SWITCH CASE FOR WHEN USER ADDS A GROUP
//    var body: some View {
//        switch group.name{
//        case "Food":
//            FoodView()
//        case "Medications":
//            MedicationView()
//        case "Cleaning":
//            CleaningView()
//        case "Video Games":
//            VideoGameView()
//        case "Pet Supplies":
//            PetSuppliesView()
//        default:
//            Text("Page Doesn't Exist")
//        }
//    }
//}

