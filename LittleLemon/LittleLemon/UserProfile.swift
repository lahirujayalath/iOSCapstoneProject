//
//  UserProfile.swift
//  LittleLemon
//
//  Created by Osama Mehdi on 19.05.23.
//

import SwiftUI

struct UserProfile: View {
    let firstName = UserDefaults.standard.string(forKey: firstNameKey) ?? ""
    let lastName = UserDefaults.standard.string(forKey: lastNameKey) ?? ""
    let email = UserDefaults.standard.string(forKey: emailKey) ?? ""

    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            Text("Personal Information")
            Image("Profile")
            Text(firstName)
            Text(lastName)
            Text(email)
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: isLoggedInKey)
                self.presentation.wrappedValue.dismiss()
            }.withRegisterButtonStyles()
            Spacer()
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
