//
//  Project_30.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-18.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project30()
{
    let numDigits = 5
    
    let low = Int(pow(10.0, Double(numDigits - 1)))
    let high = Int(pow(10.0, Double(numDigits)))
    
    var sum = 0
    
    for i in 10..<high*20
    {
        let checkNumArray = DigitArray(n: i)
        
        var checkSum = 0
        for nextDigit in checkNumArray
        {
            checkSum += Int(pow(Double(nextDigit), Double(numDigits)))
        }
        
        if checkSum == i
        {
            print(checkSum)
            sum += checkSum
        }
    }
    
    print("Sum of numbers: \(sum)")
}

func DigitArray(n:Int) -> [Int]
{
    var result:[Int] = []
    
    var newN = n
    
    while newN != 0
    {
        result.append(newN % 10)
        
        newN /= 10
    }
    
    return result.reversed()
}
