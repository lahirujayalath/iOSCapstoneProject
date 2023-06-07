//
//  DishCard.swift
//  LittleLemon
//
//  Created by Osama Mehdi on 07.06.23.
//

import SwiftUI

struct DishCard: View {
    var title: String
    var price: String
    var image: String
    var desc: String
    var category: String

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .font(.custom("Karla-bold", fixedSize: 18))
                .padding(.leading, 10)

            HStack {
                VStack(alignment: .leading) {
                    Text(desc)
                        .padding(.leading, 10)
                        .padding(.bottom, 15)
                        .lineLimit(2)
                        .font(.custom("Karla-thin", fixedSize: 16))
                        .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))

                    Text("$" + price)
                        .font(.custom("Karla-bold", fixedSize: 16))
                        .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                        .padding(.leading, 10)
                }
                Rectangle()
                    .aspectRatio(1, contentMode: .fit)
                    .overlay(
                        AsyncImage(url: URL(string: image)) { image in
                            image.resizable().scaledToFill()
                        } placeholder: {}

                    ).clipShape(Rectangle())
                    .frame(maxWidth: 100)
                    .padding(.trailing, 15)
            }
        }
    }
}

struct DishCard_Previews: PreviewProvider {
    static var previews: some View {
        DishCard(title: "Greek Salad", price: "12.99", image: "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true", desc: "The famous greek salad of crispy lettuce, peppers, olives, our Chicago.", category: "mains")
    }
}
