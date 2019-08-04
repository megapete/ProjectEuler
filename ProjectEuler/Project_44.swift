//
//  Project_44.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-24.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

// Adapted from https://codereview.stackexchange.com/questions/93232/speedup-for-project-euler-44-pentagon-numbers


import Foundation

func Project44()
{
    // FindLimits()
    
    let limitK = 91650
    let limitJ = 52430
    
    let Pj = PentagonalNumber(n: 1020)
    let Pk = PentagonalNumber(n: 2167)
    
    print("Pj: \(Pj)")
    print("Pk: \(Pk)")
    
    print("Pj+Pk = \(Pj + Pk); Pentagonal:\(IsPentagonal(Pn: Pj+Pk))")
    print("Pk-Pj = \(Pk - Pj): Pentagonal:\(IsPentagonal(Pn: Pk-Pj))")
    
    // print("20 mod 7 = \(20 % 7) or 20 mod 7 = \(NegMod(n: 20, div: 7))")
    
    for k in 1..<limitK
    {
        let K = k * 6 - 1
        
        let checkArray = EnumerateSumOfSquaresFor(K: 2 * K * K)
        print("Sum of squares for k=\(k): \(checkArray)")
        
        for nextCheck in checkArray
        {
            if TestForSolution_Project44(K: K, X: nextCheck.x, Y: nextCheck.y)
            {
                let x = (nextCheck.x + 1) / 6
                
                let J = IntSqrt(x: K * K - nextCheck.x * nextCheck.x + 1)!
                let j = (J + 1) / 6
                
                print("j = \(j)")
                print("k = \(k)")
            }
        }
    }
}

func TestForSolution_Project44(K:Int, X:Int, Y:Int) -> Bool
{
    if NegMod(n: X, div: 6) != -1 || NegMod(n: Y, div: 6) != -1
    {
        return false
    }
    
    if let J = IntSqrt(x: K * K - X * X + 1)
    {
        if NegMod(n: J, div: 6) == -1
        {
            return true
        }
    }
    
    return false
}

func IntSqrt(x:Int) -> Int?
{
    // return the square root of x, but only if it's an integer, otherwise return nil
    let root = sqrt(Double(x))
    
    if root == floor(root)
    {
        return Int(root)
    }
    
    return nil
}

func EnumerateSumOfSquaresFor(K:Int) -> [(x:Int, y:Int)]
{
    var result:[(x:Int, y:Int)] = []
    
    let limit = Int(floor(sqrt(Double(K / 2))))
    var foundYs:[Int] = []
    
    for x in 1...limit
    {
        if foundYs.contains(x)
        {
            continue
        }
        
        let y = RootOfSquareFor(Ksquared: K, X: x)
        
        if y > 0
        {
            result.append((x:x, y:y))
            foundYs.append(y)
        }
    }
    
    return result
}

func RootOfSquareFor(Ksquared:Int, X:Int) -> Int
{
    // If Ksquared - X^2 = Y^2, with Y an Int, then return Y, else return -1
    let y = sqrt(Double(Ksquared - X*X))
    
    if ceil(y) == y
    {
        return Int(y)
    }
    
    return -1
}

func NegMod(n:Int, div:Int) -> Int
{
    let x = n % div
    
    return x - div
}

func HasSquareSum(num:Int) -> Bool
{
    var n = num
    var i = 2
    
    while (i * i <= n)
    {
        var count = 0
        if (n % i == 0)
        {
            count += 1
            n /= i
        }
        
        if i % 4 == 3 && count % 2 != 0
        {
            return false
        }
        
        i += 1
    }
    
    return n % 4 != 3
}

func FindLimits()
{
    // This function is included to show that the limit of k is 91650. The routine runs too slow to include in the general solution above.
    
    let testLimit = 100000
    var limitK = testLimit
    var limitJ = testLimit
    
    for j in 1...testLimit
    {
        let Pj = PentagonalNumber(n: j)
        
        for k in (j+1)...testLimit
        {
            let Pk = PentagonalNumber(n: k)
            
            let diff = Pk - Pj
            
            if IsPentagonal(Pn: diff)
            {
                let sum = Pj + Pk
                
                if IsPentagonal(Pn: sum)
                {
                    limitK = k
                    break
                }
            }
        }
        
        if limitK < testLimit
        {
            limitJ = j
            break
        }
    }
    
    print("limitK = \(limitK), limitJ = \(limitJ)")
}

func PentagonalNumber(n:Int) -> Int
{
    return n * (3 * n - 1) / 2
}

func IsPentagonal(Pn:Int) -> Bool
{
    let dPn = Double(Pn)
    
    let n = sqrt(2.0 / 3.0 * dPn + 1.0 / 36.0) + 1.0 / 6.0
    
    return ceil(n) == n
}

