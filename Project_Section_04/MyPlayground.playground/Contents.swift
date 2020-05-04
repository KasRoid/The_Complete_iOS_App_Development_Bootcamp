
// This is a comment

var numbers = [45, 74, 195, 53]
var computedNumbers = [numbers[0] * numbers[1], numbers[1] * numbers[2], numbers[2] * numbers[3]]

print(computedNumbers)


let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

//The number of letters in alphabet equals 26

var password: String = ""

for _ in 1...6 {
    let rdmAlpahbet = Int.random(in: 0...25)
    password += alphabet[rdmAlpahbet]
}


print(password)
