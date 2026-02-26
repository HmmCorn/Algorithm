// M은 상자의 가로 칸의 수, N은 상자의 세로 칸의 수를 나타낸다. 단, 2 ≤ M,N ≤ 1,000 이다
// 첫째 줄에 M 과 N 입력
// 두번째 줄부터 행렬 입력
/*
6 4
0 0 0 0 0 0
0 0 0 0 0 0
0 0 0 0 0 0
0 0 0 0 0 1
*/


/*
100
000
000

120
200
000

123
230
300

123
234
340

123
234
345

결과는 5 - 1
*/

func solution(_ box: [[Int]]) -> Int {
    let n = box.count
    let m = box[0].count
    var box = box

    var queue: [(x: Int, y: Int)] = []

    // 익은 토마토 큐에 넣기

    for i in 0..<n {
        for j in 0..<m {
            if box[i][j] == 1 {
                queue.append((i, j))
            }
        }
    }

    // bfs

    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]

    var queueIndex = 0

    while queueIndex < queue.count {
        let (x, y) = queue[queueIndex]
        queueIndex += 1

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            if nx>=0 && ny>=0 && nx<n && ny<m {
                if box[nx][ny] == 0 {
                    box[nx][ny] = box[x][y] + 1
                    queue.append((nx, ny))
                }
            }
        }
    }

    // 결과

    var result = 0

    for i in 0..<n {
        for j in 0..<m {
            if box[i][j] == 0 {
                return -1
            }
            result = max(result, box[i][j])
        }
    }

    return result - 1
}

// main
let mn = readLine().split(separator: " ").map { Int(String($0))! }
let m = mn[0]
let n = mn[1]
var box: [[Int]] = []

for _ in 0..<n {
    let row = readLine().split(separator: " ").map { Int($0)! }
    box.append(row)
}

print(solution(box))
