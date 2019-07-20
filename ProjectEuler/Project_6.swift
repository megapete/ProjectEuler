//
//  Project_6.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-10.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project6()
{
    var nums:[Int] = []
    var squares:[Int] = []
    
    let maxInt = 100
    
    for i in 1...maxInt
    {
        nums.append(i)
        squares.append(i*i)
    }
    
    let numSum = Sum(values: nums)
    let sqSum = Sum(values: squares)
    
    print("Square of nums: \(numSum * numSum)")
    print("Sum of squares: \(sqSum)")
    
    print("Difference: \(numSum * numSum - sqSum)")
}

func Sum(values:[Int]) -> Int
{
    var result = 0
    
    for nextValue in values
    {
        result += nextValue
    }
    
    return result
}
