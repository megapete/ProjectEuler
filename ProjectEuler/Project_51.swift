//
//  Project_51.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-08-07.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project51()
{
    var theSet = [0,1,2,3,4]
    
    
    
    // input parameters
    let numPrimesToFind = 7
    let minLimit = 10000
    
    let maxDigitsToReplace = DigitArray(n: minLimit).count - 1
    
    var numPrimes = 0
    var currentValue = minLimit
    
    while numPrimes < numPrimesToFind
    {
        
        currentValue += 1
    }
    
    
    
}

func GetCombinations(nArray:[Int], k:Int) -> [[Int]]
{
    var result:[[Int]] = []
    
    return result
}

func DoCombination(

func DoReplace(n:Int, numDigits:Int) -> [Int]
{
    let nAsDigits = DigitArray(n: n)
    
    let numDigitsToReplace = min(nAsDigits.count - 1, numDigits)
    
    return []
    
}

func ReplaceDigits(inDigits:[Int], digitIndices:[Int], newDigit:Int) -> Int
{
    var digits = inDigits
    
    for nextIndex in digitIndices
    {
        digits[nextIndex] = newDigit
    }
    
    return DigitsAsInt(digits: digits)
}
