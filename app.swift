class Forca {
  var word: String
  var wordTip: String

  let wordsAndTips: [Int: [String]] = [
    0: ["CAMISA", "Peça de roupa"],
    1: ["BANANA", "Fruta"],
    2: ["VIOLINO", "Instrumento musical"],
    3: ["GELADEIRA", "Eletrodoméstico"],
    // Add more words here
  ]

  init() {
    let index = Int.random(in: 0..<wordsAndTips.count)

    self.word = wordsAndTips[index]![0] // index 0 - word - "BANANA"
    self.wordTip = wordsAndTips[index]![1] // index 1 - tip - "Fruta"
  }

  func runGame() {
    var usedLetters = Array<Character>() // array with the already used letters
    var attempts = 10
    var spaces = self.generateSpaces() // generate a spaces string - "______"

    while(attempts >= 1) {
      print("\nTentativas restantes: \(attempts) - Dica: \(self.wordTip): \(spaces)")
      print("Digite uma letra: ")

      if let letter = readLine() {
        let character = Character(letter.uppercased())

        if (usedLetters.contains(character)) {
          print("Essa letra já foi usada.")
          continue
        }

        usedLetters.append(character)

        if(self.word.contains(character)) {
          spaces = insertLetter(spaces: spaces, letter: character)

          if(!spaces.contains("_")) {
            print("\n\(self.word) - Você ganhou!")
            break
          }
        }

        attempts-=1

        if(attempts == 0) {
          print("\nVocê perdeu. :(")
        }
      } else {
        print("Tente inserir uma letra novamente")
      }
    }
  }

  private func insertLetter(spaces: String, letter: Character) -> String {
    let wordToArray = Array(self.word) // Convert the word string to array - ["B", "A", "N", "A", "N", "A"]
    var spacesToArray = Array(spaces) // Convert the spaces string to array - ["_", "_", "N", "_", "N", "_"]

    for i in 0..<wordToArray.count {
      if (wordToArray[i] == letter) {
        spacesToArray[i] = letter
      }
    }

    return String(spacesToArray)
  }

  private func generateSpaces() -> String {
    var spaces = ""
    let wordLength = self.word.count
    
    for _ in 0..<wordLength {
      spaces+="_"
    }

    return spaces
  }
}

let game = Forca()
game.runGame()