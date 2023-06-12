import GameplayKit
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

// Generating random number with GameplayKit -> ranging between -2,147,483,648 and 2,147,483,647
print(GKRandomSource.sharedRandom().nextInt())

// GameplayKit method that works identical to arc4random() -> ranging between 0 and 5
print(GKRandomSource.sharedRandom().nextInt(upperBound: 6))

// GKLinearCongruentialRandomSource: has high performance but the lowest randomness
let linearCongruential = GKLinearCongruentialRandomSource()
linearCongruential.nextInt(upperBound: 20)

// GKARC4RandomSource: has good performance and good randomness – in the words of Apple, "it's going to be your Goldilocks random source."
let arc4 = GKARC4RandomSource()
arc4.nextInt(upperBound: 20)

// GKMersenneTwisterRandomSource: has high randomness but the lowest performance
let mersenne = GKMersenneTwisterRandomSource()
mersenne.nextInt(upperBound: 20)

// Apple recommends you force flush its ARC4 random number generator before using it for anything important, otherwise it will generate sequences that can be guessed to begin with
arc4.dropValues(1024)


// GameplayKit means you can create the random distribution as a property then re-use it again and again without having to specify the range each time
let d6 = GKRandomDistribution.d6()
d6.nextInt()

let d20 = GKRandomDistribution.d20()
d20.nextInt()

let crazy = GKRandomDistribution(lowestValue: 1, highestValue: 11539)
crazy.nextInt()


// If you intend to specify lowest and highest values, you need to be careful if you intend also to use nextInt(upperBound:) – code like this will crash your app:
//let distribution = GKRandomDistribution(lowestValue: 10, highestValue: 20)
//print(distribution.nextInt(upperBound: 9))

let rand = GKMersenneTwisterRandomSource()
let distribution = GKRandomDistribution(randomSource: rand, lowestValue: 10, highestValue: 20)
print(distribution.nextInt())

// GKShuffledDistribution: anti-clustering distribution, which means it shapes the distribution of random numbers so that you are less likely to get repeats
let shuffled = GKShuffledDistribution.d6()
print(shuffled.nextInt())
print(shuffled.nextInt())
print(shuffled.nextInt())
print(shuffled.nextInt())
print(shuffled.nextInt())
print(shuffled.nextInt())


// GKGaussianDistribution: causes the random numbers to bias towards the mean average of the range
let gaussian = GKGaussianDistribution.d6()
print(gaussian.nextInt())
print(gaussian.nextInt())
print(gaussian.nextInt())
print(gaussian.nextInt())
print(gaussian.nextInt())
print(gaussian.nextInt())


// arrayByShufflingObjects(in:) alternative which shuffles in place rather returning new array
extension Array {
    mutating func shuffle() {
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            swapAt(i, j)
        }
    }
}


// completely random.. non-deterministic
let lotteryBalls = [Int](1...49)
let shuffledBalls = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: lotteryBalls)
print(shuffledBalls[0])
print(shuffledBalls[1])
print(shuffledBalls[2])
print(shuffledBalls[3])
print(shuffledBalls[4])
print(shuffledBalls[5])


// predictably random.. with seed
let fixedLotteryBalls = [Int](1...49)
let fixedShuffledBalls = GKMersenneTwisterRandomSource(seed: 1001).arrayByShufflingObjects(in: fixedLotteryBalls)
print(fixedShuffledBalls[0])
print(fixedShuffledBalls[1])
print(fixedShuffledBalls[2])
print(fixedShuffledBalls[3])
print(fixedShuffledBalls[4])
print(fixedShuffledBalls[5])


