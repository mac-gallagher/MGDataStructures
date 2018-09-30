//
//  MGDataStructuresTests.swift
//  MGDataStructuresTests
//
//  Created by Mac Gallagher on 9/28/18.
//  Copyright © 2018 Mac Gallagher. All rights reserved.
//

import XCTest
@testable import MGDataStructures

class ArrayListTests: XCTestCase {
    
    func testInitialization() {
        let list1 = ArrayList<Any>()
        XCTAssertEqual(list1.capacity, 10)
        XCTAssertEqual(list1.count, 0)
        
        let list2 = ArrayList<Any>(initialCapacity: 5)
        XCTAssertEqual(list2.capacity, 5)
        XCTAssertEqual(list2.count, 0)
        
        let list3 = ArrayList<Any>(initialCapacity: 0)
        XCTAssertEqual(list3.capacity, 0)
        XCTAssertEqual(list3.count, 0)
    }
    
    func testEmptyList() {
        let emptyList = ArrayList<Any>()
        XCTAssertTrue(emptyList.isEmpty)
        XCTAssertEqual(emptyList.count, 0)
    }
    
    func testAddOnEmptyList() {
        var list = ArrayList<Int>()
        list.add(123)
        XCTAssertEqual(list.count, 1)
        XCTAssertFalse(list.isEmpty)
    }
    
    func testAdd() {
        var list = ArrayList<Int>()
        list.add(123)
        list.add(456)
        list.add(789)
        XCTAssertEqual(list.get(0), 123)
        XCTAssertEqual(list.get(1), 456)
        XCTAssertEqual(list.get(2), 789)
        XCTAssertEqual(list.count, 3)
    }
    
    func testAddAtOnEmptyList() {
        var list = ArrayList<Int>()
        list.insert(123, at: 0)
        XCTAssertEqual(list.count, 1)
        XCTAssertFalse(list.isEmpty)
    }
    
    func testAddAt() {
        var list = ArrayList<String>()
        list.insert("a", at: 0)
        list.insert("b", at: 0)
        list.insert("c", at: 2)
        list.insert("d", at: 1)
        list.insert("e", at: 4)
        XCTAssertEqual(list.get(0), "b")
        XCTAssertEqual(list.get(1), "d")
        XCTAssertEqual(list.get(2), "a")
        XCTAssertEqual(list.get(3), "c")
        XCTAssertEqual(list.get(4), "e")
    }
    
    func testDynamicResizing() {
        var list1 = ArrayList<Int>(initialCapacity: 0)
        XCTAssertEqual(list1.capacity, 0)
        
        list1.add(123)
        XCTAssertEqual(list1.capacity, 1)
        
        var list2 = ArrayList<Int>(initialCapacity: 3)
        for _ in 0..<3 {
            list2.add(123)
        }
        XCTAssertEqual(list2.capacity, 3)
        
        list2.add(456)
        XCTAssertEqual(list2.capacity, 3 + 3/2)
        
        var list3 = ArrayList<Int>(initialCapacity: 1000)
        for _ in 0..<1001 {
            list3.add(123)
        }
        XCTAssertEqual(list3.capacity, 1000 + 1000/2)
    }
    
    func testRemoveAtOnListWithOneElement() {
        var list = ArrayList<Int>()
        list.add(123)
        XCTAssertEqual(123, list.remove(at: 0))
        XCTAssertTrue(list.isEmpty)
    }
    
    func testRemoveAt() {
        var list = ArrayList<String>()
        list.add("a")
        list.add("b")
        list.add("c")
        list.add("d")
        list.add("e")
        
        XCTAssertEqual(list.remove(at: 0), "a")
        XCTAssertEqual(list.get(0), "b")
        
        XCTAssertEqual(list.remove(at: 2), "d")
        XCTAssertEqual(list.get(1), "c")
        
        XCTAssertEqual(list.remove(at: 2), "e")
        XCTAssertEqual(list.get(1), "c")
        
        XCTAssertEqual(list.count, 2)
    }
    
    func testRemoveAllOnEmptyList() {
        var list = ArrayList<String>()
        list.removeAll()
        XCTAssertTrue(list.isEmpty)
    }
    
    func testRemoveAll() {
        var list = ArrayList<String>()
        list.add("a")
        list.add("b")
        list.add("c")
        list.add("d")
        list.removeAll()
        XCTAssertTrue(list.isEmpty)
    }
    
    func testToArray() {
        var list = ArrayList<String>()
        list.add("a")
        list.add("b")
        list.add("c")
        list.add("d")
        
        let arr = ["a", "b", "c", "d"]
        XCTAssertTrue(list.toArray().elementsEqual(arr))
    }
}
