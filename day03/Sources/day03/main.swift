import Darwin

let maxBitCount = 32
var numbers: [Int32] = []
while let line = readLine() {
    numbers.append(Int32(line, radix: 2)!)
}

// The maximum index of set bits
var bitCount = Int(numbers.lazy.map(fls).max()!)

func bitSetCount(in numbers: [Int32], atIndex i: Int) -> Int {
    let mask: Int32 = 1 << i
    return numbers.reduce(into: 0) { count, n in
        if n & mask != 0 {
            count += 1
        }
    }
}

// Part 1
var gamma: Int32 = 0
var epsilon: Int32 = 0
for i in 0..<bitCount {
    if bitSetCount(in: numbers, atIndex: i) * 2 >= numbers.count {
        gamma += (1 << i)
    } else {
        epsilon += (1 << i)
    }
}
print(gamma * epsilon)

// Part 2
let oxygen: Int32 = {
    var numbers = numbers
    for i in (0..<bitCount).reversed() {
        let mask: Int32 = 1 << i
        if bitSetCount(in: numbers, atIndex: i) * 2 >= numbers.count {
            numbers = numbers.filter { $0 & mask != 0 }
        } else {
            numbers = numbers.filter { $0 & mask == 0 }
        }
        if numbers.count == 1 {
            return numbers[0]
        }
    }
    return 0
}()

let co2: Int32 = {
    var numbers = numbers
    for i in (0..<bitCount).reversed() {
        let mask: Int32 = 1 << i
        if bitSetCount(in: numbers, atIndex: i) * 2 >= numbers.count {
            numbers = numbers.filter { $0 & mask == 0 }
        } else {
            numbers = numbers.filter { $0 & mask != 0 }
        }
        if numbers.count == 1 {
            return numbers[0]
        }
    }
    return 0
}()

print(oxygen * co2)
