//
//  Project_61.swift
//  ProjectEuler
//
//  Created by PeterCoolAssHuber on 2019-08-28.
//  Copyright © 2019 Peter Huber. All rights reserved.
//

import Foundation

func Project61()
{
    // generate 4-digit triangle numbers
    var triangles:[Int] = []
    for n in 45..<141
    {
        triangles.append(n * (n + 1) / 2)
    }
    
    // generate 4-digit square numbers
    var squares:[Int] = []
    for n in 32..<100
    {
        squares.append(n * n)
    }
    
    // generate 4-digit pentagonal numbers
    var pentagonals:[Int] = []
    for n in 26..<82
    {
        pentagonals.append(n * (3 * n - 1) / 2)
    }
    
    // generate 4-digit hexagonal numbers
    var hexagonals:[Int] = []
    for n in 23..<71
    {
        hexagonals.append(n * (2 * n - 1))
    }
    
    // generate 4-digit heptagonal numbers
    var heptagonals:[Int] = []
    for n in 21..<64
    {
        heptagonals.append(n * (5 * n - 3) / 2)
    }
    
    // generate 4-digit octagonal numbers
    var octagonals:[Int] = []
    for n in 19..<59
    {
        octagonals.append(n * (3 * n - 2))
    }
    
    var figurates:[([Int], FigurateType)] = [(squares, .square), (pentagonals, .pentagonal)]
    
    for nextTriangle in triangles
    {
        let newTopNode = CycleNode(value: nextTriangle, type: .triangle)
        
        for nextFig in figurates
        {
            newTopNode.AddChildren(fromNumbers: nextFig.0, type: nextFig.1)
        }
    }
    
}

enum FigurateType {
    
    case triangle
    case square
    case pentagonal
    case hexagonal
    case heptagonal
    case octagonal
}

class CycleNode:Equatable
{
    // required function for Equitable
    static func == (lhs: CycleNode, rhs: CycleNode) -> Bool {
        
        return lhs.value == rhs.value && lhs.type == rhs.type
    }
    
    let value:Int
    let type:FigurateType
    
    var parent:CycleNode?
    
    var children:[CycleNode] = []
    
    init(value:Int, type:FigurateType, parent:CycleNode? = nil)
    {
        self.value = value
        self.type = type
        self.parent = parent
    }
    
    func Depth() -> Int
    {
        // As long as the tree was created with the AddChildren routine, it is guaranteed that all the existing children go to the same depth.
        
        // self is at depth 1
        var result = 1
        var currentNode = self
        
        while currentNode.children.count != 0
        {
            result += 1
            currentNode = currentNode.children[0]
        }
        
        return result
    }
    
    func AddChildren(fromNumbers:[Int], type:FigurateType)
    {
        // don't add children whose type is already in the ancestry
        if GetAncestorTypes().contains(type)
        {
            return
        }
        
        let targetDigits = self.value % 100
        
        let numChildren = self.children.count
        
        for nextNumber in fromNumbers
        {
            if nextNumber / 100 == targetDigits
            {
                self.children.append(CycleNode(value: nextNumber, type: type, parent: self))
            }
        }
        
        // if no children were added, we delete ourselves from the list
        if self.children.count == numChildren
        {
            if let ancestor = self.parent
            {
                ancestor.RemoveChild(child: self)
            }
        }
    }
    
    func RemoveChild(child:CycleNode)
    {
        if let childIndex = self.children.firstIndex(of: child)
        {
            self.children.remove(at: childIndex)
        }
    }
    
    func GetAncestorTypes() -> [FigurateType]
    {
        var result = [self.type]
        var currentSelf = self
        
        while let nextParent = currentSelf.parent
        {
            result.append(nextParent.type)
            currentSelf = nextParent
        }
        
        return result
    }
}

func IntPow(n:Int, power:Int) -> Int
{
    // be careful not to go too high with this function
    
    // do the lower powers trivially
    if power == 0
    {
        return 1
    }
    else if power == 1
    {
        return n
    }
    else if power == 2
    {
        return n * n
    }
    else if power == 3
    {
        return n * n * n
    }
    else if power == 4
    {
        return n * n * n * n
    }
    else if power == 5
    {
        return n * n * n * n * n
    }
    
    var result = 1
    
    for _ in 1...power
    {
        result *= n
    }
    
    return result
}
