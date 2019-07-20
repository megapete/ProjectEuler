//
//  Project_15.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-12.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

var p15_paths:Int64 = 0
// var numCalls = 0

func Project15()
{
    AdvanceRecursive(current: (0,0), max: 20)
    
    print(p15_paths)
}

func AdvanceIterative(max:Int)
{
    for x in 0...max
    {
        
    }
}

func AdvanceRecursive(current:(x:Int, y:Int), max:Int)
{
    // numCalls += 1
    // print(numCalls)
    // print(current)
    
    if current.x == max && current.y == max
    {
        p15_paths += 1
        // numCalls -= 1
        // print(numCalls)
        return
    }
    
    if current.x < max
    {
        AdvanceRecursive(current: (current.x + 1, current.y), max: max)
    }
    
    if current.y < max
    {
        AdvanceRecursive(current: (current.x, current.y + 1), max: max)
    }
    
    // numCalls -= 1
    // print(numCalls)
}
