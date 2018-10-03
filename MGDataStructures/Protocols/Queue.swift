//
//  Queue.swift
//  MGDataStructures
//
//  Created by Mac Gallagher on 9/29/18.
//  Copyright © 2018 Mac Gallagher. All rights reserved.
//

import Foundation

public protocol Queue: Collection {
    
    mutating func add(_ newElement: E)
    
    func peek() -> E?
    
    mutating func poll() -> E?
}
