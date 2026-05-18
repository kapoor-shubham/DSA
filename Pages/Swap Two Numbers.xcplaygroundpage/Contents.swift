import Foundation

// Swap Two numbers

var a = 20
var b = 15

//Solution 1: Using a temporary variable
func swap1(_ a: inout Int, _ b: inout Int) {
    (a, b) = (b, a)
}

swap1(&a, &b)
print("a: \(a), b: \(b)")

//Solution 2: Without using a temporary variable
 func swap2(_ a: inout Int, _ b: inout Int) {
    a = a + b
    b = a - b
    a = a - b
}

swap2(&a, &b)

// Solution 3 : Creating a Generic Swap func for all DataTypes
func swap3<T>(_ a: inout T, _ b: inout T) {
    (a, b) = (b, a)
}

let swappedValues: () = swap3(&a, &b)
print("Swapped Values a:\(a), b: \(b)")

// Check for String
var c = "String 1"
var d = "String 2"
swap3(&c, &d)
print("Swapped Values c:\(c), d: \(d)")
