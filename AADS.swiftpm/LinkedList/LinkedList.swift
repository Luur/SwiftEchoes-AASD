//
//  File.swift
//  AADS
//
//  Created by Svyat Zubyak on 31.05.2022.
//

import Foundation

class Node<Value> {

    var value: Value
    var next: Node?
      
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {

    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}


struct LinkedList<Value> {

    var head: Node<Value>?
    var tail: Node<Value>?
  
    init() {}

    var isEmpty: Bool {
        head == nil
    }
    
    mutating func push(_ value: Value) {
        
        let newFirstNode = Node(value: value, next: head)
        head = newFirstNode
        
        //In the case in which you’re pushing into an empty list, the new node is both the head and tail of the list.
        if tail == nil {
            tail = newFirstNode
        }
    }
    
    mutating func append(_ value: Value) {
        
        //If the list is empty, you’ll need to update both head and tail to the new node. Since append on an empty list is functionally identical to push, you simply invoke push to do the work for you.
        guard !isEmpty else {
            push(value)
            return
        }
        
        //You simply create a new node after the tail node.
        let newLastNode = Node(value: value, next: nil)
        tail?.next = newLastNode
        
        //Since this is tail-end insertion, your new node is also the tail of the list.
        tail = tail?.next
    }
}

extension LinkedList: CustomStringConvertible {

    var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}
