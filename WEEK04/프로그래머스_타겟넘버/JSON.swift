import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var count = 0
    
    func dfs(_ curr: Int, _ idx: Int) {
        guard idx < numbers.count else {
            count += (target == curr) ? 1 : 0
            return
        }
        
        for sign in [1, -1] {
            dfs(curr + (sign * numbers[idx]), idx + 1)
        }
    }
    
    dfs(0, 0)
    
    return count
}
