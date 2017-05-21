//
//  LinkedListNode.swift
//  Data Structures
//
//  Created by Daniel Slone on 5/21/17.
//  Copyright © 2017 Daniel Slone. All rights reserved.
//

import Foundation

public class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?
    
    public init(value: T) {
        self.value = value
    }
}
