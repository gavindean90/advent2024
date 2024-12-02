# Advent2024

Welcome to **Advent2024**, a Swift-based solution for [Advent of Code 2024](https://adventofcode.com/2024). This project implements modular solutions for each day's challenges, focusing on clarity and readability.

---

## Table of Contents

- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Running the Project](#running-the-project)
- [Development and Debugging](#development-and-debugging)
- [Features](#features)
- [License](#license)

---

## Project Structure

Here’s an overview of the directory layout:

```
.
├── site_ids.txt              # Input file (not included in the repo)
├── .vscode/                  # VS Code configuration files
│   ├── settings.json
│   ├── launch.json
│   ├── tasks.json
├── advent2024/               # Swift package containing the main logic
│   ├── Package.swift         # Swift package definition
│   ├── Sources/              # Source files for the project
│   │   ├── main.swift        # CLI entry point
│   │   ├── Day1.swift        # Logic for Day 1
│   │   ├── Day2.swift        # Logic for Day 2
├── Readme.md                 # Project documentation
```

---

## Getting Started

### Prerequisites

- **Swift**: I am using Swift 7 but I think most things that allow CLI development can work. Ensure you have Swift installed. Check with:
  ```bash
  swift --version
  ```

- **VS Code (Optional)**: Recommended for streamlined development and debugging.

### Cloning the Repository

Clone the repository to your local machine:
```bash
git clone https://github.com/yourusername/advent2024.git
cd advent2024
```

### Building the Project

Navigate to the `advent2024/` directory and build the Swift package:
```bash
cd advent2024
swift build
```

---

## Running the Project

Use the command-line interface to run solutions for specific days. Note that `site_ids.txt` is **not included** in the repository; create or provide your own input file.

### Example Commands

1. **Run Day 1 with the default input file**:
   ```bash
   swift run advent2024 --day 1
   ```

2. **Run Day 1 with a custom input file**:
   ```bash
   swift run advent2024 --day 1 --file ../site_ids.txt
   ```

3. **Run Day 2**:
   ```bash
   swift run advent2024 --day 2
   ```

---

## Development and Debugging

### Debugging with VS Code

This project includes pre-configured VS Code settings for debugging:

1. Open the project in VS Code:
   ```bash
   code .
   ```

2. Select a debugging configuration from the **Run and Debug** panel:
   - `Debug advent2024 Day 1`
   - `Debug advent2024 Day 2`

3. Press **F5** to start debugging.

### Adding a New Day

To add a solution for a new day:

1. Create a new file in `advent2024/Sources/` (e.g., `Day3.swift`).
2. Implement the logic for the day in a function like `Day3.run()`.
3. Update `main.swift` to dispatch the new day:
   ```swift
   case 3:
       Day3.run(filePath: filePath)
   ```

4. Test it:
   ```bash
   swift run advent2024 --day 3
   ```

---

## Features

- **Readable Solutions**: Prioritizes clarity and maintainability over raw optimization.
- **Dynamic Input Handling**: Use the `--file` argument to specify custom input files.
- **VS Code Integration**: Pre-configured settings for debugging and building.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

### Important Notes

1. **No Contributions**:
   - This is a personal project, and external contributions are not accepted.

2. **Input Files**:
   - The `site_ids.txt` file is not included in the repository.
   - You must create or use your own input file when running the project.

---
