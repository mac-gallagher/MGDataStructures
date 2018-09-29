//
//  Collection.swift
//  
//
//  Created by Mac Gallagher on 9/24/18.
//

import Foundation

public protocol Collection {
    associatedtype E
    
    mutating func clear()

    func isEmpty() -> Bool
    
    func size() -> Int
    
    func toArray() -> [E]
}
