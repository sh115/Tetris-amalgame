//
//  GameBoardArray.swift
//  Tetris-amalgame
//
//  Created by Sangmin Han on 4/25/17.
//  Copyright © 2017 Sangmin Han. All rights reserved.
//

class GameBoardArray<T> {
    let columns: Int
    let rows: Int
    var array: Array<T?>
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        array = Array<T?>(repeating: nil, count: rows * columns)
    }
    
    subscript(column: Int, row: Int) -> T? {
        get {
            return array[(row * columns) + column]
        }
        set(newValue) {
            array[(row * columns) + column] = newValue
        }
    }
}
