//
//  Project_5.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-10.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project5()
{
    print(LCM(values: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]))
}

func GCD(a:Int, b:Int) -> Int
{
    var aa = a
    var bb = b
    
    while (bb > 0)
    {
        let temp:Int = bb;
        bb = aa % bb; // % is remainder
        aa = temp;
    }
    
    return aa;
}

func GCD(values:[Int]) -> Int
{
    var result = values[0]
    
    for i in 1..<values.count
    {
        result = GCD(a: result, b: values[i])
    }
    
    return result
}

func LCM(a:Int, b:Int) -> Int
{
    return a * (b / GCD(a:a, b:b));
}

func LCM(values:[Int]) -> Int
{
    var result = values[0]
    
    for i in 1..<values.count
    {
        result = LCM(a: result, b: values[i])
    }
    
    return result
}
