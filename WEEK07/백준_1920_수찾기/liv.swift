// 백준 - 1920 수 찾기

let n = Int(readLine()!)!
let list = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted { $0 < $1 }
let m = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }

var result = [Int]()

for number in numbers {
    if number < list[0] || number > list[n - 1] {
        result.append(0)
    } else {
        var start = 0
        var end = n - 1
        var flag = 0
    
        while start <= end && flag == 0 {
            let target = (start + end) / 2

            if number == list[target] { flag = 1 }
            else if number > list[target] { start = target + 1 }
            else { end = target - 1 }
        }
    
        result.append(flag)
    }
}
print(result.map { String($0) }.joined(separator: "\n"))
