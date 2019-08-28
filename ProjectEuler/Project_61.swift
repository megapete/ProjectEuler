//
//  Project_61.swift
//  ProjectEuler
//
//  Created by PeterCoolAssHuber on 2019-08-28.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project61()
{
    // generate 4-digit triangle numbers
    var triangles:[Int] = []
    for n in 45..<141
    {
        triangles.append(n * (n + 1) / 2)
    }
    
    // generate 4-digit square numbers
    var squares:[Int] = []
    for n in 32..<100
    {
        squares.append(n * n)
    }
    
    // generate 4-digit pentagonal numbers
    var pentagonals:[Int] = []
    for n in 26..<82
    {
        pentagonals.append(n * (3 * n - 1) / 2)
    }
    
    // generate 4-digit hexagonal numbers
    var hexagonals:[Int] = []
    for n in 23..<71
    {
        hexagonals.append(n * (2 * n - 1))
    }
    
    // generate 4-digit heptagonal numbers
    var heptagonals:[Int] = []
    for n in 21..<64
    {
        heptagonals.append(n * (5 * n - 3) / 2)
    }
    
    // generate 4-digit octagonal numbers
    var octagonals:[Int] = []
    for n in 19..<59
    {
        octagonals.append(n * (3 * n - 2))
    }
    
    
    
}



func IntPow(n:Int, power:Int) -> Int
{
    // be careful not to go too high with this function
    
    // do the lower powers trivially
    if power == 0
    {
        return 1
    }
    else if power == 1
    {
        return n
    }
    else if power == 2
    {
        return n * n
    }
    else if power == 3
    {
        return n * n * n
    }
    else if power == 4
    {
        return n * n * n * n
    }
    else if power == 5
    {
        return n * n * n * n * n
    }
    
    var result = 1
    
    for _ in 1...power
    {
        result *= n
    }
    
    return result
}
