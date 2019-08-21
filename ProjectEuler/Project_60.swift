//
//  Project_60.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-08-20.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project60()
{
    var primes = OptimizedSieveOfEratosthenes(n: 3000)
    
    var pairs:[(a:Int, b:Int)] = []
    
    for i in 0..<primes.count-1
    {
        for j in (i+1)..<primes.count
        {
            if IsPrime(n: ConcatenateIntegers(a: primes[i], b: primes[j]))
            {
                if IsPrime(n: ConcatenateIntegers(a: primes[j], b: primes[i]))
                {
                    pairs.append((primes[i], primes[j]))
                }
            }
        }
    }
    
    print("Number of doubles: \(pairs.count)")
    
    var triples:[(a:Int, b:Int, c:Int)] = []
    
    for nextPair in pairs
    {
        for nextPrime in primes
        {
            if /* nextPrime == nextPair.a || */ nextPrime <= nextPair.b
            {
                continue
            }
            
            if IsPrime(n: ConcatenateIntegers(a: nextPair.a, b: nextPrime))
            {
                if IsPrime(n: ConcatenateIntegers(a: nextPrime, b: nextPair.a))
                {
                    if IsPrime(n: ConcatenateIntegers(a: nextPair.b, b: nextPrime))
                    {
                        if IsPrime(n: ConcatenateIntegers(a: nextPrime, b: nextPair.b))
                        {
                            triples.append((nextPair.a, nextPair.b, nextPrime))
                        }
                    }
                }
            }
        }
    }
    
    print("Number of triples: \(triples.count)")
    
    
    
    var quads:[(a:Int, b:Int, c:Int, d:Int)] = []
    
    for nextTriple in triples
    {
        for nextPrime in primes
        {
            if /* nextPrime == nextTriple.a || nextPrime == nextTriple.b || */ nextPrime <= nextTriple.c
            {
                continue
            }
            
            if IsPrime(n: ConcatenateIntegers(a: nextTriple.a, b: nextPrime))
            {
                if IsPrime(n: ConcatenateIntegers(a: nextPrime, b: nextTriple.a))
                {
                    if IsPrime(n: ConcatenateIntegers(a: nextTriple.b, b: nextPrime))
                    {
                        if IsPrime(n: ConcatenateIntegers(a: nextPrime, b: nextTriple.b))
                        {
                            if IsPrime(n: ConcatenateIntegers(a: nextTriple.c, b: nextPrime))
                            {
                                if IsPrime(n: ConcatenateIntegers(a: nextPrime, b: nextTriple.c))
                                {
                                    quads.append((nextTriple.a, nextTriple.b, nextTriple.c, nextPrime))
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    print("Number of quads: \(quads.count)")
    
    var quints:[(a:Int, b:Int, c:Int, d:Int, e:Int)] = []
    
    for nextQuad in quads
    {
        for nextPrime in primes
        {
            if nextPrime <= nextQuad.d
            {
                continue
            }
            
            if IsPrime(n: ConcatenateIntegers(a: nextQuad.a, b: nextPrime))
            {
                if IsPrime(n: ConcatenateIntegers(a: nextPrime, b: nextQuad.a))
                {
                    if IsPrime(n: ConcatenateIntegers(a: nextQuad.b, b: nextPrime))
                    {
                        if IsPrime(n: ConcatenateIntegers(a: nextPrime, b: nextQuad.b))
                        {
                            if IsPrime(n: ConcatenateIntegers(a: nextQuad.c, b: nextPrime))
                            {
                                if IsPrime(n: ConcatenateIntegers(a: nextPrime, b: nextQuad.c))
                                {
                                    if IsPrime(n: ConcatenateIntegers(a: nextQuad.d, b: nextPrime))
                                    {
                                        if IsPrime(n: ConcatenateIntegers(a: nextPrime, b: nextQuad.d))
                                        {
                                            quints.append((nextQuad.a, nextQuad.b, nextQuad.c, nextQuad.d, nextPrime))
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    print("Number of quints: \(quints.count)")
    
    var minSum = Int.max
    
    for nextQuint in quints
    {
        let sum = nextQuint.a + nextQuint.b + nextQuint.c + nextQuint.d + nextQuint.e
        if sum < minSum
        {
            minSum = sum
        }
        
        print("Quad:\(nextQuint); sum = \(sum)")
    }
    
    print("Minimum sum: \(minSum)")
}

func ConcatenateIntegers(a:Int, b:Int) -> Int
{
    let digArray = DigitArray(n: a) + DigitArray(n: b)
    
    return ArrayAsInt(digitArray: digArray)
}


func ArrayAsInt(digitArray:[Int]) -> Int
{
    let array:[Int] = digitArray.reversed()
    
    var mult = 1
    
    var result = 0
    
    for nextDigit in array
    {
        result += nextDigit * mult
        
        mult *= 10
    }
    
    return result
}
