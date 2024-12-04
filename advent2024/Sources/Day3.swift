import Foundation

enum Day3 {
    static func run(filePath: String?) {
        let path = filePath ?? "../inputs/03.txt"
        
        // Patterns for mul(), do(), and don't()
        let mulPattern = #"mul\((\d+),(\d+)\)"#
        let controlPattern = #"(do\(\)|don't\(\))"#
        
        do {
            let mulRegex = try NSRegularExpression(pattern: mulPattern)
            let controlRegex = try NSRegularExpression(pattern: controlPattern)
            
            let fileContents = try String(contentsOfFile: path, encoding: .utf8)
            
            // Parse mul() instructions
            var mulTuples: [(product: Int, instruction: String, position: Int)] = []
            let mulMatches = mulRegex.matches(in: fileContents, range: NSRange(fileContents.startIndex..., in: fileContents))
            for match in mulMatches {
                if let range = Range(match.range, in: fileContents),
                   let range1 = Range(match.range(at: 1), in: fileContents),
                   let range2 = Range(match.range(at: 2), in: fileContents),
                   let num1 = Int(fileContents[range1]),
                   let num2 = Int(fileContents[range2]) {
                    let product = num1 * num2
                    let instruction = String(fileContents[range])
                    let position = fileContents.distance(from: fileContents.startIndex, to: range.lowerBound)
                    mulTuples.append((product: product, instruction: instruction, position: position))
                }
            }
            
            // Parse control instructions (do() and don't())
            var controlStates: [(isEnabled: Bool, position: Int)] = []
            let controlMatches = controlRegex.matches(in: fileContents, range: NSRange(fileContents.startIndex..., in: fileContents))
            for match in controlMatches {
                if let range = Range(match.range, in: fileContents) {
                    let control = String(fileContents[range])
                    let position = fileContents.distance(from: fileContents.startIndex, to: range.lowerBound)
                    controlStates.append((isEnabled: control == "do()", position: position))
                }
            }
            
            // Determine the enabled state for each mul() instruction
            var totalSum = 0
            for mul in mulTuples {
                // Find the most recent control state before the mul position
                let applicableControl = controlStates.last { $0.position <= mul.position }
                if applicableControl?.isEnabled ?? true { // Enabled by default
                    totalSum += mul.product
                    print("\(mul.instruction) = \(mul.product) (enabled)")
                } else {
                    print("\(mul.instruction) = \(mul.product) (disabled)")
                }
            }
            
            // Print the total sum
            print("Total Sum of Enabled Products: \(totalSum)")
        } catch {
            print("Error reading file at \(path): \(error)")
            exit(1)
        }
    }
}
