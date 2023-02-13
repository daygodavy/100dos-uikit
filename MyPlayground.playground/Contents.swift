import UIKit
/// - parameter llamaCount: The number of llamas in the managed herd.
/// - param llamaCount
/// - bug llamaCount:
///
/// - parameter llama

// 100 DAYS OF SWIFT: DAY 1 ==============================================================================================================================

// Swift is what’s known as a type-safe language, which means that every variable must be of one specific type
var str = "Hello, playground"
str = "Goodbye"

var age = 38

// If you have large numbers, Swift lets you use underscores as thousands separators – they don’t change the number, but they do make it easier to read
var population = 8_000_000

var str1 = """
This goes
over multiple
lines
"""

var str2 = """
This goes \
over multiple \
lines
"""

// type: <#Double#>
var pi = 3.141

// type: <#Boolean#>
var awesome = true

// <#String Interpolation#> – the ability to place variables inside your strings to make them more useful
var score = 85
var str3 = "Your score was \(score)"
var results = "The test results are here: \(str3)"

// <#Constants#> - values that can be set once and never again
let taylor = "swift"

// <#Type Inference#>: Swift is able to infer the type of something based on how you created it
// Type Annotation - explicitly assigning the type (opposed to relying on type inference)
let album: String = "Reputation"
let year: Int = 1989
let height: Double = 1.78
let taylorRocks: Bool = true

// 100 DAYS OF SWIFT: DAY 2 ==============================================================================================================================

// <#Arrays#>
// note: if you're using type annotations, arrays are written in brackets: [String], [Int], [Double], [Bool]
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"
let beatles = [john, paul, george, ringo]
beatles[1]

// <#Sets#> (similar to arrays except: items aren't stored in order and no item can appear twice in a set)
let colors = Set(["red", "green", "blue"])
let colors2 = Set(["red", "green", "blue", "red", "blue"])
// colors == colors2 since dupe values are ignored

// <#Tuples#> (allow you to store several values together in a single value
// 1) you can't add or remove items from a tuple; they are a fixed size
// 2) you can't change the type of items in a tuple; they always have the same types they were created with
// 3) you can access items in a tuple using numerical positions or by naming them, but Swift won't let you read numbers or names that don't exist
var name = (first: "Taylor", last: "Swift")
name.0
name.first

// <#Arrays vs Sets vs Tuples#>
// if you need a specific, fixed collection of related values where each item has a precise position or name; use a TUPLE
let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")
// if you need a collection of values that must be unique or you need to be able to check whether a specific item is in there extremely quickly; use a SET
let set = Set(["aardvark", "astronaut", "azalea"])
// if you need a collection of values that can contain dupplicates, or the order of your items matters; use an ARRAY
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]

// <#Dictionaries#> (collections of values like arrays, but can access them with anything you want rather than to integer position)
// note: when using type annotations, dictionaries are written in brackets with a colon between your identifier and value types: [String : Double], etc.
let heights = [
    "Taylor Swift" : 1.78,
    "Ed Sheeran" : 1.73
]
heights["Taylor Swift"]

// <#Dictionary default values#>
// if you try to read a value from a dictionary using a key that doesn't exist, Swift will send you back 'nil' - nothing at all
// alternative to nil: we can provide the dictionary with a default value to use if we request a missing key
let favoriteIceCream = [
    "Paul" : "Chocolate",
    "Sophie" : "Vanilla"
]
favoriteIceCream["Paul"]
favoriteIceCream["Charlotte"] // evaluates to nil
favoriteIceCream["Charlotte", default: "Unknown"] // evaluates to 'Unknown'

// <#Creating empty collections#>
var teams = [String: String]() // empty dict
teams["Paul"] = "Red"

var results1 = [Int]() // empty array

var words = Set<String>() // empty set
var numbers = Set<Int>()

var scores = Dictionary<String, Int>() // alternative empty dict
var results2 = Array<Int>() // alternative empty array

