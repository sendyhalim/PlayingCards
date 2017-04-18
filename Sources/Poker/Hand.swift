import PlayingCards

public struct Hand {
  let combo: Combo
  let cards: [Card]

  init?(combo: Combo, cards: [Card]) throws {
    switch combo {
      case .single where cards.count != 1,
           .pair where cards.count != 2,
           .straight where cards.count != 5,
           .flush where cards.count != 5,
           .fullHouse where cards.count != 5,
           .fourOfAKind where cards.count != 5,
           .straightFlush where cards.count != 5:
      return nil

    default:
      self.combo = combo
      self.cards = cards
    }
  }
}

extension ArraySlice where Element == Card {
  static func < (lhs: ArraySlice<Card>, rhs: ArraySlice<Card>) -> Bool {
    return lhs.sorted().last! < rhs.sorted().last!
  }
}

func determinant(fourOfAkind cards: [Card]) -> Card {
  let firstThree = cards.sorted()[0...2]

  if firstThree[0] == firstThree[1] {
    return firstThree[0]
  } else {
    return firstThree[2]
  }
}

extension Hand: Comparable {
  public static func < (lhs: Hand, rhs: Hand) -> Bool {
    switch (lhs.combo, rhs.combo) {
    case (.single, .single):
      return lhs.cards.first! < rhs.cards.first!

    case (.pair, .pair):
      return lhs.cards[0...1] < rhs.cards[0...1]

    case (.fourOfAKind, .fourOfAKind):
      return determinant(fourOfAkind: lhs.cards) < determinant(fourOfAkind: rhs.cards)

    default:
      return lhs.combo < rhs.combo && lhs.cards[0...4] < rhs.cards[0...4]
    }
  }

  public static func == (lhs: Hand, rhs: Hand) -> Bool {
    return lhs.combo == rhs.combo && lhs.cards == rhs.cards
  }
}
