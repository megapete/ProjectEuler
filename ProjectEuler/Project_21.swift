//
//  Project_21.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-16.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project21()
{
    var resultArray:[Int] = []
    
    for a in 3..<10000
    {
        if resultArray.contains(a)
        {
            continue
        }
        
        let b = SumOfArray(x: ProperDivisors(x: a))
        
        if a == b
        {
            continue
        }
        else if SumOfArray(x: ProperDivisors(x: b)) == a
        {
            resultArray.append(contentsOf: [a,b])
        }
    }
    
    print(resultArray)
    print(SumOfArray(x: resultArray))
}

func SumOfArray(x:[Int]) -> Int
{
    var sum = 0
    
    for nextInt in x
    {
        sum += nextInt
    }
    
    return sum
}

func ProperDivisors(x:Int) -> [Int]
{
    var factors = Factorize(n: x)
    factors.removeLast()
    
    return factors
}


