import PlayingCards

public enum Hand {
  case single(Card)
  case pair(Card, Card)
  case straight(Card, Card, Card, Card, Card)
  case flush(Card, Card, Card, Card, Card)
  case fullHouse(Card, Card, Card, Card, Card)
  case straightFlush(Card, Card, Card, Card, Card)
}
