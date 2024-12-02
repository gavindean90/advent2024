import Foundation

enum Day2 {
    static func run(filePath: String?) {
        // Example logic for Day 2
        let path = filePath ?? "site_ids.txt"
        do {
            let fileContents = try String(contentsOfFile: path, encoding: .utf8)
            print("Day 2 File Contents:\n\(fileContents)")
        } catch {
            print("Error reading file at \(path): \(error)")
            exit(1)
        }
    }
}
