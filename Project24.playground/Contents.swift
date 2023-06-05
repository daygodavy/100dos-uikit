import UIKit

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
    
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
    
    func deletingSuffix(_ suffix: String) -> String {
        guard self.hasSuffix(suffix) else { return self }
        return String(self.dropLast(suffix.count))
    }
    
    var capitalizedFirst: String {
        guard let firstLetter = self.first else { return "" }
        return firstLetter.uppercased() + self.dropFirst()
    }
    
    func containsAny(of array: [String]) -> Bool {
        for item in array {
            if self.contains(item) {
                return true
            }
        }
        return false
    }
    
    // challenge 1:
    func withPrefix(_ prefix: String) -> String {
        guard !self.hasPrefix(prefix) else { return self }
        return prefix + String(self)
    }
}

// extension to subscript string
let name = "Taylor"

for letter in name {
    print("Give me a \(letter)!")
}

let letter = name[name.index(name.startIndex, offsetBy: 3)]

let letter2 = name[3]

// extension to delete prefix/suffix of string
let password = "12345"
password.hasPrefix("123")
password.hasSuffix("456")

password.deletingPrefix("1")
password.deletingSuffix("45")


// extension to capitalize first letter of string
let weather = "it's going to rain"
weather.capitalizedFirst
weather.capitalized

// extension to check whether any string in list exists in input string
let input = "Swift is like Obj-C without the C"
input.contains("Swift")

let languages = ["Python", "Ruby", "Swift"]
languages.contains("Swift")

input.containsAny(of: languages)

// input.contains("Python") -> input.contains("Ruby") -> input.contains("Swift) -> true
languages.contains(where: input.contains)

// NSAttributedString: plain text string with dictionary of attributes applied to it
// NSMutableAttributedString: NSAttributedString that can be modified
let string = "This is a test string"

let attributes: [NSAttributedString.Key: Any] = [
    .foregroundColor: UIColor.white,
    .backgroundColor: UIColor.red,
    .font: UIFont.boldSystemFont(ofSize: 36)]

let attributedString = NSAttributedString(string: string, attributes: attributes)

let attributedString2 = NSMutableAttributedString(string: string)
attributedString2.addAttribute(.font, value: UIFont.systemFont(ofSize: 8), range: NSRange(location: 0, length: 4))
attributedString2.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSRange(location: 5, length: 2))
attributedString2.addAttribute(.font, value: UIFont.systemFont(ofSize: 24), range: NSRange(location: 8, length: 1))
attributedString2.addAttribute(.font, value: UIFont.systemFont(ofSize: 32), range: NSRange(location: 10, length: 4))
attributedString2.addAttribute(.font, value: UIFont.systemFont(ofSize: 40), range: NSRange(location: 15, length: 6))

// challenge 1: create withPrefix() -> "pet".withPrefix("car") == "carpet"
let challengeString1 = "pet"
challengeString1.withPrefix("car")

// challenge 2: create isNumeric() -> returns true if string holds any sort of number


// challenge 3: create String extension that adds a lines property that returns an array of all the lines in a string
// "this\nis\na\ntest" -> should return an array with four elements
