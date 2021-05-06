var game = Forca()

while(game.attempts >= 1) {
  print("\nTentativas restantes: \(game.attempts) - Dica: \(game.wordTip): \(String(game.spaces))")
  print("Digite uma letra: ")

  let letter = Character(readLine()!.uppercased())
  game.play(letter: letter)


  if (game.finished() && game.attempts > 1) {
    print("\nVocê ganhou! - \(game.word)")
    break
  } else if (game.attempts < 1) {
    print("\nVocê perdeu. :(")
  }
}