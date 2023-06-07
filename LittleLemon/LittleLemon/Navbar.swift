//
//  Navbar.swift
//  LittleLemon
//
//  Created by Osama Mehdi on 01.06.23.
//

import SwiftUI

struct Navbar: View {
    var body: some View {
        HStack {
            Image("Logo").padding(.leading, 75)
            Image("Profile").resizable().frame(maxWidth: 50, maxHeight: 50).padding(.leading, 25)
        }
    }
}

struct Navbar_Previews: PreviewProvider {
    static var previews: some View {
        Navbar()
    }
}
