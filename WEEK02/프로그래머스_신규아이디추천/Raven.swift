import Foundation

func solution(_ new_id:String) -> String {
    // 1단계 new_id의 모든 대문자를 대응되는 소문자로 치환합니다.
    let lowercasedID = new_id.lowercased()
    // 2단계 new_id에서 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거합니다.
    let removedID = lowercasedID.replacingOccurrences(of: "[^a-z0-9._-]", with: "", options: .regularExpression)
    // 3단계 new_id에서 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표(.)로 치환합니다.
    let compactDotID = removedID.replacingOccurrences(of: "\\.{2,}", with: ".", options: .regularExpression)
    // 4단계 new_id에서 마침표(.)가 처음이나 끝에 위치한다면 제거합니다.
    let trimmedID = compactDotID.trimmingCharacters(in: CharacterSet(charactersIn: "."))
    // 5단계 new_id가 빈 문자열이라면, new_id에 "a"를 대입합니다.
    let aID = trimmedID.isEmpty ? "a" : trimmedID
    // 6단계 new_id의 길이가 16자 이상이면, new_id의 첫 15개의 문자를 제외한 나머지 문자들을 모두 제거합니다.
    let prefixID = aID.count >= 16 ? String(aID.prefix(15)) : aID
    // 만약 제거 후 마침표(.)가 new_id의 끝에 위치한다면 끝에 위치한 마침표(.) 문자를 제거합니다.
    let removedDotID = prefixID.last == "." ? String(prefixID.prefix(prefixID.count - 1)) : prefixID
    // 7단계 new_id의 길이가 2자 이하라면, new_id의 마지막 문자를 new_id의 길이가 3이 될 때까지 반복해서 끝에 붙입니다.
    if removedDotID.count <= 2 {
        let appendString = Array(repeating: removedDotID.last, count: 3 - removedDotID.count).compactMap { $0 }.map { String($0) }.reduce("", +)
        return removedDotID + appendString
    } else {
        return removedDotID
    }
}
