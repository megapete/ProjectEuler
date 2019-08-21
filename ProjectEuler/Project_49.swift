//
//  Project_49.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-08-06.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project49()
{
    var primes = SieveOfEratosthenes(n: 10000)
    
    while primes[0] < 1000
    {
        primes.removeFirst()
    }
    
    for nextPrime in primes
    {
        if nextPrime == 1487
        {
            print("I'm here")
        }
        
        for i in stride(from: 2, to: 9999, by: 2)
        {
            if !IsPermutation(base: nextPrime, candidate: nextPrime + i)
            {
                continue
            }
            
            if !IsPermutation(base: nextPrime, candidate: nextPrime + 2 * i)
            {
                continue
            }
            
            if primes.contains(nextPrime + i)
            {
                if primes.contains(nextPrime + 2 * i)
                {
                    print("\(nextPrime), \(nextPrime + i), \(nextPrime + 2 * i)")
                }
            }
        }
    }
}

func IsPermutation(base:Int, candidate:Int) -> Bool
{
    var bDigits = DigitArray(n: base)
    let cDigits = DigitArray(n: candidate)
    
    if bDigits.count != cDigits.count
    {
        return false
    }
    
    for nextDigit in cDigits
    {
        if let digitIndex = bDigits.firstIndex(of: nextDigit)
        {
            bDigits.remove(at: digitIndex)
        }
        else
        {
            return false
        }
    }
    
    return true
}
