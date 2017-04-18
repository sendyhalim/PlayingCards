///  An enum that represents a poker hand combo
///
///  - single:        A single card
///  - pair:          2 cards with same value but different symbols
///  - straight:      A series of 5 cards with at least 2 symbols
///  - flush:         5 cards with same symbols
///  - fullHouse:     A combo that consists of 3 cards with same value and different symbols + a pair
///  - fourOfAKind:   4 cards with same value and different symbols
///  - straightFlush: A series of 5 cards with same symbol
public enum Combo: Int {
  case single = 1
  case pair = 2
  case straight = 3
  case flush = 4
  case fullHouse = 5
  case fourOfAKind = 6
  case straightFlush = 7
}

extension Combo: Comparable {
  public static func < (lhs: Combo, rhs: Combo) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }

  public static func == (lhs: Combo, rhs: Combo) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }
}
