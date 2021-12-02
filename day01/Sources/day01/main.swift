var numbers: [Int] = []
while let line = readLine() {
    numbers.append(Int(line)!)
}
print(zip(numbers, numbers.dropFirst()).lazy.filter { $0 < $1 }.count)
