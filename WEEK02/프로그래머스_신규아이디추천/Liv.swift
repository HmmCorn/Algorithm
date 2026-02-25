// 프로그래머스 - 신규 아이디 추천

import Foundation

func solution(_ new_id: String) -> String {
    // 1단계 + 2단계
    var newID = new_id.lowercased()
                    .filter { $0.isLetter || $0.isNumber || ["-", "_", "."].contains($0) }

    // 3단계
    while newID.contains("..") {
        newID = newID.replacingOccurrences(of: "..", with: ".")
    }
    
    // 4단계
    if newID.first == "." {
        newID.removeFirst()
    }
    if newID.last == "." {
        newID.removeLast()
    }
    
    // 5단계
    if newID.isEmpty {
        newID = "a"
    // 6단계
    } else if newID.count >= 16 {
        newID.removeLast(newID.count - 15)
        if newID.last == "." {
            newID.removeLast()
        }
    }
    
    // 7단계
    while newID.count < 3 {
        newID.append(newID.last!)
    }

    return newID
}
