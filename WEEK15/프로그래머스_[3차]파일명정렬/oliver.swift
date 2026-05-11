func solution(_ files: [String]) -> [String] {
    // 파싱
    // HEAD, NUMBER, TAIL 각각 분리
    // 숫자가 처음 나오면 -> 이전까지는 HEAD, 숫자가 끝날때까지는 NUMBER, 그 외에는 TAIL

    var head = [String]()
    var number = [String]()
    var tail = [String]()

    for file in files {

        let chars = Array(file)

        let numberStart = chars.firstIndex { $0.isNumber }!

        let remain = chars[numberStart...]

        let numberCount = remain.prefix { $0.isNumber }.count

        let currentHead = String(chars[0..<numberStart])

        let currentNumber = String(chars[numberStart..<numberStart + numberCount])

        let currentTail = String(chars[(numberStart + numberCount)...])
        
        head.append(currentHead)
        number.append(currentNumber)
        tail.append(currentTail)
    }

    print(head)
    print(number)
    print(tail)

    // 정렬
    // 1. HEAD: 사전순, 대소문자 구분X
    // 2. NUMBER: 숫자순, 예: 9 < 10 < 0011 < 012 < 13 < 014
    // 3. HEAD와 NUMBER같으면 입력에 주어진 순서 유지

    var indexArray = Array(0..<files.count)

    indexArray.sort {
        let head1 = head[$0].lowercased()
        let head2 = head[$1].lowercased()
        if head1 != head2 {
            return head1 < head2
        }

        let number1 = Int(number[$0])!
        let number2 = Int(number[$1])!
        if number1 != number2 {
            return number1 < number2
        }

        return $0 < $1
    }

    var result = [String]()

    for i in indexArray {
        result.append(head[i] + number[i] + tail[i])
    }

    return result
}
