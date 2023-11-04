//
//  ProductDetailViewModelTests.swift
//  CabifyChallengeTests
//
//  Created by Bryan Caro on 25/2/23.
//

import XCTest
@testable import CabifyChallenge

final class ProductDetailViewModelTests: XCTestCase {
    private var sut: ProductDetailViewModel!
    
    override func setUp() {
        sut = .init()
    }

    //  MARK: - VARIABLES
    func test_isLoading_shouldBeTrue() {
        //  GIVEN
        let isLoading = sut.isLoading
                
        //  THEN
        XCTAssertFalse(isLoading)
    }
    
    func test_product_shoudNotBeEmptyConstant() {
        //  GIVEN
        let repository = sut.repository
        let cartProducts = ProductModel.mocks
        let product = ProductModel.mock
        let emptyProduct = ProductModel.empty
        
        //  WHEN
        repository?.onAppear(products: cartProducts, cartProducts: cartProducts, product: product)
        
        //  THEN
        let expectationProduct = sut.product
        XCTAssertEqual(product, expectationProduct)
        XCTAssertNotEqual(emptyProduct, expectationProduct)
    }
    
    func test_cartProducts_shouldBeEqualToInitCartProduct() {
        //  GIVEN
        let repository = sut.repository
        let cartProducts = ProductModel.mocks
        let product = ProductModel.mock
        
        //  WHEN
        repository?.onAppear(products: cartProducts, cartProducts: cartProducts, product: product)

        //  THEN
        let expectationCartProducts = sut.cartProducts
        XCTAssertEqual(cartProducts, expectationCartProducts)
    }
    
    func test_addToCart_shouldAddItemToCartProducts() {
        //  GIVEN
        let repository = sut.repository
        let product = ProductModel.mock
        
        //  WHEN
        repository?.addToCart(product: product)
        
        //  THEN
        let isAdded = sut.cartProducts.contains(where: { $0.id == product.id })
        XCTAssertTrue(isAdded)
    }
}
