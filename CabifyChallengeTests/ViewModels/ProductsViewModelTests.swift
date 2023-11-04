//
//  ProductsViewModelTests.swift
//  CabifyChallengeTests
//
//  Created by Bryan Caro on 25/2/23.
//

import XCTest
@testable import CabifyChallenge

final class ProductsViewModelTests: XCTestCase {
    private var sut: ProductsViewModel!
//        var mockRepository: MockProductsRepository!
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
    
    func test_isAnimation_shouldBeFalse() {
        //  GIVEN
        let isLoading = sut.isAnimating
                
        //  THEN
        XCTAssertFalse(isLoading)
    }
    
    func test_showProductDetail_shouldBeFalse() {
        //  GIVEN
        let showProductDetail = sut.showProductDetail
                
        //  THEN
        XCTAssertFalse(showProductDetail)
    }
    
    func test_sheetType_shouldBeNil() {
        //  GIVEN
        let sheetType = sut.sheetType
                
        //  THEN
        XCTAssertNil(sheetType)
    }
    
    func test_productsVariables_shouldBeEmpty() {
        //  GIVEN
        let productsIsEmpty = sut.products.isEmpty
        let cartProductsIsEmpty = sut.cartProducts.isEmpty
                
        //  THEN
        XCTAssertTrue(productsIsEmpty)
        XCTAssertTrue(cartProductsIsEmpty)
    }
    
    func test_product_shouldBeEmptyModelConstant() {
        //  GIVEN
        let emptyModel = ProductModel.empty
        let product = sut.product
                
        //  THEN
        XCTAssertEqual(emptyModel, product)
    }
    
    //  MARK: - METHODS
    func test_openCartMethod_shouldSetSheetTypeToCart() {
        //  GIVEN
        let expectation = ProductsViewModel.SheetType.cart
        let repository = sut.repository
        
        //  WHEN
        repository?.openCartView()
        let sheetType = sut.sheetType
        
        //  THEN
        XCTAssertEqual(expectation, sheetType)
    }
    
    func test_openMeMethod_shouldSetSheetTypeToMe() {
        //  GIVEN
        let expectation = ProductsViewModel.SheetType.me
        let repository = sut.repository
        
        //  WHEN
        repository?.openMeView()
        let sheetType = sut.sheetType
        
        //  THEN
        XCTAssertEqual(expectation, sheetType)
    }
    
    func test_openProductDetail_shouldSetShowProductDetailToTrue() {
        //  GIVEN
        let repository = sut.repository
        let product: ProductModel = ProductModel.mock
        
        //  WHEN
        repository?.openProductDetail(product: product)
        
        //  THEN
        let showProductDetail = sut.showProductDetail
        XCTAssertTrue(showProductDetail)
    }
    
    func test_product_shouldBeNotEqualToEmptyModelConstant() {
        //  GIVEN
        let repository = sut.repository
        let product: ProductModel = ProductModel.mock
        let emptyModel = ProductModel.empty
        
        //  WHEN
        repository?.openProductDetail(product: product)
        
        //  THEN
        let expectation = sut.product
        XCTAssertNotEqual(emptyModel, expectation)
    }
    
    func test_dismissProductDetail_shouldBeSetProductToEmpty_shouldBeSetShowProductDetailToFalse() {
        //  GIVEN
        test_product_shouldBeNotEqualToEmptyModelConstant()
        let repository = sut.repository
        let expectation = ProductModel.empty
        
        //  WHEN
        repository?.dismissProductDetail()
        
        //  THEN
        let product = sut.product
        XCTAssertEqual(expectation, product)
        
        let showProductDetail = sut.showProductDetail
        XCTAssertFalse(showProductDetail)
    }
}
