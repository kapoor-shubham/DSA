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
