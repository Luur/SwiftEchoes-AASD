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
}
