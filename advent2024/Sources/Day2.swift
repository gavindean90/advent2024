import Foundation

enum Day2 {
    static func run(filePath: String?) {
        // Example logic for Day 2
        let path = filePath ?? "../inputs/02.txt"
        var levels_array: [[Int]] = []
        do {
            // Read the contents of the file
            let fileContents = try String(contentsOfFile: path, encoding: .utf8)
            let lines = fileContents.split(separator: "\n")
            for (index, line) in lines.enumerated() {
                var level_array: [Int] = []
                let levels: [String.SubSequence] = line.split(whereSeparator: { $0.isWhitespace })
                for level_string in levels {
                    level_array.append(Int(level_string)!)
                }
                let isAscendingAndSafe = zip(level_array, level_array.dropFirst()).allSatisfy { $0 <= $1 && $1 - $0 >= 1 && $1 - $0 <= 3}
                let isDescendingAndSafe = zip(level_array, level_array.dropFirst()).allSatisfy { $0 >= $1 && $0 - $1 >= 1 && $0 - $1 <= 3}
                if (isAscendingAndSafe || isDescendingAndSafe) {
                    levels_array.append(level_array)
                }

            }
            print(levels_array.count)
        } catch {
            print("Error reading file at \(path): \(error)")
            exit(1)
        }
    }
}
