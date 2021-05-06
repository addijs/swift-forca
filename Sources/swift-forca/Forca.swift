class Forca {
  var word: String = ""
  var wordTip: String = ""
  var usedLetters: [Character] = Array<Character>() // array with the already used letters
  var attempts: Int = 0
  var spaces: [Character] = Array<Character>() // a spaces string - "______"

  let wordsAndTips: [Int: [String]] = [
    0: ["CAMISA", "Peça de roupa"],
    1: ["BANANA", "Fruta"],
    2: ["VIOLINO", "Instrumento musical"],
    3: ["GELADEIRA", "Eletrodoméstico"],
    // Add more words here
  ]

  init() {
    self.startGame()
  }

  func startGame() {
    let index = Int.random(in: 0..<wordsAndTips.count)

    let word = wordsAndTips[index]![0] // index 0 - word - "BANANA"
    let tip = wordsAndTips[index]![1] // index 1 - tip - "Fruta"

    self.word = word 
    self.wordTip = tip 
    self.usedLetters = Array<Character>()
    self.attempts = 10
    self.spaces = Array(repeating: "_", count: word.count) // the spaces array - ["_", "_", "_", "_", "_", "_"]
  }

  func play(letter: Character) {
    if (self.attemptIsValid(letter: letter)) {
      self.usedLetters.append(letter)
      insertLetter(letter: letter)
    } else {
      self.attempts-=1
    }
  }

  func finished() -> Bool {
    return self.attempts < 1 || !self.spaces.contains("_")
  }

  private func attemptIsValid(letter: Character) -> Bool {
    return !self.usedLetters.contains(letter) && self.word.contains(letter)
  }

  private func insertLetter(letter: Character) {
    let wordToArray = Array(self.word) // Convert the word string to array - ["B", "A", "N", "A", "N", "A"]

    for i in 0..<wordToArray.count {
      if (wordToArray[i] == letter) {
        self.spaces[i] = letter
      }
    }
  }

  // private func generateSpaces(word: String) -> String {
  //   var spaces = ""
  //   let wordLength = word.count
    
  //   for _ in 0..<wordLength {
  //     spaces+="_"
  //   }

  //   return spaces
  // }
}