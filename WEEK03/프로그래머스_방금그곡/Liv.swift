// 프로그래머스 - 방금그곡

func solution(_ m: String, _ musicinfos: [String]) -> String {
    var selected: (String, Int) = ("(None)", 0)
    let heard = convertSheet(m)

    for music in musicinfos {
        let info = music.split(separator: ",").map { String($0) }
        guard info.count == 4 else { continue }

        let duration = toNumber(info[1]) - toNumber(info[0])
        let sheet = convertSheet(info[3])
        guard !sheet.isEmpty, duration > 0 else { continue }

        let repeatCount = duration / sheet.count + 1
        let played = String((String(repeating: sheet, count: repeatCount)).prefix(duration))

        if played.contains(heard) && duration > selected.1 {
            selected = (info[2], duration)
        }
    }

    return selected.0
}

func toNumber(_ str: String) -> Int {
    let sections = str.split(separator: ":").map { String($0) }
    guard sections.count == 2,
        let min = Int(sections[0]),
        let sec = Int(sections[1])
    else { return 0 }
    return min * 60 + sec
}

func convertSheet(_ str: String) -> String {
    var sheet: String = str
    while let point = sheet.firstIndex(of: "#") {
        let target = sheet.index(before: point)
        let note = sheet[target].lowercased()
        sheet.removeSubrange(target...point)
        sheet.insert(contentsOf: note, at: target)
    }
    return sheet
}
