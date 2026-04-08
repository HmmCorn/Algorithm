let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, k) = (nk[0], nk[1])
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }

var (l, r) = (0, 0)
var used = [Int: Int]()
var result = 0

while true {
    if used[arr[r], default: 0] + 1 > k {
        used[arr[l], default: 0] -= 1
        result = max(result, r - l)
        l += 1
    } else {
        if r == n - 1 { break }
        used[arr[r], default: 0] += 1
        r += 1
    }
}
result = max(result, r - l + 1)

print(result)
