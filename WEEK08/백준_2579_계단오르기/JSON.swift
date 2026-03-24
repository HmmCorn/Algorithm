let n = Int(readLine()!)!
var stairs = [0]

for _ in 0..<n {
    let input = Int(readLine()!)!
    stairs.append(input)
}

// Bottom-up
var table = [Int](repeating: 0, count: n + 1)
func dp(_ n: Int) -> Int {
    if n <= 0 {
        return 0
    }
    if n == 1 {
        return stairs[1]
    }
    if n == 2 {
        return stairs[1] + stairs[2]
    }

    (table[1], table[2]) = (stairs[1], stairs[1] + stairs[2])

    for i in 3...n {
        table[i] = max(table[i - 3] + stairs[i - 1], table[i - 2]) + stairs[i]
    }

    return table[n]
}

print(dp(n))


// Top-down
//var table = [Int: Int]()
//
//func dp(_ n: Int) -> Int {
//    if n == 0 {
//        return 0
//    }
//    if n == 1 {
//        return stairs[1]
//    }
//    if n == 2 {
//        return stairs[1] + stairs[2]
//    }
//
//    if table[n] == nil {
//        table[n] = max(dp(n - 3) + stairs[n - 1], dp(n - 2)) + stairs[n]
//    }
//
//    return table[n]!
//}
//
//print(dp(n))
