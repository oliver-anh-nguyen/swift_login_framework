//
//  SigninViewDelegate.swift
//  LoginFramework
//
//  Created by AnhNguyen on 29/12/2022.
//

import Foundation

protocol SigninViewDelegate: AnyObject {
    func successfullSignin()
    func errorSignin(error: SigninError)
}
