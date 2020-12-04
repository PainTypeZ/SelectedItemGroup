//
//  SelectedItemGroupTests.swift
//  SelectedItemGroupTests
//
//  Created by Pengpingjun on 2020/12/3.
//

import XCTest
@testable import SelectedItemGroup

class SelectedItemGroupTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//
//    }
    
    private func creatManagerForTest() -> SelectButtonsManager {
        let manager = SelectButtonsManager()
        manager.items = [SelectItemButton()]
        manager.maxSelectedNumber = 1
        manager.minSelectedNumber = 0
        return manager
    }
    
    func testCheckData() throws {
        let manager = SelectButtonsManager()
        let emptyItems: [SelectItemButton] = []
        let notEmptyItems: [SelectItemButton] = [SelectItemButton()]
        
        manager.maxSelectedNumber = 1
        manager.minSelectedNumber = 0
        
        XCTAssert(!manager.checkData(emptyItems))
        XCTAssert(manager.checkData(notEmptyItems))
    }
    
    func testHandleSelectedValueType() throws {
        let manager = creatManagerForTest()
        
        manager.handleSelected(tag: 0, items: &manager.items)
        XCTAssert(manager.selectedItems.count == 1)
        
        manager.handleSelected(tag: 0, items: &manager.items)
        XCTAssert(manager.selectedItems.count == 0)
    }
    
    func testHandleSelectedReferenceType() throws {
        let manager = creatManagerForTest()
        
        manager.items = manager.handleSelected(tag: 0, items: manager.items)
        XCTAssert(manager.selectedItems.count == 1)
        
        manager.items = manager.handleSelected(tag: 0, items: manager.items)
        XCTAssert(manager.selectedItems.count == 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            let mangaer = creatManagerForTest()
            mangaer.handleSelected(tag: 0, items: &mangaer.items)
        }
    }

}
