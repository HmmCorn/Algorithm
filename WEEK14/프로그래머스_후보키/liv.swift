// 프로그래머스 - 후보키

import Foundation

func solution(_ relation: [[String]]) -> Int {
    // 특정 컬럼의 값들을 셋에 넣고, 로우 갯수와 동일하면 후보키 개수 카운트
    // 동일하지 않으면, 다른 컬럼의 값을 함께 배열로 셋에 넣어 동일한지 확인
    // 마지막 컬럼까지 진행하고 후보키 개수 반환
    let columnCount = relation[0].count
    var candidateKeys = [[Int]]()
    
    func match(_ targetSize: Int, _ selected: [Int], _ start: Int) {
        if selected.count == targetSize {

            for key in candidateKeys where Set(key).isSubset(of: Set(selected)) {
                return
            }

            var set = Set<String>()

            for row in relation {
                var value = ""

                for column in selected {
                    value += row[column] + ","
                }

                set.insert(value)
            }

            if set.count == relation.count { candidateKeys.append(selected) }

            return
        }

        // 다음 컬럼 선택
        for col in start..<columnCount {
            match(targetSize, selected + [col], col+1)
        }
        
    }
    
    for size in 1...columnCount { match(size, [], 0) }
    
    return candidateKeys.count
}
