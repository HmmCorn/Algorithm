let n = Int(readLine()!)!
var table = [Int](repeating: 0, count: n + 1)

if n > 1 {
    for i in 2...n {
        table[i] = table[i - 1] + 1
        if i % 2 == 0 { table[i] = min(table[i], table[i / 2] + 1) }
        if i % 3 == 0 { table[i] = min(table[i], table[i / 3] + 1) }
    }
}

print(table[n])
