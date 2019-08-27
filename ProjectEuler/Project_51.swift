//
//  Project_51.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-08-07.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project51()
{
    
    // print(DoCombinationsOfArrayIndices(arraySize: 5, k: 3))
    
    
    // input parameters
    let numPrimesToFind = 7
    let minLimit = 10000
    
    // let maxDigitsToReplace = DigitArray(n: minLimit).count - 1
    
    var numPrimes = 0
    var currentValue = minLimit
    
    while numPrimes < numPrimesToFind
    {
        let maxDigitsToReplace = CountDigits(n: UInt(currentValue)) - 1
        
        for i in 1...maxDigitsToReplace
        {
            
        }
        
        currentValue += 1
    }
    
    
    
}

func CountDigits(n:UInt) -> Int
{
    var result = 0
    
    var useN = n
    
    while useN > 0
    {
        result += 1
        useN /= 10
    }
    
    return result
}

func DoCombinationsOfArrayIndices(arraySize:Int, k:Int) -> [[Int]]
{
    // This method (and its helper) comes from https://www.geeksforgeeks.org/print-all-possible-combinations-of-r-elements-in-a-given-array-of-size-n/
    
    // k is defined as in "n Choose k"
    
    // clamp k to the size fo the array
    let useK = (k > arraySize ? arraySize : k)
    
    var trivalResult:[Int] = []
    
    for i in 0..<arraySize
    {
        trivalResult.append(i)
    }
    
    // special case where n == k
    if arraySize == useK
    {
        return [trivalResult]
    }
    
    var result:[[Int]] = []
    
    var tempArray:[Int] = Array(repeating: 0, count: k)
    
    CombHelper(resultArray: &result, indexArray: trivalResult, currentArray: &tempArray, start: 0, end: arraySize - 1, index: 0, r: k)
    
    
    return result
}

func CombHelper(resultArray: inout [[Int]], indexArray:[Int], currentArray: inout [Int], start:Int, end:Int, index:Int, r:Int)
{
    if index == r
    {
        resultArray.append(currentArray)
        return
    }
    
    var i = start
    while i <= end && end - i + 1 >= r - index
    {
        currentArray[index] = indexArray[i]
        
        CombHelper(resultArray: &resultArray, indexArray: indexArray, currentArray: &currentArray, start: i + 1, end: end, index: index + 1, r: r)
        
        i += 1
    }
}


func ReplaceDigits(inDigits:[Int], digitIndices:[Int], newDigit:Int) -> Int
{
    var digits = inDigits
    
    for nextIndex in digitIndices
    {
        digits[nextIndex] = newDigit
    }
    
    return DigitsAsInt(digits: digits)
}
