//
//  Collection.swift
//  
//
//  Created by Mac Gallagher on 9/24/18.
//

import Foundation

public protocol Collection {
    associatedtype E
    
    var count: Int { get }

    var isEmpty: Bool { get }
    
    mutating func removeAll()

    func toArray() -> [E]
}
