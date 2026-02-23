func solution(_ str1:String, _ str2:String) -> Int {

    var str1 = makeWordList(str1)
    var str2 = makeWordList(str2)
    var intersection: Int = 0
    for key in str1.0.keys {
        let num = min(str1.0[key] ?? 0, str2.0[key] ?? 0)
        intersection += num
    }
    let union = str1.1 + str2.1 - intersection

    if str1.1 == 0 && str2.1 == 0 {
        return 65536
    }
    return 65536 * intersection / union
}

func makeWordList(_ str: String) -> ([String: Int], Int) {
    var word: String = ""
    var wordMap: [String: Int] = [:]
    var count: Int = 0
    for s in str.lowercased() {
        if !s.isLetter {
            word = ""
            continue
        }
        word += String(s)
        if word.count == 2 {
            wordMap[word, default: 0] += 1
            count += 1
            word = String(s)
        }
    }
    return (wordMap, count)
}
