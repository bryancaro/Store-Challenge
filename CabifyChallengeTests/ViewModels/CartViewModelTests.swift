//
//  CartViewModelTests.swift
//  CabifyChallengeTests
//
//  Created by Bryan Caro on 25/2/23.
//

import XCTest
@testable import CabifyChallenge

final class CartViewModelTests: XCTestCase {
    private var sut: CartViewModel!
    
    override func setUp() {
        sut = .init()
    }

    //  MARK: - VARIABLES
    func test_isLoading_shouldBeTrue() {
        //  GIVEN
        let isLoading = sut.isLoading
                
        //  THEN
        XCTAssertTrue(isLoading)
    }
    
    func test_cartProducts_shouldBeEmpty() {
        //  GIVEN
        let cartProducts = sut.cartProducts.isEmpty
                
        //  THEN
        XCTAssertTrue(cartProducts)
    }
    
    func test_cartProduct_shouldNotBeEmpty() {
        //  GIVEN
        let repository = sut.repository
        let cartProducts = ProductModel.mocks
        
        //  WHEN
        repository?.onAppear(cartProducts: cartProducts)
        
        //  THEN
        let expectation = !sut.cartProducts.isEmpty
        XCTAssertTrue(expectation)
    }
    
    func test_deleteCartItemMethod_shouldDeleteOneItemFromCartProducts() {
        //  GIVEN
        test_cartProduct_shouldNotBeEmpty()
        let repository = sut.repository
        let cartProducts = ProductModel.mocks
        let index = 0
        let cartProductsCount = cartProducts.count
        
        //  WHEN
        repository?.deleteCartProduct(index, cartProducts: cartProducts)
        
        //  THEN
        let sutCartProducts = sut.cartProducts
        let sutCartProductsCount = sutCartProducts.count
        XCTAssertEqual(cartProductsCount - 1, sutCartProductsCount)
    }
}
