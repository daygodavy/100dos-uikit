import UIKit

let int1 = Int.random(in: 0...10)
let int2 = Int.random(in: 0..<10)
let double1 = Double.random(in: 1000...10000)
let float1 = Float.random(in: -100...100)

// old method of randomness
print(arc4random())
print(arc4random())
print(arc4random())
print(arc4random())

// problematic method for generating random numbers in a range (modulo bias)
print(arc4random() % 6)

// better method for generating random numbers in a range
print(arc4random_uniform(6))

// old method alternative to Int.random()
func RandomInt(min: Int, max: Int) -> Int {
    if max < min { return min }
    return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
}

print(RandomInt(min: -10, max: 20))



