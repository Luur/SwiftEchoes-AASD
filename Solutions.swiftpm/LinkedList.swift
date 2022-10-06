//
//  File.swift
//  Solutions
//
//  Created by Svyat Zubyak on 22.05.2022.
//

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) { self.val = val; self.next = nil; }
    init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

extension ListNode: CustomStringConvertible {

    public var description: String {
        guard let next = next else { return "\(val)" }
        return "\(val) -> " + String(describing: next)
    }
}

class LinkedList: ObservableObject {
    
    //https://leetcode.com/problems/palindrome-linked-list/
    func isPalindrome(_ head: ListNode?) -> Bool {
        var array = [Int]()
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
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow: ListNode? = head
        var fast: ListNode? = head?.next
        while (fast != nil && fast?.next != nil) {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
    
    //https://leetcode.com/problems/linked-list-cycle/
    
    func detectCycle(_ head: ListNode?) -> Bool {
        var headCopy = head
        var array: [ListNode?] = []
        while headCopy != nil {
            if array.contains(where: { $0 === headCopy }) {
                return true
            } else {
                array.append(headCopy)
            }
            headCopy = headCopy?.next
        }
        return false
    }
    
    func detectCycle1(_ head: ListNode?) -> Bool {
        guard let head = head else { return false }
        var slow: ListNode? = head
        var fast: ListNode? = head.next
        while (slow !== fast) {
            if (fast == nil || fast?.next == nil) {
                return false
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return true
    }
    
    //https://leetcode.com/problems/merge-two-sorted-lists/
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var list1Copy = list1
        var list2Copy = list2
        let mergedList: ListNode? = ListNode(-1)
        var mergedListCopy = mergedList
        while list1Copy != nil && list2Copy != nil  {
            if list1Copy!.val > list2Copy!.val {
                mergedListCopy?.next = ListNode(list2Copy!.val)
                mergedListCopy = mergedListCopy?.next
                list2Copy = list2Copy?.next
            } else {
                mergedListCopy?.next = ListNode(list1Copy!.val)
                mergedListCopy = mergedListCopy?.next
                list1Copy = list1Copy?.next
            }
        }
        mergedListCopy?.next = list1Copy == nil ? list2Copy : list1Copy
        return mergedList?.next
    }
    
    //https://leetcode.com/problems/add-two-numbers/
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1Copy = l1
        var l2Copy = l2
        let l3: ListNode? = ListNode(-1)
        var l3Copy = l3
        var cary = 0
        while l1Copy != nil || l2Copy != nil {
            let l1Val = l1Copy?.val ?? 0
            let l2Val = l2Copy?.val ?? 0
            let sum = l1Val + l2Val + cary
            cary = sum/10
            let reminder = sum % 10
            l3Copy?.next = ListNode(reminder)
            l3Copy = l3Copy?.next
            l1Copy = l1Copy?.next
            l2Copy = l2Copy?.next
        }
        if cary > 0 {
            l3Copy?.next = ListNode(cary)
        }
        return l3?.next
    }
    
    //https://leetcode.com/problems/reverse-linked-list/
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var curr = head
        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        return prev
    }
    
    func reverseList1(_ head: ListNode?) -> ListNode? {
        var headCopy = head
        var result: ListNode?
        while headCopy != nil {
            result = ListNode(headCopy!.val, result)
            headCopy = headCopy?.next
        }
        return result
    }
    
    //https://leetcode.com/problems/merge-k-sorted-lists/  Merge k Sorted Lists
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 0 else { return nil }
        var result = lists
        while result.count > 1 {
            var list = [ListNode?]()
            var i = 0
            while i < result.count {
                if i < result.count - 1 {
                    list.append(mergeTwoLists(result[i], result[i+1]))
                } else {
                    list.append(result[i])
                }
                i += 2
            }
            result = list
        }
        return result[0]
    }
    
