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

class NodeExamples {
    
    func push<T>(value: T, to node: Node<T>?) -> Node<T>? {
        return Node(value: value, next: node)
    }
    
    func append<T>(value: T, to node: Node<T>?) -> Node<T>? {
        var nodeCopy = node
        while nodeCopy?.next != nil {
            nodeCopy = nodeCopy?.next
        }
        nodeCopy?.next = Node(value: value)
        return node
    }
    
    func count<T>(node: Node<T>?) -> Int {
        var nodeCopy = node
        var count = 0
        while nodeCopy != nil {
            count += 1
            nodeCopy = nodeCopy?.next
        }
        return count
    }
    
    func nodeAt<T>(index: Int, node: Node<T>?) -> Node<T>? {
        var nodeCopy = node
        var currentIndex = 0
        while nodeCopy != nil && currentIndex < index {
            currentIndex += 1
            nodeCopy = nodeCopy?.next
        }
        return nodeCopy
    }
    
    func insertAt<T>(index: Int, node: Node<T>?, value: T, dummyValue: T) -> Node<T>? {
        let dummy = Node(value: dummyValue, next: node)
        var nodeCopy: Node? = dummy
        var currentIndex = 0
        while nodeCopy != nil && currentIndex < index {
            currentIndex += 1
            nodeCopy = nodeCopy?.next
        }
        nodeCopy?.next = Node(value: value, next: nodeCopy?.next)
        return dummy.next
    }
    
    func pop<T>(node: Node<T>?) -> Node<T>? {
        return node?.next
    }
    
    func removeLast<T>(node: Node<T>?, dummyValue: T) -> Node<T>? {
        let dummy = Node(value: dummyValue, next: node)
        var nodeCopy: Node? = dummy
        while nodeCopy?.next?.next != nil {
            nodeCopy = nodeCopy?.next
        }
        nodeCopy?.next = nil
        return dummy.next
    }
    
    func removeAt<T>(index: Int, node: Node<T>?, dummyValue: T) -> Node<T>? {
        let dummy = Node(value: dummyValue, next: node)
        var nodeCopy: Node? = dummy
        var currentIndex = 0
        while nodeCopy != nil && currentIndex < index {
            currentIndex += 1
            nodeCopy = nodeCopy?.next
        }
        nodeCopy?.next = nodeCopy?.next?.next
        return dummy.next
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
