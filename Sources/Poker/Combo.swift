import PlayingCards

///  An enum that represents a poker hand combo
///
///  - single:        A single card
///  - pair:          2 cards with same value but different suits
///  - straight:      A series of 5 cards with at least 2 suits
///  - flush:         5 cards with same suits
///  - fullHouse:     A combo that consists of 3 cards with same value and different suits + a pair
///  - fourOfAKind:   4 cards with same value and different suits
///  - straightFlush: A series of 5 cards with same suit
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

public struct ComboValidator {
  public let combo: Combo
  public let validate: ([Card]) -> Bool

  public static let all: [Combo: ComboValidator] = [
    .single: ComboValidator(
      combo: .single,
      validate: { cards in
        return cards.count == 1
      }
    ),
    .pair: ComboValidator(
      combo: .pair,
      validate: { cards in
        guard cards.count == 2 else {
          return false
        }

        return (cards[0].value == cards[1].value) && (cards[0].suit != cards[1].suit)
      })
  ]
}
