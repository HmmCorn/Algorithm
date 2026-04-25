// 백준 - 14890 경사로

let nl = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nl[0]; let l = nl[1]
var map = [[Int]]()
for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").compactMap { Int($0) })
}

var count = 0
for i in 0..<n {
    if check(map[i]) { count += 1 }
    
    var column = [Int]()
    for row in map { column.append(row[i]) }
    if check(column) { count += 1 }
}

print(count)

func check(_ line: [Int]) -> Bool {
    var used = [Bool](repeating: false, count: n)
    
    for i in 0..<n-1 {
        let diff = line[i+1] - line[i]
        
        if diff == 0 { continue }
        
        else if diff == 1 {
            let start = i - l + 1
            if start < 0 { return false }
            for j in start...i {
                if used[j] { return false }
                if line[j] != line[i] { return false }
                used[j] = true
            }
        }
        
        else if diff == -1 {
            let end = i + l
            if end >= n { return false }
            for j in i+1...end {
                if used[j] { return false }
                if line[j] != line[i+1] { return false }
                used[j] = true
            }
        }
        
        else { return false }
    }
    return true
}
