func solution(_ n: Int) -> Int {

    var y: [Int] = Array(repeating: 0, count: 100_000)
    y[0] = 1
    y[1] = 1

    for i in 2..<100_000 {
        y[i] = (y[i-2] + y[i-1]) % 1234567
    }

    return y[n-1]
}
