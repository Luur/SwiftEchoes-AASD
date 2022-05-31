//
//  File.swift
//  Solutions
//
//  Created by Svyat Zubyak on 24.05.2022.
//

import Foundation

class TwoPointers: ObservableObject {
    
    //https://leetcode.com/problems/squares-of-a-sorted-array/
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var result = [Int](repeating: 0, count: nums.count)
        var index = nums.count - 1
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let a = nums[left] * nums[left]
            let b = nums[right] * nums[right]
            if a > b {
                result[index] = a
                index -= 1
                left += 1
            } else {
                result[index] = b
                index -= 1
                right -= 1
            }
        }
        return result
    }
    
    //https://leetcode.com/problems/move-zeroes/
    func moveZeroes(_ nums: inout [Int]) {
        guard nums.count > 1 else { return }
        var result = [Int](repeating: 0, count: nums.count)
        var zeroIndex = 0
        for i in 0..<nums.count {
            if nums[i] != 0 {
                result[zeroIndex] = nums[i]
                zeroIndex += 1
            }
        }
        nums = result
    }
    
    //https://leetcode.com/problems/move-zeroes/
    func moveZeroes1(_ nums: inout [Int]) {
        guard nums.count > 1 else { return }
        var index = 0
        var zeroIndex = 0
        while index < nums.count {
            if nums[index] != 0 {
                swap(&nums, index, zeroIndex)
                zeroIndex += 1
            }
            index += 1
        }
    }
        
    private func swap<T>(_ array: inout [T], _ index1: Int, _ index2: Int ){
        guard index1 != index2 else { return }
        let temp = array[index1]
        array[index1] = array[index2]
        array[index2] = temp
    }
    
    //https://leetcode.com/problems/reverse-string/
    func reverseString(_ s: inout [Character]) {
        var low = 0
        var heigh = s.count-1
        while low < heigh {
            if s[low] != s[heigh] {
                swap(&s, low, heigh)
            }
            low += 1
            heigh -= 1
        }
    }
    
    //https://leetcode.com/problems/reverse-words-in-a-string-iii/
    func reverseWords(_ s: String) -> String {
        var words = s.components(separatedBy: " ")
        var i = 0
        while i != words.count-1 {
            var word = Array(words[i])
            reverseString(&word)
            words[i] = String(word)
            i += 1
        }
        return words.joined(separator: " ")
    }
}
