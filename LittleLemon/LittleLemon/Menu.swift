//
//  Menu.swift
//  LittleLemon
//
//  Created by Osama Mehdi on 16.05.23.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State var searchText: String = ""

    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ScrollView {
                    VStack {
                        VStack(alignment: .leading, spacing: 0) {
                            Info()

                            HStack {
                                Image(systemName: "magnifyingglass.circle.fill")
                                    .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255))
                                    .font(.system(size: 40))
                                TextField("", text: $searchText)
                                    .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255))

                            }.padding(.horizontal, 20).padding(.bottom, 10)

                        }.background(Color(red: 73/255, green: 94/255, blue: 87/255))

                        Categories()
//                        DishCard(title: "Greek Salad", price: "12.99", image: "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true", desc: "The famous greek salad of crispy lettuce, peppers, olives, our Chicago.", category: "mains")

                        FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
//                            List {
                            ForEach(dishes, id: \.self) { dish in
                                let title = dish.title!
                                let price = dish.price!
                                let image = dish.image!
                                let desc = dish.desc!
                                let category = dish.category!

                                DishCard(title: title, price: price, image: image, desc: desc, category: category)
                                    .padding(.vertical, 10)
                                Divider()
                            }
//                            }
                        }
                    }.onAppear {
                        getMenuData()
                    }
                }
                .frame(width: geometry.size.width)
                .frame(minHeight: geometry.size.height)

            }.scrollDismissesKeyboard(.immediately)
        }
    }

    func getMenuData() {
        PersistenceController.shared.clear()

        let urlString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"

        let url = URL(string: urlString)!
        let request = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: request) { data, _, _ in
            if let data = data {
                let decoder = JSONDecoder()
                let menuData = try? decoder.decode(MenuList.self, from: data)

                let menu = menuData!.menu

                for menuItem in menu {
                    let newDish = Dish(context: viewContext)
                    newDish.title = menuItem.title
                    newDish.price = menuItem.price
                    newDish.image = menuItem.image
                    newDish.desc = menuItem.description
                    newDish.category = menuItem.category
                }

                try? viewContext.save()
            }
        }

        dataTask.resume()
    }

    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [
            NSSortDescriptor(
                key: "title",
                ascending: true,
                selector: #selector(NSString.localizedStandardCompare(_:))),
        ]
    }

    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        }

        return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
