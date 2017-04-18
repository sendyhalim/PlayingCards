import Nimble
import Quick
@testable import PlayingCards
@testable import Poker

struct ValidatorTestCase {
  let cards: [Card]
  let expected: Bool
}

class ComboSpec: QuickSpec {
  override func spec() {
    describe("ComboValidator") {
      let testCasesByCombo: [Combo: [ValidatorTestCase]] = [
        .single: [
          ValidatorTestCase(
            cards: [],
            expected: false
          ),
          ValidatorTestCase(
            cards: [Card(value: 10, suit: .spade)],
            expected: true
          )
        ],

        .pair: [
          ValidatorTestCase(
            cards: [],
            expected: false
          ),
          ValidatorTestCase(
            cards: [Card(value: 2, suit: .club), Card(value: 3, suit: .club)],
            expected: false
          ),
          ValidatorTestCase(
            cards: [Card(value: 2, suit: .club), Card(value: 2, suit: .diamond)],
            expected: true
          )
        ]
      ]

      for (combo, testCases) in testCasesByCombo {
        testCases.forEach {
          testValidator(combo: combo, testCase: $0);
        }
      }

    }
  }


  func testValidator(combo: Combo, testCase: ValidatorTestCase) {
    describe("\(combo)") {
      context("when given \(testCase.cards)") {
        it("should return false") {
          let pair = ComboValidator.all[combo]!

          expect(pair.validate(testCase.cards)) == testCase.expected
        }
      }
    }
  }
}

