// 프로그래머스 - 신규 아이디 추천

import Foundation

func solution(_ new_id:String) -> String {
    var newID = new_id
    
    newID = newID.lowercased()
    
    // 2
    newID = newID
        .filter { $0.isLetter || $0.isNumber  || ["-", ".", "_"].contains($0) }
    
    
    //3
    var tmp = ""
    var stack = [Character]()
    for c in newID {
        if c == "." && tmp.last == "." {
            continue 
        }
        tmp += String(c)
    }
    newID = tmp
    print(newID)
    
    // 4
    if newID.first == "." {
        newID.removeFirst()
    }
    if newID.last == "." {
        newID.removeLast()
    }

    // 5
    if newID.isEmpty {
        newID += "a"
    }
    
    // 6
    if newID.count >= 16 {
        newID = newID.map { String($0) }[0..<15].joined()
        
        if newID.last == "." {
            newID.removeLast()
        }
    }
   
    // 7
    if let lastChar = newID.last {
        let c = String(lastChar)
        while newID.count < 3 {
             newID += c
        }
    }
    let lastChar = String(newID.last!)

    return newID
}
