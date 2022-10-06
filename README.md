##Algorithms and Data Structures compendium.

###General
1) Priority Queue could be usefull to find N bigest(Max-Priority Queue) or smallest(Min-Priority Queue) elements of array.
2) Use loop two-pointer technique for polindrome cheking.
3) Check if a number is prime
```swift
extension Int {
    func isPrime() -> Bool {
        guard self >= 2 else { return false }
        guard self != 2 else { return true  }
        guard self % 2 != 0 else { return false }
        return !stride(from: 3, through: Int(sqrt(Double(self))), by: 2).contains { self % $0 == 0 }
    }
}

```

###Array

1) swap elements in array
```swift
private func swap<T>(_ array: inout [T], _ index1: Int, _ index2: Int ) {
    guard index1 != index2 else { return }
    let temp = array[index1]
    array[index1] = array[index2]
    array[index2] = temp
}
```

###Loops

```swift
let array = [1,2,3,4,5,6,7,8,9,10]
```

1) while loop

``` swift
var i = 0
while i < array.count {
    print(array[i])
    i += 1
}
```

2) while loop with next element

```swift
var i = 0
while i < array.count {
    let current = array[i]
    var next: Int? = nil
    if i < array.count - 1 { // check if next item exists
        next = array[i+1]
    }
    print("current: \(current), next: \(next)")
    i += 1
}
```


3) for loop
```swift
for i in 0..<array.count {
    print(array[i])
}
```

4) for loop with next element
```swift
for i in 0..<array.count {
    let current = array[i]
    var next: Int? = nil
    if i < array.count - 1 { // check if next item exists
        next = array[i+1]
    }
    print("current: \(current), next: \(next)")
}
```

5) loop two-pointer technique
```swift
var leftIndex = 0
var rightIndex = array.count-1
while leftIndex <= rightIndex {
    leftIndex += 1
    rightIndex -= 1
}
```

6) reversed for loop
```swift
for i in (0..<5).reversed() {
}
```

7) nested for loops
```swift
for i in 0..<array.count {
    for j in i+1..<array.count {
    }
}
```

###Binary Representation

1) Odd numbers always have a last bit of 1.
2) Subtracting 1, from an odd number, changes the last bit from 1 to 0.
3) Dividing by 2 removes the last bit from the number.

###Binary Search

```swift
func binarySearch(nums: [Int], target: Int) -> Int {
    var low: Int = 0
    var heigh: Int = nums.count-1
    while low <= heigh {
        let mid = low + (heigh - low)/2
        if nums[mid] == target {
            return mid
        } else if nums[mid] > target {
            heigh = mid - 1
        } else {
            low = mid + 1
        }
    }
    return -1
```

###Hash

1) Find frequency of elements in array
```swift
func itemsFrequency<T: Hashable>(in array: [T]) -> [T: Int] {
    var itemsFrequencyMap: [T: Int] = [:]
    for item in array {
        if let currentFrequency = itemsFrequencyMap[item] {
            itemsFrequencyMap[item] = currentFrequency + 1
        } else {
            itemsFrequencyMap[item] = 1
        }
    }
    return itemsFrequencyMap
}
```

###LinkedList

```swift
class ListNode<T: Hashable> {
    var val: T
    var next: ListNode?
    init(_ val: T) { self.val = val; self.next = nil; }
    init(_ val: T, _ next: ListNode?) { self.val = val; self.next = next; }
}
```

1) LinkedList to ArrayList

```swift
func array<T: Hashable>(from head: ListNode<T>?) -> [Int] {
    var array = [T]()
    var head = head
    while head != nil {
        array.append(head!.val)
        head = head?.next
    }
    return array
}
```

2) Fast and Slow (also known as the tortoise and hare algorithm)
It uses two pointers to determine traits about directional data structures.

Problem 1: Middle of Linked List
```swift
func middleNode<T: Hashable>(_ head: ListNode<T>?) -> ListNode<T>? {
    var slow: ListNode<T>? = head
    var fast: ListNode<T>? = head
    
    while (fast != nil && fast?.next != nil) {
        slow = slow?.next
        fast = fast?.next?.next
    }
    return slow
}
```
Problem 2: Detect Cycle in Linked List
```swift
func detectCycle<T: Hashable>(_ head: ListNode<T>?) -> Bool {
    guard let head = head else { return false }
    var slow: ListNode<T>? = head
    var fast: ListNode<T>? = head.next
    while (slow != fast) {
        if (fast == nil || fast?.next == nil) {
            return false;
        }
        slow = slow?.next
        fast = fast?.next?.next
    }
    return true
}
```
3) Node print prettifier
```swift
extension ListNode: CustomStringConvertible {

    public var description: String {
        guard let next = next else { return "\(val)" }
        return "\(val) -> " + String(describing: next)
    }
}
```
4) Reverse Linked List
```swift
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
```