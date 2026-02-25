func solution(_ dartResult:String) -> Int {
    var totalscore: Int = 0
    var currentScore: Int = 0
    var recentScore: Int = 0
    var currentNum: String = ""
    var areaMap: [Character: Int] = [
        "S" : 1,
        "D" : 2,
        "T" : 3
    ]

    for char in dartResult {
        if char.isNumber {
            currentNum += String(char)
        } else {
            if let repeatCount = areaMap[char] {
                recentScore = currentScore
                totalscore += currentScore
                currentScore = Int(currentNum) ?? 0
                currentNum = ""
                let multiScore = Array(repeating: currentScore, count: repeatCount).reduce(1, *)
                currentScore = multiScore
            } else {
                if char == "*" {
                    currentScore *= 2
                    totalscore += recentScore
                } else {
                    currentScore *= -1
                }
            }
        }
    }
    totalscore += currentScore
    return totalscore
}
