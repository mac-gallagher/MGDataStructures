//
//  List.swift
//  MGDataStructures
//
//  Created by Mac Gallagher on 9/24/18.
//  Copyright © 2018 Mac Gallagher. All rights reserved.
//

import Foundation

public protocol List: Collection {
    
    mutating func add(_ newElement: E)
    
    mutating func insert(_ newElement: E, at index: Int)
    
    func get(_ index: Int) -> E
    
    mutating func remove(at index: Int) -> E
    
    mutating func set(_ newElement: E, at index: Int) -> E
}
