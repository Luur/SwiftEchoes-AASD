import SwiftUI

struct ContentView: View {
    
    @StateObject private var binarySearch = BinarySearch()
    @StateObject private var linkedList = LinkedList()
    @StateObject private var hashTable = HashTable()
    @StateObject private var twoPointers = TwoPointers()
    @StateObject private var arrays = Arrays()
    @StateObject private var other = Other()
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                Section(header: Text("Binary Search")) {
                    
                    Text("Binary Search")
                        .onTapGesture {
                            let result = binarySearch.binarySearch(nums: [1,2,3,4,5,6,7,8,9], target: 8)
                            print(result)
                        }
                    Text("First Bad Version")
                        .onTapGesture {
                            let result = binarySearch.firstBadVersion(9)
                            print(result)
                        }
                    Text("Search Insert Position")
                        .onTapGesture {
                            let result = binarySearch.searchInsert([1,2,3,5,6,7,8,9], 4)
                            print(result)
                        }
                }
                
                Section(header: Text("Hash Table")) {
                    
                    Text("Ransom Note")
                        .onTapGesture {
                            let result = hashTable.canConstruct("aabbccq", "abcabctt")
                            print(result)
                        }
                    
                    Text("Fizz Buzz")
                        .onTapGesture {
                            let result = hashTable.fizzBuzz(9)
                            print(result)
                        }
                    
                    Text("Roman to Integer")
                        .onTapGesture {
                            let result = hashTable.romanToInt("MMCMLXXXIX")
                            print(result)
                        }
                }
                
                Section(header: Text("Linked List")) {
                    
                    Text("Palindrome Linked List")
                        .onTapGesture {
                            let result = linkedList.isPalindrome(ListNode(1, ListNode(2, ListNode(3, ListNode(2, ListNode(1, nil))))))
                            print(result)
                        }
                    
                    Text("Middle of the Linked List")
                        .onTapGesture {
                            let result = linkedList.middleNode(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6, nil)))))))
                            print(result?.val)
                        }
                    
                    Text("Merge Two Sorted Lists")
                        .onTapGesture {
                            let result = linkedList.mergeTwoLists(ListNode(1, ListNode(2, ListNode(5, ListNode(6, ListNode(8, nil))))), ListNode(2, ListNode(3, ListNode(8, nil))))
                            print(result)
                        }
                    
                    Text("Add Two Numbers")
                        .onTapGesture {
                            let result = linkedList.addTwoNumbers(ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, nil))))))), ListNode(9, ListNode(9, ListNode(9, ListNode(9, nil)))))
                            print(result)
                        }
                    
                    Text("Reverse Linked List")
                        .onTapGesture {
                            let result = linkedList.reverseList(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6, nil)))))))
                            print(result)
                        }
                    
                    Text("Merge k Sorted Lists")
                        .onTapGesture {
                            let result = linkedList.mergeKLists([ListNode(1, ListNode(4, ListNode(5, nil))), ListNode(1, ListNode(3, ListNode(4, nil))), ListNode(2, ListNode(6, nil))])
                            print(result)
                        }
                    
                    Text("Swap Nodes in Pairs")
                        .onTapGesture {
                            let result = linkedList.swapPairs(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6, nil)))))))
                            print(result)
                        }
                    
                    Text("Rotate List")
                        .onTapGesture {
                            let result = linkedList.rotateRight(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6, nil)))))), 3)
                            print(result)
                        }
                    
                    Text("Remove Duplicates from Sorted List")
                        .onTapGesture {
                            let result = linkedList.deleteDuplicates(ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(3, ListNode(5, nil)))))))
                            print(result)
                        }
                }
                
                Section(header: Text("Two Pointers")) {
                    
                    Text("Squares of a Sorted Array")
                        .onTapGesture {
                            let result = twoPointers.sortedSquares([-4,-1,0,3,10])
                            print(result)
                        }
                    
                    Text("Move Zeroes")
                        .onTapGesture {
                            var nums = [1,2,3,4,5,6,7]
                            var nums1 = [5,1,0,3,12]
                            twoPointers.moveZeroes(&nums)
                            twoPointers.moveZeroes1(&nums1)
                            print(nums)
                            print(nums1)
                        }
                    
                    Text("Reverse String")
                        .onTapGesture {
                            var word = Array("hallo")
                            twoPointers.reverseString(&word)
                            print(word)
                        }
                    
                    Text("Reverse Words in a String III")
                        .onTapGesture {
                            let results = twoPointers.reverseWords("hallo, how are you?")
                            print(results)
                        }
                }
                
                Section(header: Text("Array")) {
                    
                    Text("Rotate Array")
                        .onTapGesture {
                            var nums = [1,2,3,4,5,6,7]
                            arrays.rotate(&nums, 3)
                            print(nums)
                        }
                    
                    Text("Two Sum")
                        .onTapGesture {
                            let result = arrays.twoSum([2,7,11,15], 9)
                            let result1 = arrays.twoSum1([2,7,11,15], 9)
                            print(result)
                            print(result1)
                        }
                    
                    Text("Two Sum II - Input Array Is Sorted" )
                        .onTapGesture {
                            let result = arrays.twoSumSorted([2,7,11,15], 9)
                            print(result)
                        }
                }
                
                Section(header: Text("Other")) {
                    
                    Text("Richest Customer Wealth")
                        .onTapGesture {
                            let result = other.maximumWealth([[1,2,3],[3,2,1]])
                            print(result)
                        }
                    
                    Text("Number of Steps to Reduce a Number to Zero")
                        .onTapGesture {
                            let result = other.numberOfSteps(17)
                            print(result)
                        }
                    
                    Text("Missing Number In Arithmetic Progression")
                        .onTapGesture {
                            let result = other.missingNumber([0, 0, 0, 0 ,0])
                            print(result)
                        }
                    
                    Text("Add Digits")
                        .onTapGesture {
                            let result = other.addDigits(38)
                            print(result)
                        }
                }
            }
            .navigationTitle("AASD")
        }
    }
}
