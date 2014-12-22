//
//  LShape.swift
//  Nhat_tetris
//
//  Created by Đinh Văn Nhật on 2014/12/21.
//  Copyright (c) 2014年 nhat. All rights reserved.
//

import Foundation
class LShape:Shape {
    /*
    Orientation 0
          | 0*|
          | 1 |
          | 2 | 3 |
    
    Orientation 90
         | 2 | *1 | 0 |
         | 3 |
    
    Orientation 180
        | 3 | 2*|
            | 1 |
            | 0 |
    
    Orientation 270
            * | 3 |
      | 0 | 1 | 2 |
    */
    
    override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orientation.Zero: [(0, 0), (0, 1), (0, 2), (1, 2)],
            Orientation.Ninety: [(1, 0), (0, 0), (-1, 0), (-1, 1)],
            Orientation.OneEighty: [(0, 2), (0, 1), (0, 0), (-1, 0)],
            Orientation.TwoSeventy: [(-1, 1), (0, 1), (1, 1), (1, 0)]
        ]
    }
    
    override var bottomBlocksForOrientations: [Orientation: Array<Block>] {
        return [
            Orientation.Zero:       [blocks[ThirdBlockIdx], blocks[FourthBlockIdx]],
            Orientation.Ninety:     [blocks[FirstBlockIdx], blocks[SecondBlockIdx], blocks[FourthBlockIdx]],
            Orientation.OneEighty:  [blocks[FirstBlockIdx], blocks[FourthBlockIdx]],
            Orientation.TwoSeventy: [blocks[FirstBlockIdx], blocks[SecondBlockIdx], blocks[ThirdBlockIdx]]
        ]
    }
}