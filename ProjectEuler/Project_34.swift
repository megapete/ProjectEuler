//
//  Project_34.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-19.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project34()
{
    for i in 3..<1000000
    {
        let digits = DigitArray(n: i)
        
        var sum = 0
        
        for nextDigit in digits
        {
            sum += SimpleFactorial(x: nextDigit)
        }
        
        if sum == i
        {
            print(i)
        }
    }
}

func SimpleFactorial(x:Int) -> Int
{
    if x <= 1
    {
        return 1
    }
    
    return x * SimpleFactorial(x: x - 1)
}
