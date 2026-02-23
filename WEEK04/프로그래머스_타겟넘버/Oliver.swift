// numbers.count 는 2 ~ 20

func solution(_ numbers: [Int], _ target: Int) -> Int {

    var count = 0

    func dfs(_ nowIndex: Int, _ nowSum: Int) {
        // 탈출 조건
        if nowIndex == numbers.count {
            if nowSum == target {
                count += 1    
            }
            return
        }

        dfs(nowIndex + 1, nowSum + numbers[nowIndex])
        dfs(nowIndex + 1, nowSum - numbers[nowIndex])
    }

    dfs(0, 0)

    return count
}

/*
[1, 1, 1] 이면

[0]
[1, -1]
[2, 0, 0, -2]
[3, 1, 1, -1, 1, -1, -1, -3]
*/

func solution1(_ numbers: [Int], _ target: Int) -> Int {

    var sums = [0]

    for number in numbers {
        var temp: [Int] = []

        for sum in sums {
            temp.append(sum + number)
            temp.append(sum - number)
        }

        sums = temp
    }

    return sums.filter { $0 == target }.count
}
