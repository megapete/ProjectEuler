//
//  Project_36.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-20.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project36()
{
    var palindromeSum = 0
    
    for num in 0..<1000000
    {
        let decRep = DigitArray(n: num)
        let binRep = DecimalToBinary(n: num)
    
        if TestPalindromeDigits(n: decRep) && TestPalindromeDigits(n: binRep)
        {
            palindromeSum += num
        }
    }
    
    print(palindromeSum)
}

func TestPalindromeDigits(n:[Int]) -> Bool
{
    var leftIndex = 0
    var rightIndex = n.count - 1
    
    while leftIndex < rightIndex
    {
        if n[leftIndex] != n[rightIndex]
        {
            return false
        }
        
        leftIndex += 1
        rightIndex -= 1
    }
    
    return true
}

func DigitsAsString(digits:[Int]) -> String
{
    var result = ""
    
    for nextDigit in digits
    {
        result += "\(nextDigit)"
    }
    
    return result
}

func DecimalToBinary(n:Int) -> [Int]
{
    if n == 0
    {
        return [0]
    }
    
    var result:[Int] = []
    
    var testN = n
    
    while testN > 0
    {
        result.append(testN % 2)
        
        testN /= 2
    }
    
    return result.reversed()
}
