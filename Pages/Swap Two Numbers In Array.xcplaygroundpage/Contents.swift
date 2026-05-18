import Foundation

var intergerArray = [10, 20, 30]

// Solution 1
func swap1(_ arr: inout [Int], index1: Int, index2: Int) {
    let temp = arr[index2]
    arr[index2] = arr[index1]
    arr[index1] = temp
}

swap1(&intergerArray, index1: 0, index2: 2)
print(intergerArray)  //[30, 20, 10]


// Solution 2
func swap2<T>(_ arr: inout [T], index1: Int, index2: Int) {
    arr.swapAt(index1, index2)
}

swap2(&intergerArray, index1: 0, index2: 2)
print(intergerArray)  //[10, 20, 30]

var stringArray: [String] = ["a", "b", "c"]
swap2(&stringArray, index1: 0, index2: 2)
print(stringArray)  //["c", "b", "a"]
