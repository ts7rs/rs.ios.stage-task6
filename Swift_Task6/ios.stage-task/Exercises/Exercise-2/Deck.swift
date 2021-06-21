import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
        let suits = Suit.allCases
        let values = Value.allCases
        cards = createDeck(suits: suits, values: values)
    }

    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        
       /* let suits: [Suit] = [.clubs, .spades, .hearts, .diamonds]
        let values: [Value] = [.six, .seven, .eight, .nine, .ten, .jack, .queen, .king, .ace] */
        var cards: [Card] = []
        
          for value in values {
            for suit in suits {
                cards.append(Card(suit: suit, value: value))
            }
          }
             
        return cards
    }

    public mutating func shuffle() {
        cards.shuffle()
    }

    public mutating func defineTrump() {
        //верх колоды - конец массива
      //trump =  cards.self
        
        
    }

    public func initialCardsDealForPlayers(players: [Player]) {

    }

    public func setTrumpCards(for suit:Suit) {

    }
}

