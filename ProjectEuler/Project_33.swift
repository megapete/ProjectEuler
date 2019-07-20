//
//  Project_33.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-19.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

// NOTE: This program kind of fucks up (inverts) numerator and denominator

import Foundation

typealias Fraction = (num:Int, denom:Int)

func Project33()
{
    var result:[Fraction] = []
    
    for numFirstDigit in 1...9
    {
        for numSecondDigit in 1...9
        {
            if numFirstDigit == numSecondDigit
            {
                continue
            }
            
            let numerator = numFirstDigit * 10 + numSecondDigit
            
            let denom1SecondDigit = numFirstDigit
            
            for denom1FirstDigit in 1...9
            {
                if denom1FirstDigit == denom1SecondDigit
                {
                    continue
                }
                
                let denominator = denom1FirstDigit * 10 + denom1SecondDigit
                
                if (Double(numerator) / Double(denominator) == Double(numSecondDigit) / Double(denom1FirstDigit))
                {
                    print("Fraction: \(numerator)/\(denominator)")
                    
                    let reducedFraction = ReduceFraction(num: numerator, denom: denominator)
                    
                    print("Reduced: \(reducedFraction.num)/\(reducedFraction.denom)")
                    
                    result.append(reducedFraction)
                }
            }
            
            let denom2FirstDigit = numSecondDigit
            
            for denom2SecondDigit in 1...9
            {
                if denom2FirstDigit == denom2SecondDigit
                {
                    continue
                }
                
                let denominator = denom2FirstDigit * 10 + denom2SecondDigit
                
                if (Double(numerator) / Double(denominator) == Double(numSecondDigit) / Double(denom2FirstDigit))
                {
                    print("Fraction: \(numerator)/\(denominator)")
                    
                    let reducedFraction = ReduceFraction(num: numerator, denom: denominator)
                    
                    print("Reduced: \(reducedFraction.num)/\(reducedFraction.denom)")
                    
                    result.append(reducedFraction)
                }
            }
            
        }
    }
}

func ReduceFraction(num:Int, denom:Int) -> Fraction
{
    let gcd = GCD(a: num, b: denom)
    
    let newNum = num / gcd
    let newDenom = denom / gcd
    
    return (newNum, newDenom)
}
