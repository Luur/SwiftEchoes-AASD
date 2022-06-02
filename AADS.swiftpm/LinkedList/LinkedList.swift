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
    
    func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }
    
    @discardableResult
    mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        guard tail !== node else {
            append(value)
            return tail!
        }
        let newNode = Node(value: value, next: node.next)
        node.next = newNode
        return newNode
    }
    
    @discardableResult
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() -> Value? {
        // If head is nil, there’s nothing to remove, so you return nil.
        guard let head = head else {
            return nil
        }
        // If the list only consists of one node, removeLast is functionally equivalent to pop.
        guard head.next != nil else {
            return pop()
        }
        // You keep searching for a next node until current.next is nil. This signifies that current is the last node of the list.
        var prev = head
        var current = head
        while let next = current.next {
            prev = current
            current = next
        }
        // Since current is the last node, you simply disconnect it using the prev.next reference. You also make sure to update the tail reference.
        prev.next = nil
        tail = prev
        return current.value
    }
    
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
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
