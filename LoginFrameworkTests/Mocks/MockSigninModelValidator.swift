//
//  MockSigninModelValidator.swift
//  LoginFrameworkTests
//
//  Created by AnhNguyen on 30/12/2022.
//

import Foundation
@testable import LoginFramework

class MockSigninModelValidator: SigninModelValidatorProtocol {
    
    var isUsernameValidated: Bool = false
    var isPasswordValidated: Bool = false
    var isEmailFormatValidated: Bool = false
    
    var isPasswordWasEmpty: Bool = false
    var isUsernameWasEmpty: Bool = false
    var isEmailFormatInValid: Bool = false
    
    func isUserNameValid(username: String) -> Bool {
        isUsernameValidated = !isUsernameWasEmpty
        return isUsernameValidated
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = !isPasswordWasEmpty
        return isPasswordValidated
    }
    
    func isValidEmailFormat(email: String) -> Bool {
        isEmailFormatValidated = !isEmailFormatInValid
        return isEmailFormatValidated
    }
    
}
