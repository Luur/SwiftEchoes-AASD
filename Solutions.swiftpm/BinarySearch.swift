//
//  File.swift
//  Solutions
//
//  Created by Svyat Zubyak on 20.05.2022.
//

import Foundation

class BinarySearch: ObservableObject {
    
    //https://leetcode.com/problems/binary-search/
    func binarySearch(nums: [Int], target: Int) -> Int {
        var low: Int = 0
        var heigh: Int = nums.count-1
        while low <= heigh {
            let mid = low + (heigh - low)/2
            if nums[mid] == target {
                return mid
            } else if nums[mid] > target {
                heigh = mid-1
            } else {
                low = mid + 1
            }
        }
        return -1
    }
    
    //https://leetcode.com/problems/first-bad-version/
    func firstBadVersion(_ n: Int) -> Int {
        var low: Int = 1
        var heigh: Int = n
        while low <= heigh {
            let mid = low + (heigh - low)/2
            if isBadVersion(mid) {
                heigh = mid-1
            } else {
                low = mid + 1
            }
        }
        return low
    }
    private func isBadVersion(_ version: Int) -> Bool{
        return version >= 3
    }
    
    //https://leetcode.com/problems/search-insert-position/
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var heigh = nums.count - 1
        while low <= heigh {
            let mid = low + (heigh-low)/2
            if nums[mid] == target {
                return mid
            } else if nums[mid] > target {
                heigh = mid - 1
            } else {
                low = mid + 1
            }
        }
        return low
    }
}
