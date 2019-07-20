//
//  Project_25.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-17.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

let phi = (1.0 + sqrt(5.0)) / 2.0

func Project25()
{
    
    for n in 4780...4790
    {
    
        let nod = Double(n) * log10(phi) - log10(5.0) / 2
    
        print("n=\(n): \(nod) digits")
    }
    
}

func DirectFibonnaci(n:Int) -> Double
{
    return round(pow(phi, Double(n)) / sqrt(5));
}

func SimpleFibonnaci(n:Int) -> Int
{
    if n == 0
    {
        return 0
    }
    else if n == 1 || n == 2
    {
        return 1
    }
    
    var n2 = 1
    var n1 = 1
    
    var currNum = 0
    
    for i in 3...n
    {
        currNum = n1 + n2
        
        n2 = n1
        n1 = currNum
    }
    
    return currNum
}
