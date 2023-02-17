//
//  ContentView.swift
//  Project_GoCart
//
//  Created by Gil on 2023-02-17.
//

import SwiftUI

struct ContentView: View {
    
    var groups: [Group] = [.init(name: "Food", imageName: "fork.knife", color: .green),
                           .init(name:"Medications", imageName: "medical.thermometer.fill", color: .blue),
                           .init(name:"Cleaning Supplies", imageName: "bubbles.and.sparkles.fill", color: .purple),
                           .init(name: "Video Games", imageName: "gamecontroller.fill", color: .mint),
                           .init(name: "Pet Supplies", imageName: "pawprint.fill", color: .red)
    ]
    
    @State private var path: [Group] = []
    @State var showModal = false

    
    
    
    
    var body: some View {
        NavigationStack(path: $path){
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
                        List{
                            ForEach(groups, id: \.name){ group in
                                NavigationLink(value: group){
                                    Label(group.name, systemImage: group.imageName)
                                        .foregroundColor(group.color)
                                }
                            }
                        }
                    .navigationDestination(for: Group.self){ group in
                        ZStack{
                            group.color.ignoresSafeArea()
                            Label(group.name, systemImage: group.imageName)
                                .font(.custom("Noto Sans Oriya Bold", size: 45.0))

                        }
                    }
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
        .font(.custom("Noto Sans Oriya Bold", size: 15))
        .background(Color(red: 0.19215686274509805, green: 0.6274509803921569, blue: 0.49019607843137253))
        .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Group: Hashable {
    let name: String
    let imageName: String
    let color: Color
}
