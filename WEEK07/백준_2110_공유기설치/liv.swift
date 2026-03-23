// 백준 - 2110 공유기 설치

let firstLine = readLine()!.split(separator: " ").compactMap { Int($0) }
let (houseCount, routerCount) = (firstLine[0], firstLine[1])
var houses = [Int]()

for _ in 1...houseCount {
    houses.append(Int(readLine()!)!)
}

// 공유기 간의 거리가 x일 때 공유기 개수가 정해진 것보다 같거나 큰가?
houses.sort()
var start = 2
var end = houses[houseCount - 1]

while start <= end {
    let mid = (start + end) / 2

    var count = 1
    var previous = houses[0]
    for house in houses where house - previous >= mid {
        count += 1
        previous = house
    }

    if count >= routerCount {
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(end)
