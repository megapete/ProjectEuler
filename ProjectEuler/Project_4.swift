//
//  Project_4.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-10.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func TestPalindrome(x:Int) -> Bool
{
    let strX = "\(x)"
    let strXarray = Array(strX.utf16)
    
    var leftIndex = 0
    var rightIndex = strXarray.count - 1
    
    while leftIndex < rightIndex
    {
        if (strXarray[leftIndex] != strXarray[rightIndex])
        {
            return false
        }
        
        leftIndex += 1
        rightIndex -= 1
    }
    
    return true
}

func Project4()
{
    let maxFactor = 999
    
    var palindromes:[Int] = [1]
    
    for i in 1...maxFactor
    {
        for j in 1...maxFactor
        {
            let newValue = i * j
            
            if TestPalindrome(x: newValue)
            {
                palindromes.append(newValue)
            }
        }
    }
    
    var maxPal = 0
    
    print(palindromes.max()!)
}
