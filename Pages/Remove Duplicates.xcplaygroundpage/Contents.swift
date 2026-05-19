import Foundation

var intArray = [1, 2, 3, 4, 5, 1, 2, 4, 7, 1]
var stringArray = ["a", "b", "c", "a", "b", "c", "d", "e"]

// Solution 1: Make it a Set but Correct Order isn't guaranteed
let uniqueArray1 = Array(Set(intArray))
print(uniqueArray1)

let uniqueArray2 = Array(Set(stringArray))
print(uniqueArray2)


// Solution 2: Non Generic
///contains on an array is O(n) because it scans linearly.
///So WorstCase O(n²)
func removeDuplicates1(intArray: [Int]) -> [Int] {
    var newArray: [Int] = []
    
    for item in intArray {
        if !newArray.contains(item) {
            newArray.append(item)
        }
    }
    
    return newArray
}

///Set lookup is approximately O(1) average case.
///So OverAll is O(n)
///Though Takes more Memory to store
///Recommended
func removeDuplicates2(intArray: [Int]) -> [Int] {
    var set = Set<Int>()
    var newArray: [Int] = []
    
    for item in intArray {
        if !set.contains(item) {
            set.insert(item)
            newArray.append(item)
        }
    }
    
    return newArray
}

print("removeDuplicates \(removeDuplicates2(intArray: intArray))")


// Solution 3: Generic
// Hashable is used because Set only stores hashable types.
/// Notes:-
/// Hashable is a protocol that allows a type to be converted into a hash value.
/// A hash value is an integer used internally for fast lookup in collections like: Set & Dictionary
/// Swift uses this hash value to quickly find/store objects.
/// Example:
/// var set = Set<Int>()
/// When you insert:
/// set.insert(10)
/// Swift computes a hash for 10.
/// That hash helps Swift determine: where to store it, whether it already exists. Without hashing, lookup would be slow.

func removeDuplicatesGeneric<T: Hashable>(_ array: [T]) -> [T] {
    var set = Set<T>()
    var newArray: [T] = []
    
    for item in array {
        if !set.contains(item) {
            set.insert(item)
            newArray.append(item)
        }
    }
    
    return newArray
}

print("removeDuplicates in Integer: \(removeDuplicatesGeneric(intArray))")
print("removeDuplicates in Chars: \(removeDuplicatesGeneric(stringArray))")

// Solution 4: Making an extension of Solution 2

extension Array where Element == Int {
    func removeDuplicates() -> [Element] {
        var set = Set<Element>()
        var newArray: [Element] = []
        
        for item in self {
            if !set.contains(item) {
                set.insert(item)
                newArray.append(item)
            }
        }
        
        return newArray
    }
}

print("Solution 4: \(intArray.removeDuplicates())")


// Solution 5: Making Solution 4

extension Array where Element: Hashable {
    func removeDuplicates() -> [Element] {
        var set = Set<Element>()
        var newArray: [Element] = []
        
        for item in self {
            if !set.contains(item) {
                set.insert(item)
                newArray.append(item)
            }
        }
        
        return newArray
    }
}

print("Solution 5: \(intArray.removeDuplicates())")
print("Solution 5: \(stringArray.removeDuplicates())")


// Solution 6: Enhancement of Solution 5
/// mutating is being used as we are changing the given array, and array is a struct type so mutation is required
/// here the solution is working like inout Params
extension Array where Element: Hashable {
    mutating func removeDuplicates1() {
        var set = Set<Element>()
        var newArray: [Element] = []
        
        for item in self {
            if !set.contains(item) {
                set.insert(item)
                newArray.append(item)
            }
        }
        
        self = newArray
    }
}

intArray.removeDuplicates1()
stringArray.removeDuplicates1()

print("Solution 6: \(intArray)")
print("Solution 6: \(stringArray)")
