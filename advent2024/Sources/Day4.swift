import Foundation

enum Day4 {
    static func run(filePath: String?) {
        let path = filePath ?? "../inputs/xmas.txt"
        var grid: [[Character]] = []

        do {
            let fileContents = try String(contentsOfFile: path, encoding: .utf8)
            let lines = fileContents.split(separator: "\n")
            for line in lines {
                grid.append(Array(line))
            }

            // Count occurrences of the "X-MAS" pattern
            let count = countXMASPatterns(grid: grid)
            print("The X-MAS pattern appears \(count) times.")
        } catch {
            print("Error reading file at \(path): \(error)")
            exit(1)
        }
    }

    static func countXMASPatterns(grid: [[Character]]) -> Int {
        var count = 0

        for row in 1..<(grid.count - 1) {
            for col in 1..<(grid[0].count - 1) {
                // Check if this cell is the center of a valid X-MAS
                if isXMASCenter(grid: grid, row: row, col: col) {
                    count += 1
                }
            }
        }

        return count
    }

    static func isXMASCenter(grid: [[Character]], row: Int, col: Int) -> Bool {
        let diagonals = [
            // Top-left to bottom-right
            (row - 1, col - 1, row + 1, col + 1),
            // Top-right to bottom-left
            (row - 1, col + 1, row + 1, col - 1)
        ]

        for (r1, c1, r2, c2) in diagonals {
            if isInBounds(grid: grid, row: r1, col: c1) &&
                isInBounds(grid: grid, row: r2, col: c2) {
                let diagonal = [grid[r1][c1], grid[row][col], grid[r2][c2]]
                if isMAS(diagonal) {
                    continue
                } else {
                    return false
                }
            } else {
                return false
            }
        }

        return true
    }

    static func isMAS(_ diagonal: [Character]) -> Bool {
        let mas = ["MAS", "SAM"]
        return mas.contains(String(diagonal))
    }

    static func isInBounds(grid: [[Character]], row: Int, col: Int) -> Bool {
        return row >= 0 && row < grid.count && col >= 0 && col < grid[0].count
    }
}
