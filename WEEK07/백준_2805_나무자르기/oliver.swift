let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0] // <= 1,000,000
let m = nm[1] // <= 2,000,000,000
let trees = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
let sortedTrees = trees.sorted()

/*
나무 [10, 15, 17, 20], 목표 = 7

var start = 0
var end = 나무.max()
var mid = (start + end) / 2
var result = 0

mid = (0 + 20) / 2 = 10
- 10 보다 큰 나무들 = 5 + 7 + 10 = 22
- 22 >= 7 이므로
  - result = mid (10)
  - start = mid + 1


mid = (11 + 20) / 2 = 15
- 15 보다 큰 나무들 = 2 + 5 = 7
- 7 >= 7 이므로
  - result = mid (15)
  - start = mid + 1


mid = (16 + 20) / 2 = 18
- 18 보다 큰 나무들 = 2
- 2 < 7 이므로
  - end = mid - 1


mid = (16 + 17) / 2 = 16
- 16 보다 큰 나무들 = 1 + 4 = 5
- 5 < 7 이므로
  - end = mid - 1

start(16) > end(15)가 되면 반복문 끝
*/

var start = 0
var end = sortedTrees.max() ?? 0
var mid = (start + end) / 2
var result = 0

while start <= end {

    mid = (start + end) / 2
    var total = 0

    for tree in sortedTrees {
        if tree > mid {
            total += tree - mid
        }
    }

    if total >= m {
        result = mid
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(result)