// <#Enumerations#> (enums - a way of defining groups of related values in a way that makes them easier to use)
let test1 = "failure"
let test2 = "failed"
let test3 = "fail"

enum Result {
    case success
    case failure
}

let test4 = Result.failure

// <#Enum associated values#>
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "football")

// <#Enum raw values#>
enum Planet: Int {
    case mercury
    case venus
    case earth
    case mars
}
// swift automatically assigns a value for each case
let earth = Planet(rawValue: 2)

// hard coding value assignment for the first case will generate the rest
enum Planet2: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

let earth2 = Planet2(rawValue: 3)

// 100 DAYS OF SWIFT: DAY 3 ==============================================================================================================================

// <#Arithmetic operators#>
let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore
let product = firstScore * secondScore
let divided = firstScore / secondScore
let remainder = 13 % secondScore

// <#Operator overloading#> - what an operator does depends on the values you use it with
// recall that Swift is type safe
let meaningOfLife = 42
let doubleMeaning = 42 + 42

let fakers = "Fakers gonna "
let action = fakers + "fake"

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles1 = firstHalf + secondHalf

// <#Compound assignemt operators#>
score = 95
score -= 5
var quote = "The rain in SPain falls mainly on the "
quote += "Spaniards"

// <#Comparison operators#>
let firstScore1 = 6
let secondScore1 = 4

firstScore1 == secondScore1
firstScore1 != secondScore1
firstScore1 < secondScore1
firstScore1 >= secondScore1

"Taylor" <= "Swift"

// <#Conditions#>
let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces A lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

// <#Combining conditions#>
let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("One of them are over 18")
}

// <#The ternary operator#>
print(firstCard == secondCard ? "Cards are the same" : "Cards are different")

if firstCard == secondCard {
    print("Cards are the same")
} else {
    print("Cards are different")
}

// <#Switch statements#>
let weather = "rain"

switch weather {
case "rain":
    print("Bring an umbrella")
    fallthrough // keyword that allows execution onto next case
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
default:
    print("Enjoy your day!")
}

// <#Range operators#>
// Swift gives us two ways of making ranges: the ..< and ... operators. The half-open range operator, ..<, creates ranges up to but excluding the final value, and the closed range operator, ..., creates ranges up to and including the final value.
// For example, the range 1..<5 contains the numbers 1, 2, 3, and 4, whereas the range 1...5 contains the numbers 1, 2, 3, 4, and 5.
score = 85
switch score{
case 0..<50:
    print("You failed badly")
case 50..<85:
    print("You did OK.")
default:
    print("You did great.")
}

// 100 DAYS OF SWIFT: DAY 4 ==============================================================================================================================

// <#For loops#>
// run some code repeatedly until a condition evaluates as false.
let count = 1...10

for number in count {
    print("Number is \(number)")
}

let albums = ["Red", "1989", "Reputation"]

for album in albums {
    print("\(album) is on Apple Music")
}

// if you don’t need the temporary constant that for loops give you, use an underscore instead so Swift can skip that work
for _ in 1...5 {
    print("play")
}

// <#While loops#>
// give it a condition to check, and its loop code will go around and around until the condition fails
var number = 1
while number <= 20 {
    print(number)
    number += 1
}
print("ready or not, here i come")

//<#Repeat loops#>
// identical to a while loop except the condition to check comes at the end
// thus the repeat loop will always execute at least once first

var number1 = 1
repeat {
    print(number)
    number += 1
} while number <= 20
            
print("ready or not, here i come")

while false {
    print("this is false")
}

repeat {
    print("this is false")
} while false

// <#Exiting loops#>
// you can exit a loop at any time using the break keyword
var countDown = 10
while countDown >= 0 {
    print(countDown)
    if countDown == 4 {
        print("i'm bored, let's go now!")
        break
    }
    countDown -= 1
}
print("blast off")

// <#Exiting multiple loops#>
// loop can be labeled and hence will use the label name to break from the outer loop
outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is \(product)")
        
        if product == 50 {
            print("bullseye!")
            break outerLoop
        }
    }
}

