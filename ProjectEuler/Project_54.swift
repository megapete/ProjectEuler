//
//  Project_54.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-08-10.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

enum Suits {
    
    case hearts
    case diamonds
    case clubs
    case spades
}

struct Card {
    
    let value:Int
    let suit:Suits
    
    init(code:String)
    {
        let valChar = String(code[code.startIndex])
        let suitChar = String(code[code.index(code.startIndex, offsetBy: 1)])
        
        switch valChar {
        case "T":
            self.value = 10
        case "J":
            self.value = 11
        case "Q":
            self.value = 12
        case "K":
            self.value = 13
        case "A":
            self.value = 14
        default:
            self.value = Int(valChar)!
        }
        
        switch suitChar {
        case "H":
            self.suit = .hearts
        case "D":
            self.suit = .diamonds
        case "S":
            self.suit = .spades
        default:
            self.suit = .clubs
        }
    }
}

func Project54()
{
    let fileString = OpenDocumentAsString(fileName: "p054_poker.txt")
    
    var hands = fileString.components(separatedBy: "\n")
    hands.removeLast()
    
    var player1wins = 0
    
    for nextHand in hands
    {
        let cards = nextHand.components(separatedBy: " ")
        
        var hand1:[Card] = []
        for i in 0..<5
        {
            hand1.append(Card(code: cards[i]))
        }
        
        var hand2:[Card] = []
        for i in 5..<10
        {
            hand2.append(Card(code: cards[i]))
        }
        
        if CompareHands(hand1: hand1, hand2: hand2) == 1
        {
            player1wins += 1
        }
    }
    
    print(player1wins)
}

func CompareHands(hand1:[Card], hand2:[Card]) -> Int
{
    // This function returns 0 for a draw, 1 for hand1=winner, 2 for hand2=winner
    let hand1Eval = EvaluateHand(hand: hand1)
    let hand2Eval = EvaluateHand(hand: hand2)
    
    if hand1Eval.rawValue > hand2Eval.rawValue
    {
        return 1
    }
    else if hand2Eval.rawValue > hand1Eval.rawValue
    {
        return 2
    }
    
    var sortedH1 = hand1.sorted(by: {$0.value < $1.value})
    var sortedH2 = hand2.sorted(by: {$0.value < $1.value})
    
    var testValue1 = 0
    var testValue2 = 0
    
    // Royal flushes are always draws, so we don't test for them
    
    if hand1Eval == .StraightFlush || hand1Eval == .Straight
    {
        testValue1 = sortedH1[0].value
        testValue2 = sortedH2[0].value
    }
    else if hand1Eval == .Flush || hand1Eval == .HighCard
    {
        for nextCard in sortedH1
        {
            if nextCard.value > testValue1
            {
                testValue1 = nextCard.value
            }
        }
        
        for nextCard in sortedH2
        {
            if nextCard.value > testValue2
            {
                testValue2 = nextCard.value
            }
        }
    }
    else if hand1Eval == .FourOfAKind
    {
        // the value at index 1 is either the second of 4 or the first of 4
        testValue1 = sortedH1[1].value
        testValue2 = sortedH2[1].value
        
        if testValue1 == testValue2
        {
            testValue1 = (sortedH1[0].value == sortedH1[1].value ? sortedH1[4].value : sortedH1[0].value)
            testValue2 = (sortedH2[0].value == sortedH2[1].value ? sortedH2[4].value : sortedH2[0].value)
        }
    }
    else if hand1Eval == .FullHouse
    {
        let tripleStart1 = (sortedH1[1].value == sortedH1[2].value ? 0 : 2)
        let tripleStart2 = (sortedH2[1].value == sortedH2[2].value ? 0 : 2)
        
        testValue1 = sortedH1[tripleStart1].value
        testValue2 = sortedH2[tripleStart2].value
        
        if testValue1 == testValue2
        {
            sortedH1.remove(at: tripleStart1)
            sortedH1.remove(at: tripleStart1)
            sortedH1.remove(at: tripleStart1)
            
            sortedH2.remove(at: tripleStart2)
            sortedH2.remove(at: tripleStart2)
            sortedH2.remove(at: tripleStart2)
            
            testValue1 = sortedH1[0].value
            testValue2 = sortedH2[0].value
        }
    }
    else if hand1Eval == .OnePair
    {
        var pair1Start = 0
        var pair2Start = 0
        
        for i in 0..<sortedH1.count - 1
        {
            if sortedH1[i].value == sortedH1[i+1].value
            {
                pair1Start = i
                break
            }
        }
        for i in 0..<sortedH2.count - 1
        {
            if sortedH2[i].value == sortedH2[i+1].value
            {
                pair2Start = i
                break
            }
        }
        
        testValue1 = sortedH1[pair1Start].value
        testValue2 = sortedH2[pair2Start].value
        
        if testValue1 == testValue2
        {
            sortedH1.remove(at: pair1Start)
            sortedH1.remove(at: pair1Start)
            
            sortedH2.remove(at: pair2Start)
            sortedH2.remove(at: pair2Start)
            
            while testValue1 == testValue2 && sortedH1.count > 0
            {
                testValue1 = 0
                testValue2 = 0
                
                var highIndex1 = 0
                var highIndex2 = 0
                
                for i in 0..<sortedH1.count
                {
                    if sortedH1[i].value > testValue1
                    {
                        testValue1 = sortedH1[i].value
                        highIndex1 = i
                    }
                }
                
                for i in 0..<sortedH2.count
                {
                    if sortedH2[i].value > testValue2
                    {
                        testValue2 = sortedH2[i].value
                        highIndex2 = i
                    }
                }
                
                if testValue1 == testValue2
                {
                    sortedH1.remove(at: highIndex1)
                    sortedH2.remove(at: highIndex2)
                }
            }
        }
    }
    else if hand1Eval == .TwoPair
    {
        var maxPair1Start = 0
        var maxPair2Start = 0
        
        var maxValue = 0
        for i in 0..<sortedH1.count - 1
        {
            if sortedH1[i].value == sortedH1[i+1].value
            {
                if sortedH1[i].value > maxValue
                {
                    maxValue = sortedH1[i].value
                    maxPair1Start = i
                }
            }
        }
        maxValue = 0
        for i in 0..<sortedH2.count - 1
        {
            if sortedH2[i].value == sortedH2[i+1].value
            {
                if sortedH2[i].value > maxValue
                {
                    maxValue = sortedH2[i].value
                    maxPair2Start = i
                }
            }
        }
        
        testValue1 = sortedH1[maxPair1Start].value
        testValue2 = sortedH2[maxPair2Start].value
        
        while testValue1 == testValue2
        {
            sortedH1.remove(at: maxPair1Start)
            sortedH1.remove(at: maxPair1Start)
            
            sortedH2.remove(at: maxPair2Start)
            sortedH2.remove(at: maxPair2Start)
            
            if sortedH1.count > 1
            {
                testValue1 = sortedH1[1].value
                testValue2 = sortedH2[1].value
            }
            else
            {
                testValue1 = sortedH1[0].value
                testValue2 = sortedH2[0].value
                break
            }
            
            if testValue1 == testValue2
            {
                maxPair1Start = (sortedH1[0].value == sortedH1[1].value ? 0 : 1)
                maxPair2Start = (sortedH2[0].value == sortedH2[1].value ? 0 : 1)
            }
        }
        
    }
    else if hand1Eval == .ThreeOfAKind
    {
        var multStart1 = -1
        var multStart2 = -1
        
        for nextCard in sortedH1
        {
            if nextCard.value == testValue1
            {
                break
            }
            
            multStart1 += 1
            testValue1 = nextCard.value
        }
        
        for nextCard in sortedH2
        {
            if nextCard.value == testValue2
            {
                break
            }
            
            multStart2 += 1
            testValue2 = nextCard.value
        }
        
        if testValue1 == testValue2
        {
            sortedH1.remove(at: multStart1)
            sortedH1.remove(at: multStart1)
            sortedH1.remove(at: multStart1)
            
            sortedH2.remove(at: multStart2)
            sortedH2.remove(at: multStart2)
            sortedH2.remove(at: multStart2)
            
            while testValue1 == testValue2 && sortedH1.count > 0
            {
                testValue1 = 0
                testValue2 = 0
                
                var highIndex1 = 0
                var highIndex2 = 0
                
                for i in 0..<sortedH1.count
                {
                    if sortedH1[i].value > testValue1
                    {
                        testValue1 = sortedH1[i].value
                        highIndex1 = i
                    }
                }
                
                for i in 0..<sortedH2.count
                {
                    if sortedH2[i].value > testValue2
                    {
                        testValue2 = sortedH2[i].value
                        highIndex2 = i
                    }
                }
                
                if testValue1 == testValue2
                {
                    sortedH1.remove(at: highIndex1)
                    sortedH2.remove(at: highIndex2)
                }
            }
        }
    }
    
    if testValue1 > testValue2
    {
        return 1
    }
    else if testValue2 > testValue1
    {
        return 2
    }
    
    return 0
}

