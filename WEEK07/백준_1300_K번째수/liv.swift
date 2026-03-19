// 백준 - 1300 K 번째 수

let n = Int(readLine()!)!
let k = Int(readLine()!)!

var start = 1
var end = n*n

while start <= end {
    let mid = (start + end) / 2

    var count = 0
    for index in 1...n {
        count += min(mid/index, n)
    }

    if count < k {
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(start)
