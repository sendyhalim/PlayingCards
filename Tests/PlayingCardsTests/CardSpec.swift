import Nimble
import Quick
@testable import PlayingCards

class CardSpec: QuickSpec {
  override func spec() {
    describe("< operator") {
      context("given cards with equal value") {
        context("and same suit") {
          it("should return false") {
            expect(Card(value: 1, suit: .diamond) < Card(value: 1, suit: .diamond)) == false
            expect(Card(value: 1, suit: .club) < Card(value: 1, suit: .club)) == false
            expect(Card(value: 1, suit: .heart) < Card(value: 1, suit: .heart)) == false
            expect(Card(value: 1, suit: .spade) < Card(value: 1, suit: .spade)) == false
          }
        }

        context("and different suit") {
          it("should return true") {
            expect(Card(value: 1, suit: .club) < Card(value: 1, suit: .diamond)) == false
            expect(Card(value: 1, suit: .heart) < Card(value: 1, suit: .club)) == false
            expect(Card(value: 1, suit: .spade) < Card(value: 1, suit: .heart)) == false
          }
        }
      }

      context("when comparing big < small card value") {
        it("should return false") {
          expect(Card(value: 3, suit: .club) < Card(value: 2, suit: .diamond)) == false
          expect(Card(value: 3, suit: .heart) < Card(value: 2, suit: .club)) == false
          expect(Card(value: 3, suit: .spade) < Card(value: 2, suit: .heart)) == false
        }
      }
    }
  }
}

