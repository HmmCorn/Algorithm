let n = Int(readLine()!)!
let seq = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
let m = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }

var result = [String]()
for num in arr {
    result.append(binarySearch(num) ? "1" : "0")
}

print(result.joined(separator: "\n"))

func binarySearch(_ num: Int) -> Bool {
    var l = 0
    var r = n - 1

    while l <= r {
        let mid = (l + r) / 2

        if num > seq[mid] {
            l = mid + 1
        } else if num < seq[mid] {
            r = mid - 1
        } else {
            return true
        }


    }

    return false
}
