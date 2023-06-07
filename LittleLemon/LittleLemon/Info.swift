//
//  Info.swift
//  LittleLemon
//
//  Created by Osama Mehdi on 01.06.23.
//

import SwiftUI

struct Info: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 1) {
                Text("Little Lemon")
                    .font(.custom("MarkaziText-Medium", fixedSize: 56))
                    .foregroundColor(Color(red: 244/255, green: 206/255, blue: 20/255))
                    .padding(.leading, 20)
                HStack(spacing: 0) {
                    VStack(alignment: .leading) {
                        Text("Chicago")
                            .font(.custom("MarkaziText-Medium", fixedSize: 48))
                            .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255))
                            .padding([.leading], 20)

                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                            .font(.custom("Karla-Regular", fixedSize: 16))
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255))
                            .padding(.horizontal, 20)
                    }
                    Image("Hero image")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 125, maxHeight: 150)
                        .cornerRadius(20.0)
                        .padding([.trailing], 12)
                }
            }
        }.padding(.bottom, 30).background(Color(red: 73/255, green: 94/255, blue: 87/255))
    }
}

struct Info_Previews: PreviewProvider {
    static var previews: some View {
        Info()
    }
}
