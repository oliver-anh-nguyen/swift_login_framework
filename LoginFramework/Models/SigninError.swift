//
//  SigninError.swift
//  LoginFramework
//
//  Created by AnhNguyen on 29/12/2022.
//

import Foundation

enum SigninError: LocalizedError, Equatable {
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel:
            return "Invalid Response"
        case .invalidRequestURLString:
            return "Invalid Request URL String"
        }
    }
}
