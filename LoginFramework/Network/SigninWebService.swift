//
//  SigninWebService.swift
//  LoginFramework
//
//  Created by AnhNguyen on 30/12/2022.
//

import Foundation

final class SigninWebService: SigninWebServiceProtocol {
    
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signin(withForm formModel: SigninRequestModel, completionHandler: @escaping (SigninResponseModel?, SigninError?) -> Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(nil, SigninError.invalidRequestURLString)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            if let requestError = error {
                completionHandler(nil, SigninError.failedRequest(description: requestError.localizedDescription))
                return
            }
            
            if let data = data, let signinResponseModel = try? JSONDecoder().decode(SigninResponseModel.self, from: data) {
                completionHandler(signinResponseModel, nil)
            } else {
                completionHandler(nil, SigninError.invalidResponseModel)
            }
        }
        
        dataTask.resume()
    }
    
    
}
