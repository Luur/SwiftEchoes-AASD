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
}
