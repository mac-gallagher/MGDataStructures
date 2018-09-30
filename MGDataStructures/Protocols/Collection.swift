//
//  Collection.swift
//  MGDataStructures
//
//  Created by Mac Gallagher on 9/24/18.
//  Copyright © 2018 Mac Gallagher. All rights reserved.
//

import Foundation

public protocol Collection {
    associatedtype E
    
    var count: Int { get }

    var isEmpty: Bool { get }
    
    mutating func removeAll()

    func toArray() -> [E]
}