enum Hands:Int {
    
    case HighCard = 1
    case OnePair = 2
    case TwoPair = 3
    case ThreeOfAKind = 4
    case Straight = 5
    case Flush = 6
    case FullHouse = 7
    case FourOfAKind = 8
    case StraightFlush = 9
    case RoyalFlush = 10
}

func EvaluateHand(hand:[Card]) -> Hands
{
    let sortedHand = hand.sorted(by: {$0.value < $1.value})
    
    // check for a flush of some kind
    let testSuit = sortedHand[0].suit
    var sameSuit = true
    for i in 1..<sortedHand.count
    {
        if sortedHand[i].suit != testSuit
        {
            sameSuit = false
            break
        }
    }
    
    let isStraight = sortedHand[1].value == sortedHand[0].value + 1 && sortedHand[2].value == sortedHand[1].value + 1 && sortedHand[3].value == sortedHand[2].value + 1 && sortedHand[4].value == sortedHand[3].value + 1
    
    if sameSuit
    {
        if isStraight && sortedHand[0].value == 10
        {
            return .RoyalFlush
        }
        else if isStraight
        {
            return .StraightFlush
        }
        
        return .Flush
    }
    
    if isStraight
    {
        return .Straight
    }
    
    // check for multiples
    var multiples:[[Card]] = []
    var lastValue = 0
    var currentValue:[Card] = []
    for nextCard in sortedHand
    {
        if nextCard.value == lastValue
        {
            currentValue.append(nextCard)
        }
        else
        {
            if currentValue.count != 0
            {
                multiples.append(currentValue)
            }
            
            currentValue = [nextCard]
            lastValue = nextCard.value
        }
    }
    
    multiples.append(currentValue)
    
    if multiples.count == 2
    {
        // must be four of a kind or a full houes
        if multiples[0].count == 1 || multiples[0].count == 4
        {
            return .FourOfAKind
        }
        
        return .FullHouse
    }
    
    if multiples.count == 3
    {
        // must be 3 of a kind or 2 pair
        
        for nextMult in multiples
        {
            if nextMult.count == 2
            {
                return .TwoPair
            }
        }
        
        return .ThreeOfAKind
    }
    
    if multiples.count == 4
    {
        return .OnePair
    }
    
    return .HighCard
}
