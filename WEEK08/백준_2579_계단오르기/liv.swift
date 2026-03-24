// 백준 - 2579 계단 오르기

var steps = [0]
let count = Int(readLine()!)!
for _ in 0..<count { steps.append(Int(readLine()!)!) }

var points = [Int](repeating: 0, count: count + 1)

if count >= 1 { points[1] = steps[1] }
if count >= 2 { points[2] = steps[1] + steps[2] }

if count > 2 {
    for index in 3...count {
        points[index] = max(
            points[index - 3] + steps[index - 1] + steps[index],
            points[index - 2] + steps[index]
        )
    }
}
print(points[count])
