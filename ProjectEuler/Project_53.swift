//
//  Project_53.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-08-08.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project53()
{
    // print(NChooseKRecursive(n: 30, k: 16))
    print(NChooseKMultiplicative(n: 30, k: 16))
    
    var result = 0
    for n in 1...100
    {
        for k in 1...n
        {
            if NChooseKMultiplicative(n: n, k: k) > 1000000
            {
                result += 1
                print("n=\(n); k=\(k)")
            }
        }
    }
    
    print(result)
}

func NChooseKMultiplicative(n:Int, k:Int) -> Double
{
    // from https://en.wikipedia.org/wiki/Binomial_coefficient
    
    // Multiplicative method
    
    if k == 0 || k == n
    {
        return 1
    }
    
    var useK = k
    if k > n - k
    {
        useK = n - k
    }
    
    var result = 1.0
    
    for i in 1...useK
    {
        let term = Double((n + 1 - i)) / Double(i)
        
        result *= term
    }
    
    return result
}

func NChooseKRecursive(n:Int, k:Int) -> Int
{
    // from https://en.wikipedia.org/wiki/Binomial_coefficient
    
    // Recursive method
    
    if k == 0 || k == n
    {
        return 1
    }
    
    return NChooseKRecursive(n: n-1, k: k-1) + NChooseKRecursive(n: n-1, k: k)
}

func RepresentFactorialFrom(_ lo:Int, to:Int) -> [Int]
{
    if to < lo
    {
        return []
    }
    
    if to == lo
    {
        return [to]
    }
    
    if to == 0 || to == 1
    {
        return [1]
    }
    
    var numArray:[Int] = [to]
    
    for i in stride(from: to-1, through: lo, by: -1)
    {
        _ = DoMultiply(x: i, y: &numArray)
    }
    
    return numArray.reversed()
}
