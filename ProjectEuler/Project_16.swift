//
//  Project_16.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-13.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project16()
{
    let num = RepresentPower(base: 2, power: 1000)
    
    print(SumOfElements(x: num))
    
}

func SumOfElements(x:[Int]) -> Int
{
    var result = 0
    
    for nextElement in x
    {
        result += nextElement
    }
    
    return result
}

func RepresentPower(base:Int, power:Int) -> [Int]
{
    if power < 0
    {
        return []
    }
    
    if power == 0
    {
        return [1]
    }
    
    // let numdigits = Int(floor(Double(power) * log10(Double(base)))) + 1
    
    var numArray:[Int] = []
    
    var temp = base
    
    while temp != 0
    {
        numArray.append(temp % 10)
        temp = temp / 10
    }
    
    var numDigits = numArray.count
    
    for _ in 2...power
    {
        numDigits = DoMultiply(x: base, y: &numArray)
    }
    
    return numArray.reversed()
}

func DoMultiply(x:Int, y:inout [Int]) -> Int
{
    var carry = 0
    
    for i in 0..<y.count
    {
        let prod = y[i] * x + carry
        
        y[i] = prod % 10
        
        carry = prod / 10
    }
    
    while carry > 0
    {
        y.append(carry % 10)
        
        carry /= 10
    }
    
    return y.count
}

func SumOfDigits(x:Int) -> Int
{
    var sum = 0
    
    let limit = Int(floor(log10(Double(x))))
    let b = 10.0
    
    for n in 0...limit
    {
        let left = x % Int(pow(b, Double(n+1)))
        let right = x % Int(pow(b, Double(n)))
        
        sum += (left - right) / Int(pow(b, Double(n)))
    }
    
    
    return sum
}
