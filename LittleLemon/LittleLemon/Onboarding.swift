//
//  Onboarding.swift
//  LittleLemon
//
//  Created by Osama Mehdi on 16.05.23.
//

import SwiftUI

let firstNameKey = "first name key"
let lastNameKey = "last name key"
let emailKey = "email key"

struct Onboarding: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""

    @State private var isLoggedIn: Bool = false

    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ScrollView {
                    VStack {
                        Image("Logo").padding()

                        NavigationLink(destination: Home(), isActive: self.$isLoggedIn) {
                            EmptyView()
                        }

                        TextField("First Name",
                                  text: self.$firstName)
                            .withInputTextFieldsStyles()

                        TextField("Last Name",
                                  text: self.$lastName).withInputTextFieldsStyles()
                        TextField("E-Mail",
                                  text: self.$email).withInputTextFieldsStyles()
                            .keyboardType(.emailAddress)

                        let textFieldsCorrectlyFilled = !self.firstName.isEmpty && !self.lastName.isEmpty && !self.email.isEmpty
                            && self.isValidEmail(self.email)

                        Button("Register") {
                            if textFieldsCorrectlyFilled {
                                UserDefaults.standard.set(self.firstName, forKey: firstNameKey)
                                UserDefaults.standard.set(self.lastName, forKey: lastNameKey)
                                UserDefaults.standard.set(self.email, forKey: emailKey)
                                self.isLoggedIn = true
                            }
                        }.withRegisterButtonStyles().disabled(!textFieldsCorrectlyFilled)
                    }
                    .frame(width: geometry.size.width)
                    .frame(minHeight: geometry.size.height)
                }
            }.scrollDismissesKeyboard(.immediately)
        }
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

extension TextField {
    func withInputTextFieldsStyles() -> some View {
        self.padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(red: 73/255, green: 94/255, blue: 87/255), lineWidth: 1))
            .padding()
    }
}

extension Button {
    func withRegisterButtonStyles() -> some View {
        self
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(Color(red: 73/255, green: 94/255, blue: 87/255))
            .cornerRadius(8)
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
