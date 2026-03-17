let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }

var start = 0; var end = arr.max()!

while start <= end {
    let mid = (start + end) / 2
    let remainder = arr.reduce(0) { $0 + max($1 - mid, 0) } 

    if remainder >= m {
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(end)