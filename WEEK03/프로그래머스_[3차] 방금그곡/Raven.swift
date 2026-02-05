func solution(_ m:String, _ musicinfos:[String]) -> String {
    var result = "(None)"
    var resultPlayTime = 0
    var resultStartTime = 0

    for info in musicinfos {
        let info = info.components(separatedBy: ",")
        let startTime = toInt(info[0])
        let endTime = toInt(info[1])
        let playTime = endTime - startTime
        let musicTitle = info[2]
        let melody = info[3]
        var music = ""
        
        while music.count < playTime {
            music += toShortString(melody)
        }
        
        if music.prefix(playTime).contains(toShortString(m)) {
            if playTime > resultPlayTime {
                result = musicTitle
                resultPlayTime = playTime
                resultStartTime = startTime
            } else if playTime == resultPlayTime {
                if startTime < resultStartTime {
                    result = musicTitle
                    resultPlayTime = playTime
                    resultStartTime = startTime
                }
            }
        }
    }
    return result
}

func toInt(_ timeString: String) -> Int {
    let components = timeString.components(separatedBy: ":")
    return (Int(components[0])! * 60) + Int(components[1])!
}

func toShortString(_ string: String) -> String {
    return string.replacingOccurrences(of: "C#", with: "c")
    .replacingOccurrences(of: "D#", with: "d")
    .replacingOccurrences(of: "F#", with: "f")
    .replacingOccurrences(of: "G#", with: "g")
    .replacingOccurrences(of: "A#", with: "a")
    .replacingOccurrences(of: "B#", with: "C")
    .replacingOccurrences(of: "E#", with: "F")
}
