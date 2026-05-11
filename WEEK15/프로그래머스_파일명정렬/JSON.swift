func solution(_ files:[String]) -> [String] {
    return files
        .map { parse(Array($0)) }
        .sorted { Int($0[1])! < Int($1[1])! }
        .sorted { $0[0].lowercased() < $1[0].lowercased() }
        .map { $0.joined(separator: "") }
}

func parse(_ file: [Character]) -> [String] {
    var head = [Character]()
    var number = [Character]()
    var tail = [Character]()

    for i in 0..<file.count {
        // tail은 head, number와 같은 성질의 원소를 가지므로 tail을 가장 먼저 검사하면
        // head, number를 간단한 조건문으로 검사할 수 있음.
        // number의 끝 부분 검사
        if file[i].isNumber && (i + 1) < file.count && !file[i + 1].isNumber {
            number.append(file[i])
            tail = Array(file[(i + 1)...(file.count - 1)])
            break
        } else if !file[i].isNumber {
            head.append(file[i])
        } else if file[i].isNumber {
            number.append(file[i])
        }
    }

    return [String(head), String(number), String(tail)]
}
