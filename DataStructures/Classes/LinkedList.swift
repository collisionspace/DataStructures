//
//  LinkedList.swift
//  Data Structures
//
//  Created by Daniel Slone on 5/21/17.
//  Copyright © 2017 Daniel Slone. All rights reserved.
//

import Foundation

public class LinkedList<T> {
    public typealias Node = LinkedListNode<T>
    
    private var head: Node?
    private var counter = 0
    
    public var count: Int {
        return counter
    }
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        if var node = head {
            while case let next? = node.next {
                node = next
            }
            return node
        } else {
            return nil
        }
    }
    
    
     public func append(value: T) {
        let newNode = Node(value: value)
        counter += 1
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    public func removeAll() {
        head = nil
        counter = 0
    }
    
    public func removeAt(index: Int) {
        if counter >= 0 && index <= counter {
            var node = head
            var i = index
            while node != nil {
                if i == 0 {
                    let previous = node!.previous
                    let next = node!.next
                    previous!.next = next
                    next!.previous = previous
                    counter -= 1
                    return
                }
                i -= 1
                node = node!.next
            }
        }
    }
    
    public func nodeAt(_ index: Int) -> Node? {
        if index >= 0 {
            var node = head
            var i = index
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }
    
    public func map<U>(transform: (T) -> U) -> LinkedList<U> {
        let result = LinkedList<U>()
        var node = head
        while node != nil {
            result.append(value: transform(node!.value))
            node = node!.next
        }
        return result
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var s = "["
        var node = first
        while node != nil {
            s += "\(node!.value)"
            node = node!.next
            if node != nil { s += ", " }
        }
        return s + "]"
    }
}
