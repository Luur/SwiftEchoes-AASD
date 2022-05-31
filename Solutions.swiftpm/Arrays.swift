//
//  File.swift
//  Solutions
//
//  Created by Svyat Zubyak on 25.05.2022.
//

import Foundation

class Arrays: ObservableObject {
    
    //https://leetcode.com/problems/rotate-array/
    func rotate(_ nums: inout [Int], _ k: Int) {
        let times = k % nums.count
        let count = nums.count
        let a = Array(nums[count - times..<count])
        let b = Array(nums[0..<count-times])
        nums = a + b
    }
    
    //https://leetcode.com/problems/two-sum/
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if nums[i] + nums[j] == target {
                    return [i,j]
                }
            }
        }
        return []
    }
    
    func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
        var hashMap:[Int:Int] = [:]
        for i in 0..<nums.count {
            let key = target - nums[i]
            if let value = hashMap[key] {
                return [i, value]
            } else {
                hashMap[nums[i]] = i
            }
        }
        return []
    }
    
    func twoSumSorted(_ numbers: [Int], _ target: Int) -> [Int] {
        var low = 0
        var heigh = numbers.count-1
        while low < heigh {
            if numbers[low] + numbers[heigh] > target {
                heigh -= 1
            } else if numbers[low] + numbers[heigh] < target {
                low += 1
            } else {
                return [low+1, heigh+1]
            }
        }
        return []
    }
}

