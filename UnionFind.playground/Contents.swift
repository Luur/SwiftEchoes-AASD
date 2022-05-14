import UIKit

print("--- QuickFind ---")

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

let qf = QuickFind(count: 6)
print(qf.elements)
qf.union(p: 2, q: 5)
print(qf.elements)
qf.union(p: 2, q: 4)
print(qf.elements)
qf.union(p: 5, q: 0)
print(qf.elements)
qf.isConnected(p: 4, q: 5)

print("--- HashableQuickFind ---")

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

let hqf = HashableQuickFind<String>(elements: ["A", "B", "C", "D", "E", "F"])
print(hqf.parents)
hqf.union(p: "C", q: "F")
print(hqf.parents)
hqf.union(p: "C", q: "E")
print(hqf.parents)
hqf.union(p: "F", q: "A")
print(hqf.parents)
hqf.isConnected(p: "E", q: "F")

//QuickUnion visualization: https://www.cs.usfca.edu/~galles/visualization/DisjointSets.html
print("--- QuickUnion ---")

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

let qu = QuickUnion(count: 6)
print(qu.elements)
qu.union(p: 2, q: 5)
print(qu.elements)
qu.union(p: 2, q: 4)
print(qu.elements)
qu.union(p: 5, q: 0)
print(qu.elements)
qu.isConnected(p: 4, q: 5)

print("--- HashableQuickUnion ---")

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

let hqu = HashableQuickUnion<String>(elements: ["A", "B", "C", "D", "E", "F"])
print(hqu.parents)
hqu.union(p: "C", q: "F")
print(hqu.parents)
hqu.union(p: "C", q: "E")
print(hqu.parents)
hqu.union(p: "F", q: "A")
print(hqu.parents)
hqu.isConnected(p: "E", q: "F")

print("--- WeightedQuickUnion ---")

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
wqu.isConnected(p: 4, q: 5)

print("--- HashableWeightedQuickUnion ---")

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
hwqu.isConnected(p: "E", q: "F")

print("--- WeightedQuickUnionWithPathCompression ---")

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
wqupc.isConnected(p: 4, q: 5)

print("--- HashableWeightedQuickUnionWithPathCompression ---")

class HashableWeightedQuickUnionWithPathCompression<T: Hashable>: HashableWeightedQuickUnion<T> {
    
    override func rootBy(_ index: Int) -> Int {
        if index != parents[index] {
            parents[index] = rootBy(parents[index])
        }
        return parents[index]
    }
}

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
hwqupc.isConnected(p: "E", q: "F")
