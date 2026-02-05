func solution(_ m: String, _ musicinfos: [String]) -> String {
    
    // 분 변환
    func toMinute(_ time: String) -> Int {
        let t = time.split(separator: ":").map { Int($0)! }
        return t[0] * 60 + t[1]
    }

    // 반음처리
    func halfStep(_ s: String) -> String {
        return s
        .replacingOccurrences(of: "C#", with: "c")
        .replacingOccurrences(of: "D#", with: "d")
        .replacingOccurrences(of: "F#", with: "f")
        .replacingOccurrences(of: "G#", with: "g")
        .replacingOccurrences(of: "A#", with: "a")
        .replacingOccurrences(of: "B#", with: "C")
        .replacingOccurrences(of: "E#", with: "F")
    }

    let goal = halfStep(m)
    var result = "(None)"
    var maxTime = -1
    
    for info in musicinfos {
        let parts = info.split(separator: ",").map { String($0) }
        let start = toMinute(parts[0])
        let end = toMinute(parts[1])
        let playTime = end - start
        let title = parts[2]
        let melody = Array(halfStep(parts[3]))

        if melody.isEmpty { continue }

        var played = ""
        for i in 0..<playTime {
            played.append(melody[i % melody.count])
        }

        if played.contains(goal) {
            if playTime > maxTime {
                maxTime = playTime
                result = title
            }
        }
    }

    return result
}
