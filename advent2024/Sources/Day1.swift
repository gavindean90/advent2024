import Foundation

enum Day1 {
    static func run(filePath: String?) {
        // Use the provided file path or fall back to the default
        let path = filePath ?? "../inputs/01.txt"
        
        // Lists to store the split strings
        var list1: [Int] = []
        var list2: [Int] = []
        
        do {
            // Read the contents of the file
            let fileContents = try String(contentsOfFile: path, encoding: .utf8)
            let lines = fileContents.split(separator: "\n")
            
            // Validate and parse each line
            for (index, line) in lines.enumerated() {
                let components = line.split(maxSplits: 1, whereSeparator: { $0.isWhitespace })
                
                // Validate the split result
                guard components.count == 2 else {
                    print("Error: Line \(index + 1) does not have exactly two columns separated by whitespace: \(line)")
                    exit(1)
                }
                
                guard let part1 = Int(components[0].trimmingCharacters(in: .whitespaces)),
                      let part2 = Int(components[1].trimmingCharacters(in: .whitespaces)) else {
                    print("Error: Line \(index + 1) contains non-integer values: \(line)")
                    exit(1)
                }
                
                list1.append(part1)
                list2.append(part2)
            }
            
            // Validate input length right after processing
            guard list1.count == list2.count else {
                print("Error: Input data is invalid. List sizes do not match.")
                print("List1 size: \(list1.count), List2 size: \(list2.count)")
                exit(1)
            }
            
            // Sort the lists
            list1.sort()
            list2.sort()
            
            // Calculate absolute differences
            var diff: [Int] = []
            for i in 0..<list1.count {
                let difference = abs(list1[i] - list2[i])
                diff.append(difference)
            }
            
            // Print the sum of differences
            print("Total Sum of Differences: \(diff.reduce(0, +))")

            // Optimized similarity calculation
            // Precompute counts for each element in list2
            var countDict: [Int: Int] = [:]
            for num in list2 {
                countDict[num, default: 0] += 1
            }

            // Calculate the similarity score using precomputed counts
            var sim: [Int] = []
            for num in list1 {
                let count = countDict[num] ?? 0
                sim.append(num * count)
            }

            // Print the total similarity score
            print("Total Sum of Similarities: \(sim.reduce(0, +))")
            
        } catch {
            print("Error reading file at \(path): \(error)")
            exit(1)
        }
    }
}
