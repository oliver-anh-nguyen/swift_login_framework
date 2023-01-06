//
//  SigninViewControllerSwiftUI.swift
//  LoginFramework
//
//  Created by AnhNguyen on 04/01/2023.
//

import SwiftUI

public struct SigninViewControllerSwiftUI: View {

    @State private var username = ""
    @State private var password = ""
    @ObservedObject var signinModel: SigninViewModel
    
    public init() {
        signinModel = SigninViewModel()
    }

    public var body: some View {
        VStack {
            TextField("username", text: $username)
            TextField("password", text: $password)
            Button {
                signin()
            } label: {
                Text("Signin")
            }
            switch signinModel.result {
            case .none: EmptyView()
            case .successfulSignin(let data):
                Text(data.token)
            case .errorFormatEmail:
                Text("This email looks incorrect, please retry!")
            case .errorSignin(let error):
                Text(showError(error: error))
            case .errorPasswordIsEmpty:
                Text("Password cannot be empty!")
            case .errorUsernameIsEmpty:
                Text("Username cannot be empty!")
            }
        }
    }

    func showError(error: SigninError) -> String {
        var mess = "Something wrong! Please try again!"
        if let errorDes = error.errorDescription, errorDes != "" {
            mess = errorDes
        }
        return mess
    }

    func signin() {
        let formModel = SigninFormModel(username: username, password: password)
        signinModel.signin(model: formModel)
    }
}

struct SigninViewControllerSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        SigninViewControllerSwiftUI()
    }
}
