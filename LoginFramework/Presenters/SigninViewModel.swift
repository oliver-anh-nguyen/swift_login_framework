//
//  SigninViewModel.swift
//  LoginFramework
//
//  Created by AnhNguyen on 04/01/2023.
//

import Foundation

enum ResultHandling {
    case none
    case successfulSignin(data: SigninResponseModel)
    case errorSignin(error: SigninError)
    case errorUsernameIsEmpty
    case errorPasswordIsEmpty
    case errorFormatEmail
}

final class SigninViewModel: ObservableObject {
    
    @Published var result: ResultHandling = .none

    private var signinPresenter: SigninPresenterProtocol?
    
    init() {
        signinPresenter = SigninPresenter(formModelValidator: SigninModelValidator(),
                                          webservice: MockWebService(),
                                          delegate: self)
    }
    
    func signin(model: SigninFormModel) {
        signinPresenter?.processUserSignin(formModel: model)
    }
    
}

extension SigninViewModel: SigninViewDelegate {
    func successfulSignin(data: SigninResponseModel) {
        result = .successfulSignin(data: data)
    }
    
    func errorSignin(error: SigninError) {
        result = .errorSignin(error: error)
    }
    
    func errorUsernameIsEmpty() {
        result = .errorUsernameIsEmpty
    }
    
    func errorPasswordIsEmpty() {
        result = .errorPasswordIsEmpty
    }
    
    func errorFormatEmail() {
        result = .errorFormatEmail
    }
}
