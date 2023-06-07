//
//  MenuItem.swift
//  LittleLemon
//
//  Created by Osama Mehdi on 19.05.23.
//

import Foundation

struct MenuItem: Decodable {
    let title: String
    let price: String
    let image: String
    let description: String
    let category: String
}
