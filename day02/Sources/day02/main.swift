var position = 0
var depth = 0

enum Command: String {
    case forward
    case down
    case up
}

while let line = readLine() {
    let spaceIndex = line.firstIndex(of: " ")!
    let command = Command(rawValue: String(line.prefix(upTo: spaceIndex)))!
    
    let amountIndex = line.index(after: spaceIndex)
    let amount = Int(line.suffix(from: amountIndex))!
    
    switch command {
    case .forward:
        position += amount
    case .down:
        depth += amount
    case .up:
        depth -= amount
    }
}

print(position * depth)
