//
//  File.swift
//  AADS
//
//  Created by Svyat Zubyak on 31.05.2022.
//

import SwiftUI

struct UnionFindView: View {
    
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
        .navigationTitle("Union Find")
    }
}

//MARK: - Examples
extension UnionFindView {
    
    func runAllExamples() {
        quickFind()
        hashableQuickFind()
        quickUnion()
        hashableQuickUnion()
        weightedQuickUnion()
        hashableWeightedQuickUnion()
        weightedQuickUnionWithPathCompression()
        hashableWeightedQuickUnionWithPathCompression()
    }
    
    func quickFind() {
        print("---Example of QuickFind---")
        let qf = QuickFind(count: 6)
        print(qf.elements)
        qf.union(p: 2, q: 5)
        print(qf.elements)
        qf.union(p: 2, q: 4)
        print(qf.elements)
        qf.union(p: 5, q: 0)
        print(qf.elements)
    }
    
    func hashableQuickFind() {
        print("---Example of HashableQuickFind---")
        let hqf = HashableQuickFind<String>(elements: ["A", "B", "C", "D", "E", "F"])
        print(hqf.parents)
        hqf.union(p: "C", q: "F")
        print(hqf.parents)
        hqf.union(p: "C", q: "E")
        print(hqf.parents)
        hqf.union(p: "F", q: "A")
        print(hqf.parents)
    }
    
    func quickUnion() {
        print("---Example of QuickUnion---")
        let qu = QuickUnion(count: 6)
        print(qu.elements)
        qu.union(p: 2, q: 5)
        print(qu.elements)
        qu.union(p: 2, q: 4)
        print(qu.elements)
        qu.union(p: 5, q: 0)
        print(qu.elements)
    }
    
    func hashableQuickUnion() {
        print("---Example of HashableQuickUnion---")
        let hqu = HashableQuickUnion<String>(elements: ["A", "B", "C", "D", "E", "F"])
        print(hqu.parents)
        hqu.union(p: "C", q: "F")
        print(hqu.parents)
        hqu.union(p: "C", q: "E")
        print(hqu.parents)
        hqu.union(p: "F", q: "A")
        print(hqu.parents)
    }
    
    func weightedQuickUnion() {
        print("---Example of WeightedQuickUnion---")
        let wqu = WeightedQuickUnion(count: 6)
        print(wqu.elements, wqu.sizes)
        wqu.union(p: 2, q: 5)
        print(wqu.elements, wqu.sizes)
        wqu.union(p: 2, q: 4)
        print(wqu.elements, wqu.sizes)
        wqu.union(p: 3, q: 0)
        print(wqu.elements, wqu.sizes)
        wqu.union(p: 4, q: 3)
        print(wqu.elements, wqu.sizes)
    }
    
    func hashableWeightedQuickUnion() {
        print("---Example of HashableWeightedQuickUnion---")
        let hwqu = HashableWeightedQuickUnion<String>(elements: ["A", "B", "C", "D", "E", "F"])
        print(hwqu.parents, hwqu.sizes)
        hwqu.union(p: "C", q: "F")
        print(hwqu.parents, hwqu.sizes)
        hwqu.union(p: "C", q: "E")
        print(hwqu.parents, hwqu.sizes)
        hwqu.union(p: "D", q: "A")
        print(hwqu.parents, hwqu.sizes)
        hwqu.union(p: "E", q: "D")
        print(hwqu.parents, hwqu.sizes)
    }
    
    func weightedQuickUnionWithPathCompression() {
        print("---Example of WeightedQuickUnionWithPathCompression---")
        let wqupc = WeightedQuickUnionWithPathCompression(count: 6)
        print(wqupc.elements, wqupc.sizes)
        wqupc.union(p: 2, q: 5)
        print(wqupc.elements, wqupc.sizes)
        wqupc.union(p: 2, q: 4)
        print(wqupc.elements, wqupc.sizes)
        wqupc.union(p: 3, q: 0)
        print(wqupc.elements, wqupc.sizes)
        wqupc.union(p: 4, q: 3)
        print(wqupc.elements, wqupc.sizes)
    }
    
    func hashableWeightedQuickUnionWithPathCompression() {
        print("---Example of HashableWeightedQuickUnionWithPathCompression---")
        let hwqupc = HashableWeightedQuickUnionWithPathCompression<String>(elements: ["A", "B", "C", "D", "E", "F"])
        print(hwqupc.parents, hwqupc.sizes)
        hwqupc.union(p: "C", q: "F")
        print(hwqupc.parents, hwqupc.sizes)
        hwqupc.union(p: "C", q: "E")
        print(hwqupc.parents, hwqupc.sizes)
        hwqupc.union(p: "D", q: "A")
        print(hwqupc.parents, hwqupc.sizes)
        hwqupc.union(p: "E", q: "D")
        print(hwqupc.parents, hwqupc.sizes)
    }
}
