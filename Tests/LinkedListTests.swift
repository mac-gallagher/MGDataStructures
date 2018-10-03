//
//  LinkedListTests.swift
//  MGDataStructuresTests
//
//  Created by Mac Gallagher on 9/30/18.
//  Copyright © 2018 Mac Gallagher. All rights reserved.
//

import XCTest
@testable import MGDataStructures

class LinkedListTests: XCTestCase {
    
    func testEmptyList() {
        let emptyList = LinkedList<Any>()
        XCTAssertTrue(emptyList.isEmpty)
        XCTAssertEqual(emptyList.count, 0)
        XCTAssertNil(emptyList.first)
        XCTAssertNil(emptyList.last)
    }
    
    func testAddOnEmptyList() {
        var list = LinkedList<Int>()
        list.add(123)
        XCTAssertEqual(list.count, 1)
        XCTAssertFalse(list.isEmpty)
        XCTAssertEqual(list.get(0), 123)
        XCTAssertEqual(list.first, 123)
        XCTAssertEqual(list.last, 123)
    }
    
    func testAdd() {
        var list = LinkedList<Int>()
        list.add(123)
        list.add(456)
        list.add(789)
        XCTAssertEqual(list.get(0), 123)
        XCTAssertEqual(list.get(1), 456)
        XCTAssertEqual(list.get(2), 789)
        XCTAssertEqual(list.count, 3)
        XCTAssertEqual(list.first, 123)
        XCTAssertEqual(list.last, 789)
    }
    
    func testInsertAtOnEmptyList() {
        var list = LinkedList<Int>()
        list.insert(123, at: 0)
        XCTAssertEqual(list.count, 1)
        XCTAssertFalse(list.isEmpty)
        XCTAssertEqual(list.get(0), 123)
    }
    
    func testInsertAt() {
        var list = LinkedList<String>()
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
    
    func testPeekOnEmptyList() {
        let emptyList = LinkedList<Any>()
        XCTAssertNil(emptyList.peek())
    }
    
    func testPeek() {
        var list = LinkedList<Int>()
        list.add(123)
        list.add(456)
        XCTAssertEqual(list.peek(), 123)
    }

    func testPollOnEmptyList() {
        var emptyList = LinkedList<Any>()
        XCTAssertNil(emptyList.poll())
    }
    
    func testPoll() {
        var list = LinkedList<Int>()
        list.add(123)
        list.add(456)
        XCTAssertEqual(list.poll(), 123)
        XCTAssertEqual(list.first, 456)
    }
    
    func testRemoveAtOnListWithOneElement() {
        var list = LinkedList<Int>()
        list.add(123)
        XCTAssertEqual(123, list.remove(at: 0))
        XCTAssertTrue(list.isEmpty)
    }
    
    func testRemoveAt() {
        var list = LinkedList<String>()
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
        var list = LinkedList<Int>()
        list.add(123)
        list.add(456)
        list.removeAll()
        XCTAssertTrue(list.isEmpty)
        XCTAssertEqual(list.count, 0)
    }
    
    func testSet() {
        var list = LinkedList<String>()
        list.add("a")
        list.add("b")
        list.add("c")
        
        list.set("d", at: 0)
        list.set("e", at: 1)
        list.set("f", at: 2)
        
        XCTAssertEqual(list.get(0), "d")
        XCTAssertEqual(list.get(1), "e")
        XCTAssertEqual(list.get(2), "f")
    }
    
    func testToArray() {
        var list = LinkedList<String>()
        list.add("a")
        list.add("b")
        list.add("c")
        list.add("d")
        
        let arr = ["a", "b", "c", "d"]
        XCTAssertTrue(list.toArray().elementsEqual(arr))
    }
}
