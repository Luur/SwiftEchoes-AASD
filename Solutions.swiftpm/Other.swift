//
//  File.swift
//  Solutions
//
//  Created by Svyat Zubyak on 22.05.2022.
//

import Foundation

class Other: ObservableObject {

    //https://leetcode.com/problems/richest-customer-wealth/
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        var max = 0
        for a in accounts {
            let sum = a.reduce(0,+)
            if sum > max {
                max = sum
            }
        }
        return max
    }

    //https://leetcode.com/problems/number-of-steps-to-reduce-a-number-to-zero/
    func numberOfSteps(_ num: Int) -> Int {
        var steps = 0
        var numCopy = num
        while numCopy != 0 {
            if numCopy % 2 == 0 {
                numCopy = numCopy/2
            } else {
                numCopy -= 1
            }
            steps += 1
        }
        return steps
    }
    
    //https://leetcode.com/problems/missing-number-in-arithmetic-progression/
    func missingNumber(_ arr: [Int]) -> Int {
        let sortedSequence = arr.sorted()
        guard let firstValue = sortedSequence.first, let lastValue = sortedSequence.last else { return 0}
        let step = (lastValue - firstValue) / sortedSequence.count
        guard step > 0 else { return firstValue }
        let fullSequence = Array(stride(from: firstValue, through: lastValue, by: step))
        return fullSequence.reduce(0, +) - sortedSequence.reduce(0, +)
    }
    
    //https://leetcode.com/problems/add-digits/
    func addDigits(_ num: Int) -> Int {
        var result = num
        repeat {
            result = String(result).compactMap { $0.wholeNumberValue }.reduce(0, +)
        } while result > 9
        return result
    }
}
