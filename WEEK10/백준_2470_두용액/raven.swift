let input = Int(readLine()!)!
let elements = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()

var left = 0
var right = elements.count - 1

var minLeft = left
var minRight = right

while left < right {
    let sum = elements[left] + elements[right]
    if abs(sum) <= abs(elements[minLeft] + elements[minRight]) {
        minLeft = left
        minRight = right
    }

    if sum < 0 {
        left += 1
    } else {
        right -= 1
    }
}

print(elements[minLeft], elements[minRight])

// let input = Int(readLine()!)!
// let elements = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()

// var left = 0
// var right = elements.count - 1

// var minLeft = left
// var minRight = right

// while left < right {
//     if abs(elements[left] + elements[right]) <= abs(elements[minLeft] + elements[minRight]) {
//         minLeft = left
//         minRight = right
//     }

//     if abs(elements[left] + elements[right - 1]) >= abs(elements[left + 1] + elements[right]) {
//         left += 1
//     } else {
//         right -= 1
//     }
// }

// print(elements[minLeft], elements[minRight])
