//
//  Project_58.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-08-17.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project58()
{
    // testing has shown that the result is somewhere between 26001 and 26999
    
    var bottomRight =  1
    var topRight = 0
    var topLeft = 0
    var bottomLeft = 0
    
    var curDimn = 1
    var numDiagonalEntries = 0
    var primeCount = 0
    var percentPrimesOnDiagonal = 1.0
    
    while percentPrimesOnDiagonal >= 0.1
    {
        // Testing indicates that this value is never prime, but I can't prove it mathematically...
        // (not that I've tried)
        let i = (curDimn + 1) / 2
        curDimn += 2
        
        bottomRight += i * 8
        if IsPrime(n: bottomRight)
        {
            primeCount += 1
        }
        
        bottomLeft = bottomRight - 2 * i
        if IsPrime(n: bottomLeft)
        {
            primeCount += 1
        }
        
        topLeft = bottomLeft - 2 * i
        if IsPrime(n: topLeft)
        {
            primeCount += 1
        }
        
        topRight = topLeft - 2 * i
        if IsPrime(n: topRight)
        {
            primeCount += 1
        }
        
        numDiagonalEntries = curDimn * 2 - 1
        
        percentPrimesOnDiagonal = Double(primeCount) / Double(numDiagonalEntries)
    }
    
    var sideLength = curDimn

    print("Side length: \(sideLength), Primes: \(primeCount)/\(numDiagonalEntries) = \(percentPrimesOnDiagonal)%")
    
    /*
    for dimn in stride(from: 3, to: 1999, by: 2)
    {
        // only calculate the numbers on the diagonals
        
        
        let numDiags = dimn * 2 - 1
        let maxRowCol = dimn / 2
        
        var count = 0
        
        for i in 1...maxRowCol
        {
            // easiest is bottom right
            bottomRight += i * 8
            /*
            if IsPrime(n: bottomRight)
            {
                count += 1
            }
            */
            
            // everything else is a function of the previous
            bottomLeft = bottomRight - 2 * i
            if IsPrime(n: bottomLeft)
            {
                count += 1
            }
            
            topLeft = bottomLeft - 2 * i
            if IsPrime(n: topLeft)
            {
                count += 1
            }
            
            topRight = topLeft - 2 * i
            if IsPrime(n: topRight)
            {
                count += 1
            }
        }
        
        let percentPrimes = Double(count)/Double(numDiags)
        
        print("Primes at \(percentPrimes * 100.0)%")
        
        if percentPrimes < 0.10
        {
            print("Got it at dimension \(dimn)")
            break
        }
        
    }
 */
}



func CountPrimesOnDiagonals(wMatrix:matrix) -> Int
{
    var result = 0
    // start with topLeft to bottomRight
    var nextCol = 0
    for nextRow in 0..<wMatrix.rows
    {
        let candidate = wMatrix.ValueAt(row: nextRow, col: nextCol)
        
        if IsPrime(n: candidate)
        {
            result += 1
        }
        
        nextCol += 1
    }
    
    nextCol = wMatrix.cols - 1
    for nextRow in 0..<wMatrix.rows
    {
        let candidate = wMatrix.ValueAt(row: nextRow, col: nextCol)
        
        if nextCol != nextRow && IsPrime(n: candidate)
        {
            result += 1
        }
        
        nextCol -= 1
    }
    
    return result
}

func CreateSpiralMatrixCounterClockwise(dim:Int) -> matrix
{
    var matrixDim = dim
    if dim % 2 == 0
    {
        // force an odd dimension
        matrixDim += 1
    }
    
    // matrix class is defined in Project11
    let theMatrix = matrix(rows: matrixDim, cols: matrixDim)
    
    var curRow = matrixDim / 2
    var curCol = curRow
    var curValue = 1
    
    theMatrix.SetValueAt(row: curRow, col: curCol, value: curValue)
    curValue += 1
    
    var minRow = curRow - 1
    var maxRow = curRow + 1
    var minCol = curCol - 1
    var maxCol = curCol + 1
    
    curCol += 1
    
    while curCol < matrixDim
    {
        while curRow >= minRow
        {
            theMatrix.SetValueAt(row: curRow, col: curCol, value: curValue)
            curValue += 1
            
            curRow -= 1
        }
        curRow += 1
        curCol -= 1
        
        while curCol >= minCol
        {
            theMatrix.SetValueAt(row: curRow, col: curCol, value: curValue)
            curValue += 1
            
            curCol -= 1
        }
        curCol += 1
        curRow += 1
        
        while curRow <= maxRow
        {
            theMatrix.SetValueAt(row: curRow, col: curCol, value: curValue)
            curValue += 1
            
            curRow += 1
        }
        curRow -= 1
        curCol += 1
        
        while curCol <= maxCol
        {
            theMatrix.SetValueAt(row: curRow, col: curCol, value: curValue)
            curValue += 1
            
            curCol += 1
        }
        
        minRow -= 1
        minCol -= 1
        maxCol += 1
        maxRow += 1
        
    }
    
    return theMatrix
    
}
