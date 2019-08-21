//
//  Project_47.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-08-05.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project47()
{
    let hilimit = 1000000
    let numDistinctPrimeFactors = 4
    
    for i in 1..<hilimit
    {
        var testValue = TestNumDistinctFactors(number: i, numFactors: numDistinctPrimeFactors)
        
        if (testValue)
        {
            for j in (i+1)..<(i+numDistinctPrimeFactors)
            {
                testValue = testValue && TestNumDistinctFactors(number: j, numFactors: numDistinctPrimeFactors)
                
                if !testValue
                {
                    break
                }
            }
        }
        
        if testValue
        {
            var msgText = "Got them: "
            for j in i..<(i+numDistinctPrimeFactors)
            {
                msgText += "\(j);"
            }
            
            print(msgText)
            
            break
        }
    }
}

func TestNumDistinctFactors(number:Int, numFactors:Int) -> Bool
{
    let factors = PrimeFactors(n: number)
    
    return factors.count == numFactors
}
