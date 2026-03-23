// 백준 - 1463 1로 만들기

let number = Int(readLine()!)!
var arr = [Int](repeating: 0, count: number + 1)

if number > 1 {
    for x in 2...number {
        arr[x] = arr[x - 1] + 1
        if x % 3 == 0 { arr[x] = min(arr[x], arr[x / 3] + 1)}
        if x % 2 == 0 { arr[x] = min(arr[x], arr[x / 2] + 1)}
    }
}
print(arr[number])
