/**
- 길: 한 행 또는 한 열
- 통행 조건
  - 길에 속한 모든 칸의 높이가 같아야 함.
  - 경사로를 놓을 수 잇음.

- 경사로: 높이가 항상 1, 길이 L, 개수는 많음.

i, i + 1 비교
- 같으면 -> ㄱㅊ
- 1차이 -> 경사로
- 2차이 이상 -> false


arr[i]
다르면 검사 필요
- 내리막이었다면? -> 지금까지 개수가 L개인지 확인
-오르막이었다면?
*/

let nl = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, l) = (nl[0], nl[1])
var map = [[Int]]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    map.append(input)
}

var count = 0

for i in 0..<n {
    count += canPass(map[i]) ? 1 : 0
}

for c in 0..<n {
    var arr = [Int]()
    for r in 0..<n {
        arr.append(map[r][c])
    }
    count += canPass(arr) ? 1 : 0
}

print(count)

func canPass(_ arr: [Int]) -> Bool {
    var len = 0

    for i in 0..<n - 1 {
        let diff = arr[i + 1] - arr[i]
        len += 1

        if diff == 0 {
            continue
        }
        if abs(diff) > 1 {
            return false
        }

        if diff == 1 && len >= l {
            len = 0
        }
        else if diff == -1 && len >= 0 {
            len = -l
        } else {
            return false
        }
    }

    len += 1
    return len >= 0
}

