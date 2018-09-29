//
//  ArrayList.swift
//
//  Created by Mac Gallagher on 9/24/18.
//

import Foundation

public struct ArrayList<E>: List {
   
    private var arr: [E?]
    
    /// The total number of elements that the array can contain without allocating new storage.
    public var capacity: Int { return arr.count }

    /// The number of elements in the list.
    public var count: Int = 0
    
    /// A Boolean value indicating whether the list is empty.
    public var isEmpty: Bool { return count == 0 }
    
    /**
     Constructs an empty list with an initial capacity of ten.
    */
    public init() {
        arr = Array<E?>(repeating: nil, count: 10)
    }
    
    /**
     Constructs an empty list with the specified initial capacity.
     
     - Parameter initialCapacity: The initial capacity of the list.
    */
    public init(initialCapacity: Int) {
        arr = Array<E?>(repeating: nil, count: initialCapacity)
    }
    
    /**
     Appends the specified element to the end of this list.

     - Complexity: O(1) on average, over many calls to `add(_:)` on the same list. The worst-case is O(*n*), where *n* is the size of the list. This occurs when appending an element to a list whose size is equal to its capacity.
     
     - Parameter newElement: element to be appended to this list.
    */
    public mutating func append(_ newElement: E) {
        if capacity == 0 {
            arr.append(nil)
        } else if count == capacity {
            var temp = Array<E?>(repeating: nil, count: 2 * count)
            for i in 0..<count {
                temp[i] = arr[i]
            }
            arr = temp
        }
        arr[count] = newElement
        count += 1
    }
    
    /**
     Inserts the specified element at the specified position in this list. Shifts the element currently at that position and any subsequent elements to the right (adds one to their indices).
     
     - Complexity: O(*n*), where *n* is the length of the list. If `index == size()`, this method is equivalent to `add(_):`.
     
     - Parameter newElement: Element to be inserted.
     - Parameter index: Index at which the specified element is to be inserted.
    */
    public mutating func insert(_ newElement: E, at index: Int) {
        if count == capacity {
            var temp = Array<E?>(repeating: nil, count: 2 * count)
            for index in 0..<count {
                temp[index] = arr[index]
            }
            arr = temp
        }
        for i in 0..<(count - index) {
            arr[count - i] = arr[count - i - 1]
        }
        arr[index] = newElement
        count += 1
    }
    
    /**
     Returns the element at the specified position in this list.
     
     - Complexity: O(1)
     
     - Parameter index: Index of the element to return.
     
     - Returns: The element at the specified position in this list.
    */
    public func get(_ index: Int) -> E {
        if index >= 0 && index < count {
            return arr[index]!
        } else {
            fatalError("Index out of range")
        }
    }
    
    /**
     Removes the element at the specified position in this list. Shifts any subsequent elements to the left (subtracts one from their indices).
     
     - Complexity: O(*n*), where *n* is the length of the list.
     
     - Parameter index: The index of the element to be removed.
     
     - Returns: The element that was removed from the list.
    */
    public mutating func remove(at index: Int) -> E {
        let temp = arr[index]
        for i in index..<(count - 1) {
            arr[i] = arr[i + 1]
        }
        arr[count - 1] = nil
        count -= 1
        return temp!
    }
    
    /**
     Replaces the element at the specified position in this list with the specified element.
     
     - Complexity: O(1)
     
     - Parameter newElement: Element to be stored at the specified position.
     - Parameter index: Index of the element to replace.
     
     - Returns: The element previously at the specified position.
    */
    public mutating func set(_ newElement: E, at index: Int) -> E {
        let temp = arr[index]
        arr[index] = newElement
        return temp!
    }
    
    /**
     Removes all of the elements from this list. The list will be empty after this call returns.
     
     - Complexity: O(*n*), where *n* is the length of the list.
    */
    public mutating func removeAll() {
        for i in 0..<count {
            arr[i] = nil
        }
        count = 0
    }
    
    /**
     Returns an array containing all of the elements in this list in proper sequence (from first to last element).
     
     The returned array will be "safe" in that no references to it are maintained by this list. (In other words, this method must allocate a new array). The caller is thus free to modify the returned array.
     
     - Returns: An array containing all of the elements in this list in proper sequence.
    */
    public func toArray() -> [E] {
        var temp = arr
        temp.removeLast(capacity - count)
        return temp as! [E]
    }
}

//MARK: CustomStringConvertible

extension ArrayList: CustomStringConvertible {
    public var description: String { return toArray().description }
}
