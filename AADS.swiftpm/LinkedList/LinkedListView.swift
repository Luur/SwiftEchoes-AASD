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
            
            Button("Run Node Examples") {
                runAllNodeExamples()
            }
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(5)
        }
        .navigationTitle("Linked List")
    }
}

//MARK: - ListNode Examples
extension LinkedListView {
    
    var node: Node<Int>? {
        Node(value: 0, next: Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: nil))))
    }
    
    func runAllNodeExamples() {
        let examples = NodeExamples()
        print("---- push ----")
        let pushResult = examples.push(value: 100, to: node)
        print(pushResult ?? "")
        print("---- apend ----")
        let appendResult = examples.append(value: 100, to: node)
        print(appendResult ?? "")
        print("---- count ----")
        let count = examples.count(node: node)
        print(count)
        print("---- node at index ----")
        let nodeIndexResult = examples.nodeAt(index: 2, node: node)
        print(nodeIndexResult ?? "")
        print("---- insert at index ----")
        let insertNodeResult = examples.insertAt(index: 2, node: node, value: 100, dummyValue: -1)
        print(insertNodeResult ?? "")
        print("---- pop ----")
        let popResult = examples.pop(node: node)
        print(popResult ?? "")
        print("---- remove last ----")
        let removeLastResult = examples.removeLast(node: node, dummyValue: -1)
        print(removeLastResult ?? "")
        print("---- remove at index ----")
        let removeAtIndexResult = examples.removeAt(index: 2, node: node, dummyValue: -1)
        print(removeAtIndexResult ?? "")
    }
}
