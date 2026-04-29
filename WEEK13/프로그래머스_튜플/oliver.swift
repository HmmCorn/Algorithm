import Foundation

func solution(_ s: String) -> [Int] {
    // 선언형 arrS
    // - s의 앞2개, 뒤2개 제거
    // - },{ 기준으로 나누면 제일 깔끔할듯.

    // s를 2차원 배열로 파싱
    var arrS: [[Int]] = []

    var currentArr: [Int] = []
    var number = ""

    for char in s {
        if char == "{" {
            currentArr = []
            number = ""
        } else if char == "}" {
            if !number.isEmpty {
                currentArr.append(Int(number)!)
                number = ""
                arrS.append(currentArr)
            }
        } else if char == "," {
            if !number.isEmpty {
                currentArr.append(Int(number)!)
                number = ""
            }
        } else {
            number.append(char)
        }
    }

    // arrS를 개수 기준으로 정렬
    let sortedArrS = arrS.sorted { $0.count < $1.count }

    // sortedArrS를 순회하면서 result 배열만들기
    var result: [Int] = []
    var used: Set<Int> = []

    for arr in sortedArrS {
        for number in arr {
            if !used.contains(number) {
                result.append(number)
                used.insert(number)
                break
            }
        }
    }

    return result
}
