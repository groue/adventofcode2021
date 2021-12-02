import Algorithms

var numbers: [Int] = []
while let line = readLine() {
    numbers.append(Int(line)!)
}

// Part 1
let largerMeasurementCount = zip(numbers, numbers.dropFirst()).lazy
    .filter { $0 < $1 }
    .count
print(largerMeasurementCount)

// Part 2
let triples = numbers.windows(ofCount: 3).map { $0.reduce(0, +) }
let largerTripleCount = zip(triples, triples.dropFirst()).lazy
    .filter { $0 < $1 }
    .count
print(largerTripleCount)
