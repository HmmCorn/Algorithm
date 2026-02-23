import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    
    var result: Int = 0
    
    func dfs(_ index: Int, _ num: Int) {
        if index == numbers.count {
            if num == target {
                result += 1
            }
        } else {
            let index = index + 1
            dfs(index, num + numbers[index - 1])
            dfs(index, num - numbers[index - 1])
        }
    }

    dfs(0, 0)
    return result
}

