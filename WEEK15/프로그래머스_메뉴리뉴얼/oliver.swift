import Foundation

func solution(_ orders: [String], _ course: [Int]) -> [String] {

    // 모든 조합 생성
    var allCombinations = [String]()

    func combination(_ order: String, _ courseCount: Int, _ startIndex: Int, _ currentMenu: String) {
        if currentMenu.count == courseCount {
            allCombinations.append(currentMenu)
            return
        }

        let orderArray = Array(order)
        for i in startIndex..<orderArray.count {
            combination(order, courseCount, i+1, currentMenu + String(orderArray[i]))
        }
    }

    for courseCount in course {
        for order in orders {
            let sortedOrder = String(order.sorted())
            combination(sortedOrder, courseCount, 0, "")
        }
    }



    // 중복 개수 세기
    var countDict = [String: Int]()
    for menu in allCombinations {
        countDict[menu, default: 0] += 1
    }



    // 결과 배열 만들기
    var result = [String]()
    
    for courseCount in course {
        
        // 최대 등장 횟수
        var maxCount = 0
        for (menu, count) in countDict {
            if menu.count == courseCount {
                maxCount = max(maxCount, count)
            }
        }

        // 최소 2번
        guard maxCount >= 2 else { continue }

        // 최대 등장 횟수인 조합 찾기
        for (menu, count) in countDict {
            if menu.count == courseCount && count == maxCount {
                result.append(menu)
            }
        }
    }

    return result.sorted()
}
