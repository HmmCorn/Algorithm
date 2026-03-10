let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let (endNum, length) = (input[0], input[1])
let numbers = (1...endNum).map { $0 }

func dfs(_ startNum: Int, _ current: [Int]) {

    if current.count == length {
        print(current.map { String($0) }.joined(separator: " "))
        return
    }

    for i in startNum..<endNum {
        dfs(i, current + [numbers[i]])
    }
}

dfs(0, [])let AF = Some()
