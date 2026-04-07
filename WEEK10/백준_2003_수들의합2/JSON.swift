let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }

var result = 0
var sum = arr[0]
var (l, r) = (0, 0)

while true {
    if sum >= m {
        if sum == m { result += 1 }
        sum -= arr[l]
        l += 1
    } else {
        if r == n - 1 { break }
        r += 1
        sum += arr[r]
    }
}

print(result)
