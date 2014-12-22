//
//  LineShape.swift
//  Nhat_tetris
//
//  Created by Đinh Văn Nhật on 2014/12/21.
//  Copyright (c) 2014年 nhat. All rights reserved.
//

import Foundation
class LineShape:Shape {
    /*
    Orientations 0 and 180: 
        | *0|
        | 1 |
        | 2 |
        | 3 |
    
    Orientations 90 and 270:
     | *0 | 1 | 2 | 3 |
    */
    override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orientation.Zero: [(0, 0), (0, 1), (0, 2), (0, 3)],
            Orientation.Ninety: [(0, 0), (1, 0), (2, 0), (3, 0)],
            Orientation.OneEighty: [(0, 0), (0, 1), (0, 2), (0, 3)],
            Orientation.TwoSeventy: [(0, 0), (1, 0), (2, 0), (3, 0)]
        ]
    }
    
    override var bottomBlocksForOrientations: [Orientation: Array<Block>] {
        return [
            Orientation.Zero:       [blocks[FourthBlockIdx]],
            Orientation.Ninety:     blocks,
            Orientation.OneEighty:  [blocks[FourthBlockIdx]],
            Orientation.TwoSeventy: blocks
        ]
    }
}