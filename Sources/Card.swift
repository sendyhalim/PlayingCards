public enum Suit: Int {
  case diamond = 1
  case club = 2
  case heart = 3
  case spade = 4
}

public struct Card {
  let value: Int
  let suit: Suit
}

extension Card: Comparable {
  public static func < (lhs: Card, rhs: Card) -> Bool {
    return (lhs.value < rhs.value) &&  (lhs.suit.rawValue < rhs.suit.rawValue)
  }

  public static func == (lhs: Card, rhs: Card) -> Bool {
    return (lhs.value == rhs.value) && (lhs.suit.rawValue == rhs.suit.rawValue)
  }
}
