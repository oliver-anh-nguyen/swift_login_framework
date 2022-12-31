//
//  SigninModelValidatorProtocol.swift
//  LoginFramework
//
//  Created by AnhNguyen on 29/12/2022.
//

import Foundation

protocol SigninModelValidatorProtocol {
    func isUserNameValid(username: String) -> Bool
    func isPasswordValid(password: String) -> Bool
    func isValidEmailFormat(email: String) -> Bool
}
