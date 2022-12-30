//
//  SigninPresenterProtocol.swift
//  LoginFramework
//
//  Created by AnhNguyen on 30/12/2022.
//

import Foundation

protocol SigninPresenterProtocol: AnyObject {
    init(formModelValidator: SigninModelValidatorProtocol, webservice: SigninWebServiceProtocol,
    delegate: SigninViewDelegate)
    
    func processUserSignin(formModel: SigninFormModel)
}
