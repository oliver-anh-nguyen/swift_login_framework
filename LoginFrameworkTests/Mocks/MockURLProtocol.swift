//
//  MockURLProtocol.swift
//  LoginFrameworkTests
//
//  Created by AnhNguyen on 30/12/2022.
//

import Foundation
@testable import LoginFramework

class MockURLProtocol: URLProtocol {
    
    static var stubResponseData: Data?
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        
        if let signinError = MockURLProtocol.error {
            let error = NSError(domain: "testingError", code: -99, userInfo: [NSLocalizedDescriptionKey: signinError.localizedDescription])
                 self.client?.urlProtocol(self, didFailWithError: error)
        } else {
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        }
        
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        
    }
    
}
