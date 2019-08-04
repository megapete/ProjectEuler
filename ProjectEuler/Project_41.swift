//
//  Project_41.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-22.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project41()
{
    let maxNum = 987654321
    var n = maxNum
    
    print("Getting prime bools")
    let primeIndicators = PrimeBoolArray(n: n)
    print("Done!")
    
    let lastIndex = (n+1)/2 - 1
    
    for i in stride(from: lastIndex, through: 0, by: -1)
    {
        if primeIndicators[i]
        {
            let nDigits = DigitArray(n: n)
            
            if (TestForPandigitalArray(digits: nDigits))
            {
                break
            }
        }
        
        n -= 2
    }
    
    print("The largest pandigital prime less than \(maxNum) is \(n)")
    
    /*
    let allPrimes = OptimizedSieveOfEratosthenes(n: maxNum)
    print(allPrimes)
 */
}



func PrimeBoolArray(n:Int) -> [Bool]
{
    var prime = [Bool](repeating: true, count: (n+1)/2)
    
    var p = 3
    
    while p * p <= n
    {
        if prime[p/2]
        {
            for i in stride(from: p * p, through: n, by: p*2)
            {
                prime[i/2] = false
            }
        }
        
        p += 2
    }
    
    return prime
}

func LastPrimeBefore(n:Int) -> Int
{
    // If n is prime, this rountine returns n
    // If n is even, the function uses n-1
    var prime = [Bool](repeating: true, count: (n+1)/2)
    
    var p = 3
    
    while p * p <= n
    {
        if prime[p/2]
        {
            for i in stride(from: p * p, through: n, by: p*2)
            {
                prime[i/2] = false
            }
        }
        
        p += 2
    }
    
    let lastIndex = (n+1)/2 - 1
    
    var num = n
    if num % 2 == 0
    {
        num -= 1
    }
    
    for i in stride(from: lastIndex, through: 0, by: -1)
    {
        if prime[i]
        {
            return num
        }
        
        num -= 2
    }
    
    return 2
}

func OptimizedSieveOfEratosthenes(n:Int) -> [Int]
{
    var prime = [Bool](repeating: true, count: (n+1)/2)
    
    var p = 3
    
    while p * p <= n
    {
        if prime[p/2]
        {
            for i in stride(from: p * p, through: n, by: p*2)
            {
                prime[i/2] = false
            }
        }
        
        p += 2
    }
    
    var result:[Int] = []
    
    var i = 2
    for nextPrime in prime
    {
        if nextPrime
        {
            result.append(i)
        }
        
        if i == 2
        {
            i += 1
        }
        else
        {
            i += 2
        }
    }
    
    return result
}
