func solution(_ files: [String]) -> [String] {
    
    func parse(_ file: String) -> (head: String, number: Int) {
        var head = ""
        var numStr = ""
        var parsingNum = false
        
        for ch in file {
            if !parsingNum {
                if ch.isNumber {
                    parsingNum = true
                    numStr.append(ch)
                } else {
                    head.append(ch)
                }
            } else {
                if ch.isNumber {
                    numStr.append(ch)
                } else {
                    break
                }
            }
        }
        return (head.lowercased(), Int(numStr)!)
    }
    
    return files
        .enumerated()
        .sorted { lhs, rhs in
            let l = parse(lhs.element)
            let r = parse(rhs.element)
            
            // head 정렬
            if l.head != r.head { return l.head < r.head }
            // number 정렬
            if l.number != r.number { return l.number < r.number }
            // 안정성
            return lhs.offset < rhs.offset
        }
        .map { $0.element }
}
