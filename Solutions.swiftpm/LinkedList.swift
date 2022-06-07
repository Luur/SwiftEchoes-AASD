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
}
