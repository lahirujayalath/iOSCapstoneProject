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

    @State var checkBoxOrderStatus = true
    @State var checkBoxPasswordChange = true
    @State var checkBoxSpecialOffers = true
    @State var checkBoxNewsletter = true

    @Environment(\.presentationMode) var presentation

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Group {
                        Text("Personal Information")
                            .padding(.top, 20).padding(.leading, 10)
                            .font(.custom("Karla-bold", fixedSize: 18))
                        Text("Avatar")
                            .font(.footnote)
                            .fontWeight(.thin)
                            .padding(.leading, 10).padding(.top, 15)
                        HStack {
                            Image("Profile")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 85, maxHeight: 85)
                            Button("Change") {}
                                .withRegisterButtonStyles()
                                .padding(.horizontal, 7.5)
                            Button("Remove") {}
                                .withRemoveButtonStyle(rounded: false)
                                .padding(.horizontal, 7.5)
                        }.padding(.leading, 10)
                    }

                    Group {
                        Text("First Name")
                            .font(.footnote)
                            .fontWeight(.thin)
                            .padding(.leading, 10).padding(.top, 15)
                        Text(self.firstName)
                            .padding(10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color(red: 175/255, green: 175/255, blue: 175/255), lineWidth: 1)
                            )
                            .padding(.leading, 10).padding(.trailing, 20)

                        Text("Last Name")
                            .font(.footnote)
                            .fontWeight(.thin)
                            .padding(.leading, 10).padding(.top, 15)
                        Text(self.lastName).padding(10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color(red: 175/255, green: 175/255, blue: 175/255), lineWidth: 1)
                            )
                            .padding(.leading, 10).padding(.trailing, 20)

                        Text("Email")
                            .font(.footnote)
                            .fontWeight(.thin)
                            .padding(.leading, 10).padding(.top, 15)
                        Text(self.email)
                            .padding(10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color(red: 175/255, green: 175/255, blue: 175/255), lineWidth: 1)
                            )
                            .padding(.leading, 10).padding(.trailing, 20)

                        Text("Phone number")
                            .font(.footnote)
                            .fontWeight(.thin)
                            .padding(.leading, 10).padding(.top, 15)
                        Text("(217) 555-0113")
                            .padding(10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color(red: 175/255, green: 175/255, blue: 175/255), lineWidth: 1)
                            )
                            .padding(.leading, 10).padding(.trailing, 20)
                    }

                    Group {
                        Text("Email notifications")
                            .padding(.top, 20).padding(.leading, 10)
                            .font(.custom("Karla-bold", fixedSize: 18))

                        CheckBoxView(checked: self.$checkBoxOrderStatus, checkBoxLabel: "Order statuses")
                        CheckBoxView(checked: self.$checkBoxPasswordChange, checkBoxLabel: "Password Changes")
                        CheckBoxView(checked: self.$checkBoxSpecialOffers, checkBoxLabel: "Special offers")
                        CheckBoxView(checked: self.$checkBoxNewsletter, checkBoxLabel: "Newsletter")
                    }

                    Button {
                        UserDefaults.standard.set(false, forKey: isLoggedInKey)
                        self.presentation.wrappedValue.dismiss()
                    } label: {
                        Text("Log out").frame(maxWidth: .infinity)
                    }.withLogOutButtonStyle()
                        .padding(.horizontal, 10)
                        .padding(.top, 20)

                    HStack {
                        Button {} label: {
                            Text("Discard Changes")
                        }
                        .withRemoveButtonStyle(rounded: true)
                        .frame(maxWidth: .infinity)

                        Button {} label: {
                            Text("Save Changes")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        }
                        .withRegisterButtonStyles()
                        .frame(maxWidth: .infinity)

                    }.padding(20)
                }
                .frame(width: geometry.size.width)
                .frame(minHeight: geometry.size.height)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(.gray, lineWidth: 0.25))
            }
        }
    }
}

extension Button {
    func withLogOutButtonStyle() -> some View {
        self
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .fontWeight(.bold)
            .tint(Color(red: 244/255, green: 206/255, blue: 20/255))
            .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
            .cornerRadius(8)
    }

    func withRemoveButtonStyle(rounded: Bool) -> some View {
        self.buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(Color.white)
            .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: rounded ? 8 : 0)
                .stroke(Color(red: 73/255, green: 94/255, blue: 87/255), lineWidth: 1))
    }
}

struct CheckBoxView: View {
    @Binding var checked: Bool
    var checkBoxLabel: String

    var body: some View {
        HStack {
            Image(systemName: self.checked ? "checkmark.square.fill" : "square")
                .foregroundColor(self.checked ? Color(red: 73/255, green: 94/255, blue: 87/255) : Color(red: 175/255, green: 175/255, blue: 175/255))
                .onTapGesture {
                    self.checked.toggle()
                }
            Text(self.checkBoxLabel)
        }.padding(.leading, 10)
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