    //https://leetcode.com/problems/swap-nodes-in-pairs/  Swap Nodes in Pairs
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head?.next
        let result: ListNode? = ListNode(-1)
        var resultCopy = result
        while slow != nil {
            if let fastVal = fast?.val {
                resultCopy?.next = ListNode(fastVal)
                resultCopy = resultCopy?.next
            }
            resultCopy?.next = ListNode(slow!.val)
            resultCopy = resultCopy?.next
            
            slow = slow?.next?.next
            fast = fast?.next?.next
        }
        return result?.next
    }
    
    func swapPairs1(_ head: ListNode?) -> ListNode? {
        guard head != nil && head?.next != nil else { return head }
        let slow = head
        let fast = head?.next
        slow?.next = swapPairs1(fast?.next)
        fast?.next = slow
        return fast
    }
    
    //https://leetcode.com/problems/delete-node-in-a-linked-list/  Delete Node in a Linked List
    func deleteNode(_ node: ListNode?) {
        node!.val = node!.next!.val
        node!.next = node!.next?.next
    }
    
    //https://leetcode.com/problems/rotate-list/  Rotate List
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard k != 0 else { return head }
        let count = count(head: head)
        guard count != 0 else { return head }
        let steps = k%count
        guard steps != 0 else { return head }
        let headAndTail = findHeadAndTail(head: head, index: count-steps)
        var headCopy = headAndTail.head
        while headCopy?.next != nil {
            headCopy = headCopy?.next
        }
        headCopy?.next = headAndTail.tail
        return headAndTail.head
    }
        
    private func count(head: ListNode?) -> Int {
        var headCopy = head
        var count = 0
        while headCopy != nil {
            count += 1
            headCopy = headCopy?.next
        }
        return count
    }
        
    private func findHeadAndTail(head: ListNode?, index: Int) -> (head: ListNode?, tail: ListNode?) {
        let tail: ListNode? = ListNode(-1)
        var headCopy = head
        var tailCopy = tail
        var indexCopy = index
        while indexCopy != 0 {
            indexCopy -= 1
            tailCopy?.next = ListNode(headCopy!.val)
            tailCopy = tailCopy?.next
            headCopy = headCopy?.next
        }
        return (headCopy, tail?.next)
    }
    
    //Remove Duplicates from Sorted List https://leetcode.com/problems/remove-duplicates-from-sorted-list/
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var headCopy = head
        while headCopy != nil && headCopy!.next != nil {
            if headCopy!.val == headCopy!.next!.val {
                headCopy?.next = headCopy?.next?.next
            } else {
                headCopy = headCopy?.next
            }
        }
        return head
    }
    
    //https://leetcode.com/problems/remove-duplicates-from-an-unsorted-linked-list/
    func deleteDuplicatesUnsorted(_ head: ListNode?) -> ListNode? {
        var hash: [Int:Int] = [:]
        var headCopy = head
        while headCopy != nil {
            if let value = hash[headCopy!.val] {
                hash[headCopy!.val] = value + 1
            } else {
                hash[headCopy!.val] = 1
            }
            headCopy = headCopy?.next
        }
        let result = ListNode(-1)
        var resultCopy: ListNode? = result
        headCopy = head
        while headCopy != nil {
            if hash[headCopy!.val] == 1 {
                resultCopy?.next = ListNode(headCopy!.val)
                resultCopy = resultCopy?.next
            }
            headCopy = headCopy?.next
        }
        return result.next
    }
    
    //Remove Duplicates from Sorted List II  https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/
    func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
        let result = ListNode(-1)
        var prevValue = -101
        var resultCopy: ListNode? = result
        var headCopy = head
        while headCopy != nil {
            if headCopy!.val != headCopy?.next?.val && headCopy!.val != prevValue {
                resultCopy?.next = ListNode(headCopy!.val)
                resultCopy = resultCopy?.next
            }
            prevValue = headCopy!.val
            headCopy = headCopy?.next
        }
        return result.next
    }
    
    // Reverse Linked List II, https://leetcode.com/problems/reverse-linked-list-ii/
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        var headCopy: ListNode? = head
        let leftPart = ListNode(-501)
        var leftPartCopy: ListNode? = leftPart
        let rightPart = ListNode(-502)
        var rightPartCopy: ListNode? = rightPart
        var i = 1
        var mid: ListNode? = nil
        while headCopy != nil {
            if i >= left, i <= right {
                mid = ListNode(headCopy!.val, mid)
            }
            if i < left {
                leftPartCopy?.next = ListNode(headCopy!.val)
                leftPartCopy = leftPartCopy?.next
            }
            if i > right {
                rightPartCopy?.next = ListNode(headCopy!.val)
                rightPartCopy = rightPartCopy?.next
            }
            i += 1
            headCopy = headCopy?.next
        }
        var result = append(l1: mid, l2: rightPart.next)
        result = append(l1: leftPart.next, l2: result)
        return result
    }
        
    private func append(l1: ListNode?, l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }
        var l1Copy = l1
        while l1Copy.next != nil {
            l1Copy = l1Copy.next!
        }
        l1Copy.next = l2
        return l1
    }
    
    // https://leetcode.com/problems/find-the-minimum-and-maximum-number-of-nodes-between-critical-points/
    func nodesBetweenCriticalPoints(_ head: ListNode?) -> [Int] {
        var hash: [Int] = []
        var headCopy = head
        var index = 1
        var prevValue: Int = headCopy!.val
        var minValue = Int.max
        while headCopy?.next != nil {
            if (headCopy!.val > prevValue && headCopy!.val > headCopy!.next!.val) || (headCopy!.val < prevValue && headCopy!.val < headCopy!.next!.val) {
                if let i = hash.last {
                    minValue = min(minValue, index-i)
                }
                hash.append(index)
            }
            index += 1
            prevValue = headCopy!.val
            headCopy = headCopy?.next
        }
        guard hash.count > 1 else { return [-1, -1] }
        let maxValue = hash[hash.count-1]-hash[0]
        return [minValue, maxValue]
    }
    
    //https://leetcode.com/problems/reorder-list/
    func reorderList(_ head: ListNode?) {
        guard head?.next != nil else { return }
        var slow = head
        var fast = head
        var prev: ListNode? = head
        while fast != nil && fast?.next != nil {
            prev = slow
            slow = slow?.next
            fast = fast?.next?.next
        }
        prev?.next = nil
        var reversed: ListNode? = nil
        while slow != nil {
            reversed = ListNode(slow!.val, reversed)
            slow = slow?.next
        }
        var headCopy = head
        var reversedCopy = reversed
        while headCopy?.next != nil {
            headCopy?.next = ListNode(reversedCopy!.val, headCopy?.next)
            reversedCopy = reversedCopy?.next
            headCopy = headCopy?.next?.next
        }
        headCopy?.next = reversedCopy
    }
    
    func reorderList1(_ head: ListNode?) {
        var headCopy = head
        var count = 0
        var reversedList: ListNode? = nil
        while headCopy != nil {
            count += 1
            reversedList = ListNode(headCopy!.val, reversedList)
            headCopy = headCopy?.next
        }
        headCopy = head
        var reversedListCopy = reversedList
        var i = 1
        while count > i {
            if i%2 != 0 {
                headCopy?.next = ListNode(reversedListCopy!.val, headCopy?.next)
                reversedListCopy = reversedListCopy?.next
            }
            headCopy = headCopy?.next
            i += 1
        }
        headCopy?.next = nil
    }
    
    //https://leetcode.com/problems/reverse-nodes-in-k-group/
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let headCopy = head
        var ptr = head
        var count = 0
        while ptr != nil && count < k {
            ptr = ptr?.next
            count += 1
        }
        if count == k {
            let reversed = reverse(headCopy, k)
            headCopy?.next = reverseKGroup(ptr, k)
            return reversed
        }
        return headCopy
    }
    
    func reverse(_ head: ListNode?, _ k: Int) -> ListNode? {
        var newHead: ListNode? = nil
        var ptr = head
        var kCopy = k
        while kCopy > 0 {
            let next = ptr?.next
            ptr?.next = newHead
            newHead = ptr
            ptr = next
            kCopy -= 1
        }
        return newHead
    }
    
    func reverseKGroup1(_ head: ListNode?, _ k: Int) -> ListNode? {
        let count = count(head)
        var times = count/k
        var isExtra = count%k != 0
        var result: ListNode? = nil
        guard k != count else { return push(head, result, k) }
        while k*(times+1) != 0 {
            var steps = k*times
            var headCopy = head
            while steps != 0 {
                steps -= 1
                headCopy = headCopy?.next
            }
            if isExtra {
                result = headCopy
                isExtra = false
            } else {
                result = push(headCopy, result, k)
            }
            times -= 1
        }
        return result
    }
    
    private func push(_ head: ListNode?, _ result: ListNode?, _ k: Int) -> ListNode? {
        var resultCopy = result
        var headCopy = head
        var kCopy = k
        while headCopy != nil && kCopy != 0 {
            resultCopy = ListNode(headCopy!.val, resultCopy)
            headCopy = headCopy?.next
            kCopy -= 1
        }
        return resultCopy
    }
    
    private func count(_ head: ListNode?) -> Int {
        var headCopy = head
        var count = 0
        while headCopy != nil {
            count += 1
            headCopy = headCopy?.next
        }
        return count
    }
}
