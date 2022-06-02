//
//  File.swift
//  AADS
//
//  Created by Svyat Zubyak on 31.05.2022.
//

import SwiftUI

struct LinkedListView: View {
    
    var body: some View {
        
        VStack(spacing: 15) {
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Button("Run Example") {
                runAllExamples()
            }
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(5)
        }
        .navigationTitle("Linked List")
    }
}

//MARK: - Examples
extension LinkedListView {
    
    func runAllExamples() {
        push()
        append()
        insertAfter()
        pop()
        removeLast()
        removeAfter()
    }
    
    func push() {
        print("---Example of push---")
        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)
        print(list)
    }
    
    func append() {
        print("---Example of append---")
        var list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)
        print(list)
    }
    
    func insertAfter() {
        print("---Example of insert after---")
        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)
        print("Before inserting: \(list)")
        let middleNode = list.node(at: 1)!
        list.insert(-1, after: middleNode)
        print("After inserting: \(list)")
    }
    
    func pop() {
        print("---Example of pop---")
        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)
        print("Before popping: \(list)")
        let poppedValue = list.pop()
        print("After popping: \(list)")
        print("Popped value: " + String(describing: poppedValue))
    }
    
    func removeLast() {
        print("---Example of remove last---")
        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)
        print("Before removing: \(list)")
        let removedValue = list.removeLast()
        print("After removing: \(list)")
        print("Removed value: " + String(describing: removedValue))
    }
    
    func removeAfter() {
        print("---Example of remove after---")
        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)
        print("Before removing: \(list)")
        let middleNode = list.node(at: 0)!
        list.remove(after: middleNode)
        print("After removing: \(list)")
    }
}
