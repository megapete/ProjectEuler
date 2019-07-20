//
//  Project_18.swift
//  ProjectEuler
//
//  Created by Peter Huber on 2019-07-15.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation


class Node {
    
    // var parent:Node?
    
    var leftChild:Node?
    var rightChild:Node?
    
    let value:Int
    
    var isLeaf:Bool
    {
        get {
            return leftChild == nil && rightChild == nil
        }
    }
    
    init(value:Int, leftChild:Node?, rightChild:Node?)
    {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
        // self.parent = parent
    }
}

func Project18()
{
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let fileURL = paths[0].appendingPathComponent("Project18.txt")
    
    print(fileURL)
    
    do {
        
        let fileString = try String(contentsOf: fileURL)
        
        let lineArray = fileString.components(separatedBy: "\n")
        
        let tree = CreateTreeFromLineArray(lineArray: lineArray)
        
        let maxSum = GetMaxSumFrom(fromNode: tree, sumSoFar: 0)
        
        print(maxSum)
    
    } catch {
        
    }
}


func GetMaxSumFrom(fromNode:Node, sumSoFar: Int) -> Int
{
    if fromNode.isLeaf
    {
        return sumSoFar + fromNode.value
    }
    
    let leftSum = sumSoFar + fromNode.value + GetMaxSumFrom(fromNode: fromNode.leftChild!, sumSoFar: sumSoFar)
    let rightSum = sumSoFar + fromNode.value + GetMaxSumFrom(fromNode: fromNode.rightChild!, sumSoFar: sumSoFar)
    
    return max(leftSum, rightSum)
}


func CreateTreeFromLineArray(lineArray:[String]) -> Node
{
    // it is assumed that the first string in the lineArray is the top-most line of the triangle (leafs)
    let head = Node(value: Int(lineArray[0])!, leftChild: nil, rightChild: nil)
    
    var previousLevel = [head]
    
    for i in 1..<lineArray.count
    {
        let nextLevel = NodeArrayFromIntArray(ints: IntArrayFromString(nodeString: lineArray[i]))
        
        for parentIndex in 0..<previousLevel.count
        {
            previousLevel[parentIndex].leftChild = nextLevel[parentIndex]
            previousLevel[parentIndex].rightChild = nextLevel[parentIndex+1]
        }
        
        previousLevel = nextLevel
    }
    
    return head
}

func NodeArrayFromIntArray(ints:[Int]) -> [Node]
{
    var result:[Node] = []
    
    for nextInt in ints
    {
        result.append(Node(value: nextInt, leftChild: nil, rightChild: nil))
    }
    
    return result
}

func IntArrayFromString(nodeString:String) -> [Int]
{
    let nodeValueStringArray = nodeString.components(separatedBy: " ")
    
    var result:[Int] = []
    
    for nextValue in nodeValueStringArray
    {
        result.append(Int(nextValue)!)
    }
    
    return result
}
