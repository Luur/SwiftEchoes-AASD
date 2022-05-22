//
//  File.swift
//  Solutions
//
//  Created by Svyat Zubyak on 22.05.2022.
//

import Foundation

class ListNode<T: Hashable>: Equatable {
    var val: T
    var next: ListNode?
    init(_ val: T) { self.val = val; self.next = nil; }
    init(_ val: T, _ next: ListNode?) { self.val = val; self.next = next; }
    static func == (lhs: ListNode<T>, rhs: ListNode<T>) -> Bool {
        return lhs.val == rhs.val && lhs.next == rhs.next
    }
}

class LinkedList: ObservableObject {
    
    //https://leetcode.com/problems/palindrome-linked-list/
    func isPalindrome<T: Hashable>(_ head: ListNode<T>?) -> Bool {
        var array = [T]()
        var head = head
        while head != nil {
            array.append(head!.val)
            head = head?.next
        }
        var leftIndex = 0
        var rightIndex = array.count-1
        while leftIndex <= rightIndex {
            if array[leftIndex] != array[rightIndex] {
                return false
            }
            leftIndex += 1
            rightIndex -= 1
        }
        return true
    }
    
    //https://leetcode.com/problems/middle-of-the-linked-list/
    func middleNode<T: Hashable>(_ head: ListNode<T>?) -> ListNode<T>? {
        var slow: ListNode<T>? = head
        var fast: ListNode<T>? = head
        
        while (fast != nil && fast?.next != nil) {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
    
    func detectCycle<T: Hashable>(_ head: ListNode<T>?) -> Bool {
        guard let head = head else { return false }
        var slow: ListNode<T>? = head
        var fast: ListNode<T>? = head.next
        while (slow != fast) {
            if (fast == nil || fast?.next == nil) {
                return false
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return true
    }
}
