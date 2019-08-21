//
//  Project_20.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-16.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project20()
{
    let fact = RepresentFactorial(x: 100)
    
    var sum = 0
    
    for nextDigit in fact
    {
        sum += nextDigit
    }
    
    print(sum)
}

func RepresentFactorial(x:Int) -> [Int]
{
    if x == 0 || x == 1
    {
        return [1]
    }
    
    var numArray:[Int] = [x]
    
    var numDigits = numArray.count
    
    for i in stride(from: x-1, through: 2, by: -1)
    {
        numDigits = DoMultiply(x: i, y: &numArray)
    }
    
    return numArray.reversed()
}
