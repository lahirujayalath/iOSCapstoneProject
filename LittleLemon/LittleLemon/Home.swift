//
//  Home.swift
//  LittleLemon
//
//  Created by Osama Mehdi on 16.05.23.
//

import SwiftUI

struct Home: View {
    let persistence = PersistenceController.shared

    var body: some View {
        VStack {
            Navbar().padding()
            
            TabView {
                Menu().environment(\.managedObjectContext, persistence.container.viewContext).tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
                UserProfile().tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
            }.navigationBarBackButtonHidden(true)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
