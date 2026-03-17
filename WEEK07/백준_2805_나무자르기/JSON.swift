let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])
let trees = readLine()!.split(separator: " ").compactMap { Int($0) }
let maxHeight = trees.max()!

func binarySearch() -> Int {
    var minHeight = 0
    var maxHeight = maxHeight

    while minHeight < maxHeight {
        let mid = (minHeight + maxHeight + 1) / 2
        let cuttedTree = cutTree(mid)

        if cuttedTree < m { // 자른게 부족 -> 더 낮게 잘라야됨
            maxHeight = mid - 1
        } else if cuttedTree > m { // 자른게 여유 -> 얘가 답이 될 수도
            minHeight = mid
        } else {
            return mid
        }
    }

    return minHeight
}

/// height 기준으로 나무를 잘랐을 때 잘린 나무의 길이
func cutTree(_ height: Int) -> Int {
    var result = 0
    for tree in trees {
        let cutted = tree - height
        result += cutted > 0 ? cutted : 0
    }

    return result
}

print(binarySearch())

/**
Case 1. `mid = (minHeight + maxHeight) / 2`

    현재 로직에서 `cuttedTree > m => minHeight = mid` 이므로
    minHeight = 2n, maxHeight = 2n + 1 이면 mid = { (2n) + (2n + 1) } / 2 = 2n
    따라서 minHeight = 2n을 할당 -> 똑같은 수를 할당하므로 무한루프 발생

Case 2. `mid = (minHeight + maxHeight + 1)` / 2
    Note
      (min + max) / 2 -> 몫
      (min + max) / 2 -> 몫  or  몫 + 1 (홀 + 짝 일 때)

    minHeight = 2n, maxHeight = 2n + 1 이면 mid = { (2n) + (2n + 1) + 1 } / 2 = 2n + 1
    따라서 minHeight = 2n + 1을 할당 -> min == max 이므로 while문 탈출
*/
