//
//  Project_12.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-11.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project12()
{
    var factors:[Int] = []
    var triNum = 0
    var i = 0
    
    repeat
    {
        i += 1
        
        triNum = TriangleNumber(n: i)
        factors = Factorize(n: triNum)
        
    } while factors.count < 500
    
    print("\(triNum)")
}

func TriangleNumber(n:Int) -> Int
{
    var result = 0
    
    for i in 1...n
    {
        result += i
    }
    
    return result
}

func Factorize(n:Int) -> [Int]
{
    if n == 1
    {
        return [1]
    }
    
    var result = [1, n]
    
    let maxTest = Int(sqrt(Double(n)) + 0.5)
    
    for i in 2...maxTest
    {
        if n % i == 0
        {
            result.append(i)
            
            if (i != n / i)
            {
                result.append(n / i)
            }
        }
    }
    
    return result.sorted()
}
