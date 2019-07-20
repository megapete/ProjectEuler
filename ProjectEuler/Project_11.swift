//
//  Project_11.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-11.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project11()
{
    let matrixDimn = 20
    
    let theMatrix = matrix(rows: matrixDimn, cols: matrixDimn)
    
    var rowString = "08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08"
    
    var currentRow = 0
    
    theMatrix.SetRow(rowNum: currentRow, values: ConvertRowStringToIntArray(rowString: rowString))
    currentRow += 1
    
    rowString = "49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00"
    
    theMatrix.SetRow(rowNum: currentRow, values: ConvertRowStringToIntArray(rowString: rowString))
    currentRow += 1
    
    rowString = "81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65"
    
    theMatrix.SetRow(rowNum: currentRow, values: ConvertRowStringToIntArray(rowString: rowString))
    currentRow += 1
    
    rowString = "52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91"
    
    theMatrix.SetRow(rowNum: currentRow, values: ConvertRowStringToIntArray(rowString: rowString))
    currentRow += 1
    
    rowString = "22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80"
    
    theMatrix.SetRow(rowNum: currentRow, values: ConvertRowStringToIntArray(rowString: rowString))
    currentRow += 1
    
    rowString = "24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50"
    
    theMatrix.SetRow(rowNum: currentRow, values: ConvertRowStringToIntArray(rowString: rowString))
    currentRow += 1
    
    rowString = "32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70"
    
    theMatrix.SetRow(rowNum: currentRow, values: ConvertRowStringToIntArray(rowString: rowString))
    currentRow += 1
    
    rowString = "67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21"
    
    theMatrix.SetRow(rowNum: currentRow, values: ConvertRowStringToIntArray(rowString: rowString))
    currentRow += 1
    
    rowString = "24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72"
    
    theMatrix.SetRow(rowNum: currentRow, values: ConvertRowStringToIntArray(rowString: rowString))
    currentRow += 1
    
    rowString = "21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95"
    
    theMatrix.SetRow(rowNum: currentRow, values: ConvertRowStringToIntArray(rowString: rowString))
    currentRow += 1
    
    rowString = "78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92"
    
    theMatrix.SetRow(rowNum: currentRow, values: ConvertRowStringToIntArray(rowString: rowString))
    currentRow += 1
    
    rowString = "16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57"
    
    theMatrix.SetRow(rowNum: currentRow, values: ConvertRowStringToIntArray(rowString: rowString))
    currentRow += 1
    
    rowString = "86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58"
    
    theMatrix.SetRow(rowNum: currentRow, values: ConvertRowStringToIntArray(rowString: rowString))
    currentRow += 1
    
    rowString = "19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40"
    
    theMatrix.SetRow(rowNum: currentRow, values: ConvertRowStringToIntArray(rowString: rowString))
    currentRow += 1
    
    rowString = "04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66"
    
    theMatrix.SetRow(rowNum: currentRow, values: ConvertRowStringToIntArray(rowString: rowString))
    currentRow += 1
    
    rowString = "88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69"
    
    theMatrix.SetRow(rowNum: currentRow, values: ConvertRowStringToIntArray(rowString: rowString))
    currentRow += 1
    
    rowString = "04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36"
    
    theMatrix.SetRow(rowNum: currentRow, values: ConvertRowStringToIntArray(rowString: rowString))
    currentRow += 1
    
    rowString = "20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16"
    
    theMatrix.SetRow(rowNum: currentRow, values: ConvertRowStringToIntArray(rowString: rowString))
    currentRow += 1
    
    rowString = "20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54"
    
    theMatrix.SetRow(rowNum: currentRow, values: ConvertRowStringToIntArray(rowString: rowString))
    currentRow += 1
    
    rowString = "01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48"
    
    theMatrix.SetRow(rowNum: currentRow, values: ConvertRowStringToIntArray(rowString: rowString))
    
    var maxPos = (0, 0)
    var maxDir = 0
    var maxProduct = 0
    
    for row in 0..<matrixDimn
    {
        for col in 0..<matrixDimn
        {
            for dir in stride(from: 0, through: 315, by: 45)
            {
                let check = theMatrix.ProductFromLocation(pos: (row, col), direction: dir, numValues: 4)
                
                if check > maxProduct
                {
                    maxProduct = check
                    maxPos = (row, col)
                    maxDir = dir
                }
            }
        }
    }
    
    print("Maximum product: \(maxProduct) at \(maxPos), direction \(maxDir) degrees")
}



func ConvertRowStringToIntArray(rowString:String) -> [Int]
{
    let strArray = rowString.components(separatedBy: " ")
    
    var result:[Int] = []
    
    for nextString in strArray
    {
        result.append(Int(nextString)!)
    }
    
    return result
}

class matrix {
    
    let rows:Int
    let cols:Int
    
    var values:[Int]
    
    init(rows:Int, cols:Int)
    {
        self.rows = rows
        self.cols = cols
        
        values = [Int](repeating: 0, count: rows * cols)
    }
    
    func ValueAt(row:Int, col:Int) -> Int
    {
        // column major
        return values[row + col * self.rows]
    }
    
    func SetValueAt(row:Int, col:Int, value:Int)
    {
        values[row + col * self.rows] = value
    }
    
    func SetRow(rowNum:Int, values:[Int])
    {
        for col in 0..<values.count
        {
            SetValueAt(row: rowNum, col: col, value: values[col])
        }
    }
    
    func Print()
    {
        var printString = ""
        for row in 0..<self.rows
        {
            for col in 0..<self.cols
            {
                printString += "\(ValueAt(row: row, col: col))\t"
            }
            
            printString += "\n"
        }
        
        print(printString)
    }
    
    func ProductFromLocation(pos:(row:Int, col:Int), direction:Int, numValues:Int) -> Int
    {
        // Direction is in positive "degrees" and can be any of 0,45,90,135,180,225,270,315
        
        // Default is 0 degrees
        var colAdder = 1
        var rowAdder = 0
        
        switch direction {
        case 45:
            colAdder = 1
            rowAdder = -1
        case 90:
            colAdder = 0
            rowAdder = -1
        case 135:
            colAdder = -1
            rowAdder = -1
        case 180:
            colAdder = -1
            rowAdder = 0
        case 225:
            colAdder = -1
            rowAdder = 1
        case 270:
            colAdder = 0
            rowAdder = 1
        case 315:
            colAdder = 1
            rowAdder = 1
        default:
            colAdder = 1
            rowAdder = 0
        }
        
        // We really should do error-checking, but....
        var currentRow = pos.row
        var currentCol = pos.col
        
        var result = self.ValueAt(row: currentRow, col: currentCol)
        
        for _ in 1..<numValues
        {
            currentRow += rowAdder
            currentCol += colAdder
            
            if currentRow < 0 || currentRow >= self.rows || currentCol < 0 || currentCol >= self.cols
            {
                print("Bad index")
                return 0
            }
            
            result *= self.ValueAt(row: currentRow, col: currentCol)
        }
        
        return result
    }
}
