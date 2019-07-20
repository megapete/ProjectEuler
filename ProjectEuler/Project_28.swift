//
//  Project_28.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-18.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project28()
{
    let theMatrix = CreateSprialMatrix(dim: 1001)
    
    print(DiagonalSum(matrix: theMatrix))
}

func DiagonalSum(matrix:matrix) -> Int
{
    var sum = 0
    
    for i in 0..<matrix.cols
    {
        // print(matrix.ValueAt(row: i, col: i))
        sum += matrix.ValueAt(row: i, col: i)
    }
    
    var col = matrix.cols - 1
    for row in 0..<matrix.rows
    {
        if row != col
        {
            // print(matrix.ValueAt(row: row, col: col))
            sum += matrix.ValueAt(row: row, col: col)
        }
        
        col -= 1
    }
    
    return sum
}

func CreateSprialMatrix(dim:Int) -> matrix
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
        while curRow <= maxRow
        {
            theMatrix.SetValueAt(row: curRow, col: curCol, value: curValue)
            curValue += 1
            
            curRow += 1
        }
        curRow -= 1
        curCol -= 1
        
        while curCol >= minCol
        {
            theMatrix.SetValueAt(row: curRow, col: curCol, value: curValue)
            curValue += 1
            
            curCol -= 1
        }
        curCol += 1
        curRow -= 1
        
        while curRow >= minRow
        {
            theMatrix.SetValueAt(row: curRow, col: curCol, value: curValue)
            curValue += 1
            
            curRow -= 1
        }
        curRow += 1
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
