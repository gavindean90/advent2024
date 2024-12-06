import Foundation

func parseArguments() -> (Int, String?) {
    guard CommandLine.arguments.count >= 2 else {
        print("Usage: advent2024 --day <day_number> [--file <file_path>]")
        exit(1)
    }
    
    let args = CommandLine.arguments
    guard args[1] == "--day", let day = Int(args[2]) else {
        print("Error: Unknown or invalid arguments. Use '--day <day_number>'.")
        exit(1)
    }
    
    var filePath: String? = nil
    if args.count > 3, args[3] == "--file", args.count > 4 {
        filePath = args[4]
    }
    
    return (day, filePath)
}

let (day, filePath) = parseArguments()

switch day {
case 1:
    Day1.run(filePath: filePath)
case 2:
    Day2.run(filePath: filePath)
case 3:
    Day3.run(filePath: filePath)
case 4:
    Day4.run(filePath: filePath)
default:
    print("Error: Day \(day) is not implemented yet.")
    exit(1)
}
