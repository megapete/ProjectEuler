//
//  Project_57.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-08-16.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project57()
{
    var p = [1]
    var q = [1]
    
    // print(DoMultiply(x: 19, yIn: [1,7]))
    
    var result = 0
    
    for _ in 0..<1000
    {
        SQRT2(p: &p, q: &q)
        
        if p.count > q.count
        {
            result += 1
        }
    }
    
    print(result)
}

// This function is derived from the discussion at https://en.wikipedia.org/wiki/Square_root_of_2#Series_and_product_representations
func SQRT2(p:inout [Int], q:inout [Int])
{
    var twoQ = DoMultiply(x: 2, yIn: q)

    let oldP = p
    
    p = DoAdd(x: oldP, y: twoQ)
    
    q = DoAdd(x: oldP, y: q)
}

func DoMultiply(x:Int, yIn: [Int]) -> [Int]
{
    var carry = 0
    
    var y:[Int] = yIn.reversed()
    
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
    
    return y.reversed()
}

