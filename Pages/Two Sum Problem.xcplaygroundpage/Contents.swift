import Foundation

// Question
//  Given an array of integers and a target value, return the indices of the two numbers such that they add up to the target.
//
//  Example:
//
//  nums = [2, 7, 11, 15]
//  target = 9
//
//  Output:
//
//  [0, 1]
//
//  Because:
//
//  2 + 7 = 9

/// Brute Force Techniqueue
/// Time Complexity O(n2)
///Space Complexity O(1)
func twoSum1(_ array: [Int], _ target: Int) -> [Int]? {
    for i in 0..<array.count {
        for j in i+1..<array.count {
            if array[i] + array[j] == target {
                return [i, j]
            }
        }
    }
    return nil
}

let result1: [Int]? = twoSum1([2,7,11,15], 9)
print("Two Sum Result 1: \(result1)")


//Solution2: Hash Table
///Time Complexity average is Average Case → O(1)
///Worst Case → O(n)
///
func twoSum2(_ array: [Int], _ target: Int) -> [Int]? {
    var hashTable: [Int: Int] = [:]
    for (index, num) in array.enumerated() {
        let complement = target - num
        if let foundIndex = hashTable[complement] {
            return [foundIndex, index]
        }
        hashTable[num] = index
    }
    return nil
}

let result2: [Int]? = twoSum2([2,7,11,15], 9)
print("Two Sum Result 2: \(result2)")
