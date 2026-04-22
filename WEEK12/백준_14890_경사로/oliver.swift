let nl = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, l) = (nl[0], nl[1])

var map = [[Int]]()
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").compactMap { Int($0) }
    map.append(row)
}

// 그 배열이 가능한지 판단하는 함수
func possible(_ arr: [Int]) -> Bool {
    // (높이, 높이가 연속된 칸 수)
    // [3, 3, 3, 2, 2] -> [(3, 3), (2, 2)]
    var stack: [(height: Int, count: Int)] = []
    stack.append((arr[0], 1))

    // arr에서 판단할 인덱스
    var i = 1

    while i < n {
        let currentHeight = arr[i]
        let last = stack.last!

        let diff = currentHeight - last.height

        // 불가능 먼저 제거
        if abs(diff) > 1 {
            return false
        }

        // 같은 높이
        if diff == 0 {
            var last = stack.removeLast()
            last.count += 1
            stack.append(last)
        }

        // 오르막
        else if diff == 1 {
            if last.count < l { return false }

            var last = stack.removeLast()
            last.count -= l
            stack.append(last)

            stack.append((currentHeight, 1))
        }

        // 내리막
        else {
            if i+l-1 >= n { return false }

            for j in i..<i+l {
                if arr[j] != currentHeight {
                    return false
                }
            }

            i += l - 1

            stack.append((currentHeight, 0))
        }

        i += 1
    }

    return true
}

var result = 2*n

// 행 순회
for i in 0..<n {
    if !possible(map[i]) {
        result -= 1
    }
}

// 열 순회
for i in 0..<n {
    var arr: [Int] = []

    for j in 0..<n {
        arr.append(map[j][i])
    }

    if !possible(arr) {
        result -= 1
    }
}

print(result)
