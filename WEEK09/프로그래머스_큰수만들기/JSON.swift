import Foundation
/**
자기보다 앞에 작은 거 있으면 지워
*/
func solution(_ number:String, _ k:Int) -> String {
    var number = number.map { String($0) }

    var count = 0
    var stack = [String]()
    for n in number {
        while let last = stack.last, last < n, count < k {
            stack.popLast()
            count += 1
        }

        stack.append(n)
    }

    while count < k {
        stack.popLast()
        count += 1
    }

    return stack.joined()
}
