//
//  LinkedList.swift
//  MGDataStructures
//
//  Created by Mac Gallagher on 9/25/18.
//  Copyright © 2018 Mac Gallagher. All rights reserved.
//

import Foundation

private class Node<E> {
    var data: E
    var next: Node?
    
    public init(data: E) {
        self.data = data
    }
}

/**
 Singly-linked list implementation of the List and Queue interfaces.
*/
public struct LinkedList<E>: Queue, List {
    
    private var head: Node<E>?
    
    /// The number of elements in this list.
    public var count: Int = 0
    
    /// A Boolean value indicating whether this list is empty.
    public var isEmpty: Bool { return head == nil }
    
    /// The first element in this list
    public var first: E? { return head?.data }
    
    /// The last element in this list
    public var last: E? {
        var last = head
        while last?.next != nil {
            last = last?.next
        }
        return last?.data
    }
    
    /**
     Constructs an empty list.
    */
    public init() {}
    
    /**
     Appends the specified element to the end of this list.
     
     - Complexity: O(*n*) where *n* is the size of the list.
     
     - Parameter newElement: Element to be appended to this list.
     */
    public mutating func add(_ newElement: E) {
        if var node = head {
            while(node.next != nil) {
                node = node.next!
            }
            node.next = Node<E>(data: newElement)
        } else {
            head = Node<E>(data: newElement)
        }
        count += 1
    }
    
    /**
     Returns the element at the specified position in this list.
     
     - Complexity: O(*n*) where *n* is the size of the list.
     
     - Parameter index: Index of the element to return.
     
     - Returns: The element at the specified position in this list.
    */
    public func get(_ index: Int) -> E {
        if head == nil {
            fatalError("Cannot access element of empty list")
        }
        
        if index >= 0 && index < count {
            var node = head
            for _ in 0..<index {
                node = node?.next
            }
            return node!.data
        } else {
            fatalError("Index out of range")
        }
    }
    
    /**
     Inserts the specified element at the specified position in this list. Shifts the element currently at that position and any subsequent elements to the right (adds one to their indices).
     
     - Complexity: O(*n*) where *n* is the size of the list.
     
     - Parameter newElement: Element to be inserted.
     - Parameter index: Index of the element to return.
    */
    public mutating func insert(_ newElement: E, at index: Int) {
        let newNode = Node<E>(data: newElement)
        
        if head == nil {
            head = newNode
        } else if index == 0 {
            newNode.next = head
            head = newNode
        } else {
            var leftNode = head
            for _ in 0..<(index - 1) {
                leftNode = leftNode?.next
            }
            if index == count {
                leftNode?.next = newNode
            } else {
                let rightNode = leftNode?.next
                leftNode?.next = newNode
                newNode.next = rightNode
            }
        }
        count += 1
    }
    
    /**
     Retrieves, but does not remove, the head (first element) of this list.
     
     - Complexity: O(1)
     
     - Returns: The head of this list, or *nil* if this list is empty
    */
    public func peek() -> E? {
        return head?.data
    }
    
    /**
     Retrieves and removes the head (first element) of this list.
     
     - Complexity: O(1)
     
     - Returns: The head of this list, or *nil* if this list is empty
    */
    public mutating func poll() -> E? {
        let node = head
        head = head?.next
        return node?.data
    }
    
    /**
     Removes the element at the specified position in this list. Shifts any subsequent elements to the left (subtracts one from their indices). Returns the element that was removed from the list.
     
     - Complexity: O(*n*), where *n* is the length of this list.
     
     - Parameter index: The index of the element to be removed.
     
     - Returns: The element previously at the specified position.
     */
    public mutating func remove(at index: Int) -> E {
        if head == nil {
            fatalError("Cannot access element of empty list")
        }
        
        var deletedNode: Node<E>?
        var temp = head
        
        if index == 0 {
            deletedNode = head
            head = temp?.next
        } else if index > 0 && index < count {
            for _ in 0..<(index - 1) {
                temp = temp?.next
            }
            let next = temp?.next?.next
            deletedNode = temp?.next
            temp?.next = next
        } else {
            fatalError("Index out of range")
        }
        count -= 1
        return deletedNode!.data
    }
    
    /**
     Removes all of the elements from this list. The list will be empty after this call returns.
    */
    public mutating func removeAll() {
        head = nil
        count = 0
    }
    
    /**
     Replaces the element at the specified position in this list with the specified element.
     
     - Parameter index: Index of the element to return.
     
     - Returns: The element at the specified position in this list.
    */
    public mutating func set(_ newElement: E, at index: Int) -> E {
        var node = head
        for _ in 0..<index {
            node = node?.next
        }
        node?.data = newElement
        return node!.data
    }
    
    /**
     Returns an array containing all of the elements in this list in proper sequence (from first to last element). The returned array will be "safe" in that no references to it are maintained by this list. (In other words, this method must allocate a new array). The caller is thus free to modify the returned array.
     
     - Returns: An array containing all of the elements in this list in proper sequence
     */
    public func toArray() -> [E] {
        var arr = Array<E>()
        var node = head
        while(node != nil) {
            arr.append(node!.data)
            node = node?.next
        }
        return arr
    }
}

//MARK: CustomStringConvertible

extension LinkedList: CustomStringConvertible {
    public var description: String { return toArray().description }
}
