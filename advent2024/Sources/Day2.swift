import Foundation

enum Day2 {
    static func run(filePath: String?) {
        // Use provided file path or default to "../inputs/02.txt"
        let path = filePath ?? "../inputs/02.txt"
        var levels_array: [[Int]] = []
        
        do {
            // Read file and split into lines
            let fileContents = try String(contentsOfFile: path, encoding: .utf8)
            let lines = fileContents.split(separator: "\n")
            
            // Process each line as a report
            for line in lines {
                var level_array: [Int] = []
                let levels = line.split(whereSeparator: { $0.isWhitespace })
                
                // Convert each level to Int and check if the report is safe
                for level_string in levels {
                    level_array.append(Int(level_string)!)
                }
                if isSafeReport(level_array) || canBeMadeSafe(level_array) {
                    levels_array.append(level_array)
                }
            }
            
            // Output count of safe reports
            print(levels_array.count)
        } catch {
            print("Error reading file at \(path): \(error)")
            exit(1)
        }
    }
}

// Validate whether a report meets the safety criteria
func isSafeReport(_ levels: [Int]) -> Bool {
    let isAscending = zip(levels, levels.dropFirst()).allSatisfy { $0 <= $1 && $1 - $0 >= 1 && $1 - $0 <= 3 }
    let isDescending = zip(levels, levels.dropFirst()).allSatisfy { $0 >= $1 && $0 - $1 >= 1 && $0 - $1 <= 3 }
    return isAscending || isDescending
}

// Check if removing one level makes the report safe
func canBeMadeSafe(_ levels: [Int]) -> Bool {
    guard levels.count > 2 else { return false } // Can't remove one level from reports with <= 2 levels
    for i in levels.indices {
        // Create a new report with the ith level removed
        var modified = levels
        modified.remove(at: i)
        
        // Check if the modified report is safe
        if isSafeReport(modified) {
            return true
        }
    }
    return false
}
