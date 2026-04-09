// 프로그래머스 - 가장 많이 받은 선물

import Foundation

func solution(_ friends: [String], _ gifts: [String]) -> Int {
    var giftScore = [Int](repeating: 0, count: friends.count)
    var history = [[String: Int]](repeating: [:], count: friends.count)
    var next = [Int](repeating: 0, count: friends.count)
    
    for gift in gifts {
        let line = gift.split(separator: " ").map { String($0) }
        let sender = friends.firstIndex(of: line[0])!
        let receiver = friends.firstIndex(of: line[1])!
        
        giftScore[sender] += 1
        giftScore[receiver] -= 1
        
        history[sender][line[1], default: 0] += 1
    }
    
    for (index, name) in friends.enumerated() {
        var friend = index + 1
        while friend < friends.count {
            let friendName = friends[friend]
            let fromMe = history[index][friendName] ?? 0
            let fromFriend = history[friend][name] ?? 0
            
            if fromMe > fromFriend { next[index] += 1 }
            else if fromMe < fromFriend { next[friend] += 1 }
            else {
                let myScore = giftScore[index]
                let friendScore = giftScore[friend]
                if myScore > friendScore { next[index] += 1 }
                else if myScore < friendScore { next[friend] += 1 }
            }
            
            friend += 1
        }
    }
    
    return next.max() ?? 0
}
