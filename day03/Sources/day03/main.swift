import Darwin

let maxBitCount = 32
var bitSetCounts: [Int] = .init(repeating: 0, count: maxBitCount)
var bitCount: Int = 0
var lineCount = 0
while let line = readLine() {
    let n = Int32(line, radix: 2)!
    bitCount = max(bitCount, Int(fls(n)))
    for i in 0..<maxBitCount {
        if n & (1 << i) != 0 {
            bitSetCounts[i] += 1
        }
    }
    lineCount += 1
}

var gamma: Int32 = 0
var epsilon: Int32 = 0
for i in 0..<bitCount {
    if bitSetCounts[i] * 2 >= lineCount {
        gamma += (1 << i)
    } else {
        epsilon += (1 << i)
    }
}
print(gamma * epsilon)
