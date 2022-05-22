import SwiftUI

struct ContentView: View {
    
    @StateObject private var binarySearch = BinarySearch()
    @StateObject private var linkedList = LinkedList()
    @StateObject private var hashTable = HashTable()
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
                }
            }
            .navigationTitle("AASD")
        }
    }
}
