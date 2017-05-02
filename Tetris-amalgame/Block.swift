//
//  Block.swift
//  Tetris-amalgame
//
//  Created by Sangmin Han on 4/25/17.
//  Copyright © 2017 Sangmin Han. All rights reserved.
//

import SpriteKit

let NumberOfColors: UInt32 = 6

enum BlockColor: Int, CustomStringConvertible {
    
    case blue = 0, orange, purple, red, green, yellow
    
    var spriteName: String {
    var color_str = ""
    switch self {
    case .blue:
        color_str =  "blue"
        break
    case .orange:
        color_str =  "orange"
        break
    case .purple:
        color_str = "purple"
        break
    case .red:
        color_str = "red"
        break
    case .green:
        color_str = "green"
        break
    case .yellow:
        color_str = "yellow"
        break
        }
        return color_str
    }
    
    var description: String {
    return self.spriteName
    }
    
    static func random() -> BlockColor {
        return BlockColor(rawValue:Int(arc4random_uniform(NumberOfColors)))!
    }
    
}

class Block: Hashable, CustomStringConvertible {
    // Constants
    let color: BlockColor
    
    // Variables
    var column: Int
    var row: Int
    
    // Lazy loading
    var sprite: SKSpriteNode?
    
    var spriteName: String {
        return color.description
    }
    
    var hashValue: Int {
        return self.column ^ self.row
    }
    
    var description: String {
        return "\(color) (\(column), \(row))"
    }
    
    init(column:Int, row:Int, color:BlockColor) {
        self.column = column
        self.row = row
        self.color = color
    }
}

func ==(lhs: Block, rhs: Block) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.rawValue == rhs.color.rawValue
}
