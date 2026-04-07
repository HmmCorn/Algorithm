// 백준 - 2470 두 용액

let count = Int(readLine()!)!
var items = readLine()!.split(separator: " ").compactMap { Int($0) }

items.sort()
var first = 0
var second = count - 1
var result = Int.max
var selected = (0, 0)

while first < second {
    let mix = items[first] + items[second]
    
    if abs(mix) < result {
        result = abs(mix)
        selected = (items[first], items[second])
    }

    if mix == 0 { break }
    else if mix < 0 { first += 1 }
    else { second -= 1 }
}

print(selected.0, selected.1)
