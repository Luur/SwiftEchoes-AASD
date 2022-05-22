//
//  File.swift
//  Solutions
//
//  Created by Svyat Zubyak on 22.05.2022.
//

import Foundation

class HashTable: ObservableObject {
    
    //https://leetcode.com/problems/ransom-note/solution/
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        
        guard ransomNote.count <= magazine.count else { return false }
            
        let ransomNoteItemsFrequency = itemsFrequency(in: ransomNote.map(String.init))
        let magazineItemsFrequency = itemsFrequency(in: magazine.map(String.init))
        
        for (key, value) in ransomNoteItemsFrequency {
            guard let magazineItemValue = magazineItemsFrequency[key] else { return false }
            guard value <= magazineItemValue else { return false }
        }
        
        return true
    }
        
    private func itemsFrequency<T: Hashable>(in array: [T]) -> [T: Int] {
        var itemsFrequencyMap: [T: Int] = [:]
        for item in array {
            if let currentFrequency = itemsFrequencyMap[item] {
                itemsFrequencyMap[item] = currentFrequency + 1
            } else {
                itemsFrequencyMap[item] = 1
            }
        }
        return itemsFrequencyMap
    }
    
    //https://leetcode.com/problems/fizz-buzz/
    func fizzBuzz(_ n: Int) -> [String] {
        let dictionary = [3: "Fizz", 5: "Buzz"]
        var result: [String] = []
        for i in 1...n {
            var resultString: String = ""
            for (key, value) in dictionary {
                if i%key == 0 {
                    resultString.append(value)
                }
            }
            if resultString.isEmpty {
                resultString.append("\(i)")
            }
            result.append(resultString)
        }
        return result
    }
    
    //https://leetcode.com/problems/roman-to-integer/
    func romanToInt(_ s: String) -> Int {
        var sum = 0
        let d = ["I":1, "V":5, "X":10, "L":50, "C":100, "D":500, "M":1000]
        let s1 = s.map(String.init)
        for (i, current) in s1.enumerated() {
            if i+1 < s1.count {
                let next = s1[i+1]
                if d[current]! < d[next]! {
                    sum -= d[current]!
                } else {
                    sum += d[current]!
                }
            } else {
                sum += d[current]!
            }
        }
        return sum
    }
}
