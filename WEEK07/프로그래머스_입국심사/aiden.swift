let nc = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, c) = (nc[0], nc[1])

var arr = [Int]()
for _ in 0..<n { arr.append(Int(readLine()!)!) }
arr.sort()

var start = 0; var end = 1_000_000_000

while start <= end {
    let mid = (start + end) / 2

    if promising(mid) {
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(end)

func promising(_ distance: Int) -> Bool {
    var count = 0
    var prev = 0
    
    for i in 0..<n {
        if arr[i] - prev >= distance || i == 0 {
            count += 1
            prev = arr[i]
        }
    }

    return count >= c
} 
