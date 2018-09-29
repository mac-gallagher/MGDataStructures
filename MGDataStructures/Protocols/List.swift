//
//  List.swift
//  
//
//  Created by Mac Gallagher on 9/24/18.
//

import Foundation

public protocol List: Collection {
    associatedtype E
    
    mutating func append(_ newElement: E)
    
    mutating func insert(_ newElement: E, at index: Int)
    
    func get(_ index: Int) -> E
    
    mutating func remove(at index: Int) -> E
    
    mutating func set(_ newElement: E, at index: Int) -> E
}
