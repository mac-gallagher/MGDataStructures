//
//  List.swift
//  
//
//  Created by Mac Gallagher on 9/24/18.
//

import Foundation

public protocol List: Collection {
    associatedtype E
    
    mutating func add(_ e: E)
    
    mutating func add(index: Int, _ element: E)
    
    func get(index: Int) -> E
    
    mutating func remove(index: Int) -> E
    
    mutating func set(index: Int, _ element: E) -> E
}
