//
//  SigninWebServiceTests.swift
//  LoginFrameworkTests
//
//  Created by AnhNguyen on 30/12/2022.
//

import XCTest
@testable import LoginFramework

class SigninWebServiceTests: XCTestCase {
    
    var sut: SigninWebService!
    var signinRequestModel: SigninRequestModel!
    
    override func setUp() {
        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = SigninWebService(urlString: "https://jsonplaceholder.typicode.com", urlSession: urlSession)
        signinRequestModel = SigninRequestModel(username: "oliver", password: "123")
        
    }
    
    override func tearDown() {
        sut = nil
        signinRequestModel = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }
    
    func testSigninWebService_WhenGivenSuccessfullResponse_ReturnsSuccess() {
        // Given
        let jsonString = "{\"token\":\"ok\"}"
        MockURLProtocol.stubResponseData =  jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signin Web Service Response Expectation")
        
        // When
        sut.signin(withForm: signinRequestModel) { (signinResponseModel, error) in
            
            // Then
            XCTAssertEqual(signinResponseModel?.token, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSigninWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        // Given
        let jsonString = "{\"path\":\"/user\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData =  jsonString.data(using: .utf8)

        let expectation = self.expectation(description: "signin() method expectation for a response that contains a different JSON structure")

        // When
        sut.signin(withForm: signinRequestModel) { (signinResponseModel, error) in
            
            // Then
            XCTAssertNil(signinResponseModel, "The response model for a request containing unknown JSON response, should have been nil")
            XCTAssertEqual(error, SigninError.invalidResponseModel, "The signin() method did not return expected error")
            XCTAssertEqual(error?.localizedDescription, "Invalid Response")
            expectation.fulfill()
        }

        self.wait(for: [expectation], timeout: 5)
    }

    func testSigninWebservice_WhenEmptyURLStringProvided_ReturnsError() {
        // Given
        let expectation = self.expectation(description: "An empty request URL string expectation")

        sut = SigninWebService(urlString: "")

        // When
        sut.signin(withForm: signinRequestModel) { (signinResponseModel, error) in

            // Then
            XCTAssertEqual(error, SigninError.invalidRequestURLString, "The signin() method did not return an expected error for an invalidRequestURLString error")
            XCTAssertNil(signinResponseModel, "When an invalidRequestURLString takes place, the response model must be nil")
            XCTAssertEqual(error?.localizedDescription, "Invalid Request URL String")
            expectation.fulfill()
        }

        self.wait(for: [expectation], timeout: 2)
    }

    func testSigninWebService_WhenURLRequestFails_ReturnsErrorMessageDescription() {
        // Given
        let expectation = self.expectation(description: "A failed Request expectation")
        let errorDescription = "A localized description of an error"
        MockURLProtocol.error = SigninError.failedRequest(description:errorDescription)

        // When
        sut.signin(withForm: signinRequestModel) { (signinResponseModel, error) in
            
            // Then
            XCTAssertEqual(error, SigninError.failedRequest(description:errorDescription), "The signin() method did not return an expecter error for the Failed Request")
            XCTAssertEqual(error?.localizedDescription, errorDescription)
            expectation.fulfill()
        }

        self.wait(for: [expectation], timeout: 2)
    }
}
