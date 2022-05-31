//
//  File.swift
//  AADS
//
//  Created by Svyat Zubyak on 31.05.2022.
//

import Foundation

class QuickFind {
    var elements: [Int] = []

    init(count: Int) {
        elements += 0..<count
    }

    func isConnected(p: Int, q: Int) -> Bool {
        return elements[p] == elements[q]
    }

    func union(p: Int, q: Int) {
        let pRoot = elements[p]
        let qRoot = elements[q]
        guard pRoot != qRoot else { return }
        for i in 0..<elements.count {
            if elements[i] == pRoot {
                elements[i] = qRoot
            }
        }
    }
}

class HashableQuickFind<T: Hashable> {
    private var elements: [T: Int] = [:]
    var parents: [Int] = []
    
    init(elements: [T]) {
        for i in 0..<elements.count {
            self.elements[elements[i]] = i
        }
        parents += 0..<elements.count
    }

    func add(_ element: T) {
        elements[element] = parents.count
        parents.append(parents.count)
    }
    
    func isConnected(p: T, q: T) -> Bool {
        guard let pParent = parentOf(p), let qParent = parentOf(q) else { return false }
        return pParent == qParent
    }
    
    func union(p: T, q: T) {
        guard let pParent = parentOf(p), let qParent = parentOf(q) else { return }
        guard pParent != qParent else { return }
        for index in 0..<parents.count {
            if parents[index] == pParent {
                parents[index] = qParent
            }
        }
    }

    private func parentBy(_ index: Int) -> Int {
        return parents[index]
    }

    private func parentOf(_ element: T) -> Int? {
        guard let index = elements[element] else { return nil }
        return parentBy(index)
    }
}

//QuickUnion visualization: https://www.cs.usfca.edu/~galles/visualization/DisjointSets.html
class QuickUnion {
    var elements: [Int] = []

    init(count: Int) {
        elements += 0..<count
    }

    func isConnected(p: Int, q: Int) -> Bool {
        return root(of: p) == root(of: q)
    }

    func union(p: Int, q: Int) {
        let pRoot = root(of: p)
        let qRoot = root(of: q)
        elements[pRoot] = qRoot
    }

    func root(of node: Int) -> Int {
        var node = node
        while (node != elements[node]) {
            node = elements[node]
        }
        return node
    }
}

class HashableQuickUnion<T: Hashable> {
    private var elements: [T: Int] = [:]
    var parents: [Int] = []

    init(elements: [T]) {
        for i in 0..<elements.count {
            self.elements[elements[i]] = i
        }
        parents += 0..<elements.count
    }

    func add(_ element: T) {
        elements[element] = parents.count
        parents.append(parents.count)
    }

    func rootBy(_ index: Int) -> Int {
        if parents[index] == index {
            return index
        } else {
            parents[index] = rootBy(parents[index])
            return parents[index]
        }
    }

    func rootOf(_ element: T) -> Int? {
        guard let index = elements[element] else { return nil }
        return rootBy(index)
    }

    func union(p: T, q: T) {
        guard let pRoot = rootOf(p), let qRoot = rootOf(q) else { return }
        guard pRoot != qRoot else { return }
        parents[pRoot] = qRoot
    }

    func isConnected(p: T, q: T) -> Bool {
        guard let pRoot = rootOf(p), let qRoot = rootOf(q) else { return false }
        return pRoot == qRoot
    }
}

class WeightedQuickUnion: QuickUnion {
    var sizes: [Int] = []

    override init(count: Int) {
        sizes = Array(repeating: 1, count: count)
        super.init(count: count)
    }

    override func union(p: Int, q: Int) {
        let pRoot = root(of: p)
        let qRoot = root(of: q)

        guard pRoot != qRoot else { return }

        let pSize = sizes[pRoot]
        let qSize = sizes[qRoot]

        if pSize < qSize {
            elements[pRoot] = qRoot
            sizes[qRoot] += pSize
        } else {
            elements[qRoot] = pRoot
            sizes[pRoot] += qSize
        }
    }
}

class HashableWeightedQuickUnion<T: Hashable>: HashableQuickUnion<T> {
    var sizes: [Int] = []
    
    override init(elements: [T]) {
        sizes = Array(repeating: 1, count: elements.count)
        super.init(elements: elements)
    }
    
    override func union(p: T, q: T) {
        guard let pRoot = rootOf(p), let qRoot = rootOf(q) else { return }
        guard pRoot != qRoot else { return }
        if sizes[pRoot] < sizes[qRoot] {
            parents[pRoot] = qRoot
            sizes[qRoot] += sizes[pRoot]
        } else {
            parents[qRoot] = pRoot
            sizes[pRoot] += sizes[qRoot]
        }
    }
}

class WeightedQuickUnionWithPathCompression: WeightedQuickUnion {
    
    override func root(of node: Int) -> Int {
        var node = node
        while node != elements[node] {
            elements[node] = elements[elements[node]]
            node = elements[node]
        }
        return node
    }
}

class HashableWeightedQuickUnionWithPathCompression<T: Hashable>: HashableWeightedQuickUnion<T> {
    
    override func rootBy(_ index: Int) -> Int {
        if index != parents[index] {
            parents[index] = rootBy(parents[index])
        }
        return parents[index]
    }
}
