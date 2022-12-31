//
//  SigninModelValidator.swift
//  LoginFramework
//
//  Created by AnhNguyen on 29/12/2022.
//

import Foundation

final class SigninModelValidator: SigninModelValidatorProtocol {
    
    func isUserNameValid(username: String) -> Bool {
        var isUserNameValid = true
        
        if username.isEmpty {
            isUserNameValid = false
        }
        
        return isUserNameValid
    }
    
    func isPasswordValid(password: String) -> Bool {
        var isPasswordValid = true
        
        if password.isEmpty {
            isPasswordValid = false
        }
        
        return isPasswordValid
    }
    
    func isValidEmailFormat(email: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
    }

}