// <#Skipping items#>
// if you just want to skip the current item and continue on to the next one, you should use continue
for i in 1...10 {
    if i % 2 == 1 {
        continue
    }
    print(i)
}

// <#Infinite loops#>
var counter = 0

while true {
    print(" ")
    counter += 1
    if counter == 2 {
        break
    }
}


// 100 DAYS OF SWIFT: DAY 5 ==============================================================================================================================

// <#Writing functions#>
func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize themm all into thumbnails
"""
    print(message)
}

printHelp()

// <#Accepting parameters#>
print("Hello, world!")

func square(number: Int) {
    print(number * number)
}

square(number: 8)

// <#Returning values#>
func squareReturn(number: Int) -> Int {
    return number * number
}

print(squareReturn(number: 8))

// <#Parameter labels#>
func squareParam(number: Int) -> Int {
    return number * number
}

let resultSq = squareParam(number: 8)

// swift lets us provide two names for each parameter: one to be used externally when calling the function,
// and one to be used internally inside the function
func sayHello(to name: String) {
    print("Hello, \(name)!")
}

sayHello(to: "Taylor")


// <#Omitting parameters labels#>
// use underscore, '_', in func parameter to omit parameter name when calling the function
func greet(_ person: String) {
    print("Hello, \(person)")
}

greet("Taylor")

// <#Default parameters#>
// you can give your own parameters a default value just by writing an = after its type followed by the default you want to give it
func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

greet("Taylor")
greet("Taylor", nicely: false)

// <#Variadic functions#>
// you can make any parameter variadic by writing ... after its type
print("Haters", "gonna", "hate")

// an Int parameter is a single integer, whereas Int... is zero or more integers – potentially hundreds
func squareV(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

// swift converts the values that were passed in to an array of integers
squareV(numbers: 1, 2, 3, 4, 5)

// <#Writing throwing functions#>
// sometimes functions fail because they have bad input, or because something went wrong internally
enum PasswordError: Error {
    case obvious
}

// swift lets us throw errors from functions by marking them as throws before their return type, then using the throw keyword when something goes wrong
func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    
    return true
}

// <#Running throwing functions#>
//  do starts a section of code that might cause problems, try is used before every function that might throw an error, and catch lets you handle errors gracefully
do {
    try checkPassword("password")
    print("That password is good")
} catch {
    print("You can't use that password")
}

// <#inout parameters#>
// all parameters passed into a Swift function are constants, so you can’t change them
// you can pass in one or more parameters as inout, which means they can be changed inside your function, and those changes reflect in the original value outside the function
func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
// you also need to pass the parameter to doubleInPlace using an ampersand, &, before its name, which is an explicit recognition that you’re aware it is being used as inout
doubleInPlace(number: &myNum)

// 100 DAYS OF SWIFT: DAY 6/7 ==============================================================================================================================

// <#Accepting parameters in a closure#>
// to make a closure accept parameters, list them inside parentheses just after the opening brace, then write in so that Swift knows the main body of the closure is starting
let driving = { (place: String) in
    print("I'm going to \(place) in my car")
}

// one of the differences between functions and closures is that you don’t use parameter labels when running closures
driving("London")

// <#Returning values from a closure#>
// you write them inside your closure, directly before the in keyword
let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

print(drivingWithReturn("Paris"))

// <#Closures as parameters#>
let drive = {
    print("I'm driving in my car")
}
// if we wanted to pass that closure into a function so it can be run inside that function, we would specify the parameter type as () -> Void
// that means “accepts no parameters, and returns Void”
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel(action: drive)

// <#Trailing closure syntax#>
// if the last parameter of a function is a closure, swift allows special syntax called trailing closure syntax
// rather than pass in your closer as a parameter, pass it directly after the function inside braces
travel() {
    print("I'm driving in my car")
}
// parentheses not necessary if the closure is the only parameter
travel { print("I'm driving in my car") }

// <#Using closures as parameters when they accept parameters#>
// you can explicitly specify the type of closure that is passed into the function
func traveling(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

traveling { (place: String) in
    print("I'm going to \(place) in my car")
}

// <#Using closure as parameters when they return values#>
// you can force the closure to return a value of any data type by explicitly specifying in the parameter
func travelingReturn(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travelingReturn { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

// <#Shorthand parameter names#>
func travelingShort(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

// swift knows parameter accepted is string, the return value is a string and that a value must be returned with only one line of code
// 'place in' can also be shorthanded as swift can provide automatic names for the closure's parameters represented by '$' and number counting from 0
travelingShort {
    return "I'm going to \($0) in my car"
}

// <#Closures with multiple parameters#>
func travelingMulti(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

travelingMulti {
    "I'm going to \($0) at \($1)mph"
}

// <#Returning closures from functions#>
// uses -> twice: once to specify your function’s return value, and a second time to specify your closure’s return value
func travelReturnClosure() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let res = travelReturnClosure()
res("London")
// doable alternative but not recommended:
let res2 = travelReturnClosure()("London")

// <#Capturing values#>
// if you use any external values inside your closure, Swift captures them – stores them alongside the closure, so they can be modified even if they don’t exist any more
// closure capturing happens if we create values in travel() that get used inside the closure
func travelCapture() -> (String) -> Void {
    var counter = 1
    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}
// even though that counter variable was created inside travel(), it gets captured by the closure so it will still remain alive for that closure
let res3 = travelCapture()
res3("London")
res3("London")
res3("London")

// 100 DAYS OF SWIFT: DAY 8/9 ==============================================================================================================================

// <#Creating your own structs#>
// structs can be given their own variables and constants, and their own functions, then created and used however you want
struct Sport {
    var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)
tennis.name = "Lawn tennis"
print(tennis.name)

// <#Computed properties#>
// computed property – a property that runs code to figure out its value
struct Sport2 {
    // stored
    var name: String
    var isOlympicSport: Bool
    
    // computed
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = Sport2(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

// <#Property observers#>
// property observers let you run code before or after any property changes
struct Progress {
    var task: String
    
    // print a message every time amount changes, and we can use a didSet property observer for that
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

// <#Methods#> - functions inside of structs
struct City {
    var population: Int
    
    func collectTaxes() -> Int {
        return population * 1000
    }
}

let london = City(population: 9_000_000)
print(london.collectTaxes())

// <#Mutating methods#>
// swift won’t let you write methods that change properties unless you specifically request it
struct Person {
    var name: String
    // when you want to change a property inside a method, you need to mark it using the mutating keyword
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Ed")
person.makeAnonymous()
print(person.name)

// <#Properties and methods of strings#>
let string = "Do or do not, there is no try."
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())

// <#Properties and methods of arrays#>
var toys = ["Woody"]
print(toys.count)
toys.append("Buzz")
toys.firstIndex(of: "Buzz")
print(toys.sorted())
toys.remove(at: 0)

// <#Initializers#>
struct User {
    var username: String
    // make sure all properties have a value before the initializer ends
    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

var user = User()
user.username = "twostraws"


// <#Referring to the current instance#>
// inside methods you get a special constant called self, which points to whatever instance of the struct is currently being used
struct SelfPerson {
    var name: String
    // self value is particularly useful when you create initializers that have the same parameter names as your property
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

// <#Lazy properties#> - a performance optimization, Swift lets you create some properties only when they are needed
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct FamilyPerson {
    var name: String
    // if we add the lazy keyword to the familyTree property, then Swift will only create the FamilyTree struct when it’s first accessed
    lazy var familyTree = FamilyTree()
    init(name: String) {
        self.name = name
    }
}

var ed = FamilyPerson(name: "Ed")
// if you want to see the “Creating family tree!” message, you need to access the property at least once:
ed.familyTree

// <#Static properties and methods#> - to share specific properties and methods across all instances of the struct by declaring them as static
struct Student {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let ed1 = Student(name: "Ed")
let taylor1 = Student(name: "Taylor")
// because the classSize property belongs to the struct itself rather than instances of the struct, we need to read it using Student.classSize
print(Student.classSize)


// <#Access control#> - lets you restrict which code can use properties and methods
// important because it prohibits people from reading a property directly
struct PersonAccess {
    // public variable can be read from anywhere in code
    // private variable cannot be read from outside the struct
    private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func identity() -> String {
        return "My SSN is \(id)"
    }
}

let ed2 = PersonAccess(id: "12345")

// 100 DAYS OF SWIFT: DAY 10 ==============================================================================================================================

// <#Creating your own classes#>
// Classes vs Structs (1) - classes never come with a memberwise initializer
class Pup {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

let poppy = Pup(name: "Poppy", breed: "Poodle")

// <#Class inheritance#>
// Classes vs Structs (2) - you can create a class based on an existing class, it inherits all the properties and methods of the original class, and can add its own on top
class Poodle: Pup {
    init(name: String) {
        // for safety reasons, Swift always makes you call super.init() from child classes – just in case the parent class does some important work when it’s created
        super.init(name: name, breed: "Poodle")
    }
}

// <#Overriding methods#>
class Doggy {
    func makeNoise() {
        print("Woof!")
    }
}

class Husky: Doggy {
    override func makeNoise() {
        print("Yip!")
    }
}

let husker = Husky()
husker.makeNoise()

// <#Final classes#> - when you declare a class as being final, no other class can inherit from it
// they can’t override your methods in order to change your behavior – they need to use your class the way it was written
final class Pups {
    var name: String
    var breed: String
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

// <#Copying objects#>
// Classes vs Structs (3) - When you copy a struct, both the original and the copy are different things – changing one won’t change the other. When you copy a class, both the original and the copy point to the same thing, so changing one does change the other.
class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"

print(singer.name)
// if struct, singer.name would still print "Taylor Swift"
print(singerCopy.name)

// <#Deinitializers#>
// Classes vs Structs (4) - classes can have deinitializers; code that gets run when an instance of a class is destroyed
class Person1 {
    var name = "John Doe"
    
    init() {
        print("\(name) is alive!")
    }
    
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }
}

// instance is destroyed after each loop and hence 'deinit' is triggered in the class
for _ in 1...3 {
    let person = Person1()
    person.printGreeting()
}

// <#Mutability#>
// Classes vs Structs (5) - the way they deal with constants
// if you have a constant struct with a variable property, that property can’t be changed because the struct itself is constant
// if you have a constant class with a variable property, that property can be changed. Because of this, classes don’t need the mutating keyword with methods that change properties; that’s only needed with structs
class Artist {
    var name = "Taylor Swift"
}

let taylor2 = Artist()
// to stop this from happening you must make the class variable a constant (replace 'var' with 'let')
taylor2.name = "Ed Sheeran"
print(taylor2.name)

// 100 DAYS OF SWIFT: DAY 11 ==============================================================================================================================


// <#Protocols#> - a way of describing what properties and methods something must have
// You then tell Swift which types use that protocol – a process known as adopting or conforming to a protocol
protocol Identifiable {
    var id: String { get set }
}

struct User1: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

var temp = User1(id: "12345")
displayID(thing: temp)

// <#Protocol Inheritance#> - one protocol can inherit from another
// Unlike with classes, you can inherit from multiple protocols at the same time before you add your own customizations on top.
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

// Now we can make new types conform to that single protocol rather than each of the three individual ones.
protocol Employee: Payable, NeedsTraining, HasVacation { }

// <#Extensions#> - allow you to add methods to existing types, to make them do things they weren't originally designed to do
extension Int {
    func squared() -> Int {
        return self * self
    }
}
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

let num = 8
print(num.squared())
print(num.isEven)

// <#Protocol extensions#>
let pythonsband = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatlesband = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        for name in self {
            print(name)
        }
    }
}

// both array and set now have the method summarize()
pythonsband.summarize()
beatlesband.summarize()

// <#Protocol-oriented programming#>
protocol Identifiable1 {
    var id: String { get set }
    func identity()
}

extension Identifiable1 {
    func identity() {
        print("My ID is \(id).")
    }
}

struct User2: Identifiable1 {
    var id: String
}

let twostraws = User2(id: "twostraws")
twostraws.identity()

// 100 DAYS OF SWIFT: DAY 12 ==============================================================================================================================

// <#Handling missing data#> - optionals: '?'
// optionals can either contain a particular data type or nil
var ages: Int? = nil
ages = 38

// <#Unwrapping options#> - we must look inside the optional and see what’s there to safely access the var
// A common way of unwrapping is with if let syntax
var names: String? = nil
if let unwrapped = names {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}

// <#Unwrapping with guard#>
// the major difference between if let and guard let is that your unwrapped optional remains usable after the guard code
// Using guard let lets you deal with problems at the start of your functions, then exit immediately. This means the rest of your function is the happy path – the path your code takes if everything is correct
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }
    // Because optionals unwrapped using guard let stay around after the guard finishes, we can print the unwrapped string at the end of the function
    print("Hello, \(unwrapped)!")
}

var greetName: String? = nil
greet(greetName)

// <#Force unwrapping#> - forcibly convert it from an optional type to a non-optional type (only when it's safe)
// Even though Swift isn’t sure the conversion will work, you can see the code is safe so you can force unwrap the result by writing ! after
let str0 = "5"
let num0 = Int(str0) // Int?
let num01 = Int(str0)! // Int

// <#Implicitly unwrapped optionals#> - unlike regular optionals you don’t need to unwrap them in order to use them: you can use them as if they weren’t optional
// you don’t need if let or guard let to use implicitly unwrapped optionals; however if they are used with no value then the code will crash
// Implicitly unwrapped optionals exist because sometimes a variable will start life as nil, but will always have a value before you need to use it
let age0: Int! = nil

// <#Nil coalescing#> - unwraps an optional and returns the value inside if there is one
// if there isn’t a value – if the optional was nil – then a default value is used instead
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user0 = username(for: 15) ?? "Anonymous"
print(user0)

// <#Optional chaining#>
let bNames = ["John", "Paul", "George", "Ringo"]
// That question mark is optional chaining – if first returns nil then Swift won’t try to uppercase it, and will set bBeatle to nil immediately.
let bBeatles = bNames.first?.uppercased()
print(bBeatles ?? "")

// <#Optional try#>
// 1) try? - changes throwing functions into functions that return an optional. If the function throws an error you’ll be sent nil as the result, otherwise you’ll get the return value wrapped as an optional.
if let resultTry = try? checkPassword("password") {
    print("Result was \(resultTry)")
} else {
    print("D'oh.")
}

// 2) try! - which you can use when you know for sure that the function will not fail. If the function does throw an error, your code will crash.
try! checkPassword("sekrit")
print("OK!")

// <#Failable initializers#> - an initializer that might work or might not
// You can write these in your own structs and classes by using init?() rather than init(), and return nil if something goes wrong.
struct FailablePerson {
    var id: String
    // The return value will then be an optional of your type, for you to unwrap however you want.
    init?(id: String) {
        // As an example, we could code a Person struct that must be created using a nine-letter ID string
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

// <#Typecasting#>
// Swift can see both Fish and Dog inherit from the Animal class, so it uses type inference to make pets an array of Animal
class Animal { }
class Fish: Animal { }

class Dogo: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dogo(), Fish(), Dogo()]
// If we want to loop over the pets array and ask all the dogs to bark, we need to perform a typecast: Swift will check to see whether each pet is a Dog object
for pet in pets {
    // as?, which returns an optional: it will be nil if the typecast failed, or a converted type otherwise
    if let dogo = pet as? Dogo {
        dogo.makeNoise()
    }
}
