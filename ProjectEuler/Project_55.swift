//
//  Project_55.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-08-12.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project55()
{
    var result = 0
    
    // let test = IsLychrel(x: [4,9,9,4])
    
    for i in 5...10000
    {
        if !IsLychrel(x: DigitArray(n: i))
        {
            print("Non-Lychrel: \(i)")
            result += 1
        }
    }
    
    print("Total non-Lychrels: \(result)")
}

func IsLychrel(x:[Int]) -> Bool
{
    var nextX = x
    for i in 0..<50
    {
        let revX:[Int] = nextX.reversed()
        
        let sum = DoAdd(x: nextX, y: revX)
        
        if TestPalindromeDigits(n: sum)
        {
            return true
        }
        
        nextX = sum
    }
    
    return false
}

func DoAdd(x:[Int], y:[Int]) -> [Int]
{
    var xRev:[Int] = x.reversed()
    var yRev:[Int] = y.reversed()
    
    if xRev.count < yRev.count
    {
        swap(&xRev, &yRev)
    }
    
    var result:[Int] = []
    
    var carry = 0
    
    for i in 0..<xRev.count
    {
        let nextSum = xRev[i] + carry + (i < yRev.count ? yRev[i] : 0)
        
        result.append(nextSum % 10)
        carry = nextSum / 10
    }
    
    if carry > 0
    {
        result.append(carry)
    }
    
    return result.reversed()
}
