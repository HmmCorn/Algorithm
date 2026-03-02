import Foundation
let input = readLine()!
let components = input.split(separator: " ").compactMap { Int($0) }
let (rowCount, columnCount) = (components[0], components[1])
var tomatoMap: [[Int]] = []
var unripeTomatoCount = 0
var ripeTomatos: [(Int, Int, Int)] = []
var totalTomatoCount: Int = 0

for column in 0..<columnCount {
    let tomatoRow = readLine()!.split(separator: " ").compactMap { Int($0) }
    tomatoMap.append(tomatoRow)
    for (row, state) in tomatoRow.enumerated() {
        if state == 0 {
            unripeTomatoCount += 1
            totalTomatoCount += 1
        } else if state == 1 {
            ripeTomatos.append((column, row, 0))
            totalTomatoCount += 1
        }
    }
}

if unripeTomatoCount == 0 {
    print(0)
} else {
    var day: Int = 0
    var index: Int = 0
    let weights: [(Int, Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]

    while index < ripeTomatos.count {
        let (column, row, depth) = ripeTomatos[index]
        index += 1

        for (columnWeight, rowWeight) in weights {
            let currentColumn = column + columnWeight
            let currentRow = row + rowWeight

            if (0..<columnCount).contains(currentColumn) && (0..<rowCount).contains(currentRow) {
                if tomatoMap[currentColumn][currentRow] == 0 {
                    tomatoMap[currentColumn][currentRow] = 1
                    ripeTomatos.append((currentColumn, currentRow, depth + 1))
                    day = depth + 1
                }
            }
        }
    }

    let isValid = !tomatoMap.flatMap { $0 }.contains(0)
    print(isValid ? day : -1)
}
