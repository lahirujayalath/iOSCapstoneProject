//
//  Categories.swift
//  LittleLemon
//
//  Created by Osama Mehdi on 01.06.23.
//

import SwiftUI

struct Categories: View {
    let categories = ["Starters", "Mains", "Desserts", "Drinks"]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Order for delivery!").textCase(.uppercase).font(.custom("Karla-Bold", fixedSize: 18))

            HStack(spacing: 20) {
                ForEach(categories, id: \.self) { category in
                    Button(category) {}
                        .font(.custom("Karla-Bold", fixedSize: 15))
                        .background(Color(red: 237/255, green: 239/255, blue: 238/255))
                        .cornerRadius(12.5)
                        .buttonStyle(.bordered)
                        .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                }
            }
        }.padding(10)
    }
}

struct Categories_Previews: PreviewProvider {
    static var previews: some View {
        Categories()
    }
}
