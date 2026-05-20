import Foundation

var fibonacciSeries = [0, 1, 1, 2, 3, 5, 8, 11]

func fetchFibonacciSeries(upTo n: Int) -> [Int] {
    
    guard n > 0 else { return [] }
    guard n > 1 else { return [0, 1] }
    
    
    var series: [Int] = [0, 1]
    
    for i in 2..<n {
        let nextValue = series[i - 1] + series[i - 2]
        series.append(nextValue)
    }
    return series
}

print("Fibonacci Series till 10 is: \(fetchFibonacciSeries(upTo: 10))")
