//
//  ProductsServiceTests.swift
//  CabifyChallengeTests
//
//  Created by Bryan Caro on 25/2/23.
//

import XCTest
@testable import CabifyChallenge

final class ProductsServiceTests: XCTestCase {
    private var server: ProductsServer?
    private var manager: NetworkController?

    override func setUpWithError() throws {
        server = ProductsServer()
        manager = server?.manager
    }

    override func tearDownWithError() throws {
        server = nil
        manager = nil
    }

    func test_ProductServer_getProducts_shouldNotBeNil() async {
        //  GIVEN
        guard let manager else {
            return XCTFail()
        }
        
        var response: ProductsResponse?
        let expectation = XCTestExpectation()
        
        //  WHEN
        do {
            response = try await manager.getProducts()
            expectation.fulfill()
        } catch {
            return XCTFail()
        }
        
        //  THEN
        wait(for: [expectation], timeout: 5)
        XCTAssertNotNil(response)
    }
    

}
