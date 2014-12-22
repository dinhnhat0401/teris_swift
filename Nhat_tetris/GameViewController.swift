//
//  GameViewController.swift
//  Nhat_tetris
//
//  Created by Đinh Văn Nhật on 2014/12/18.
//  Copyright (c) 2014年 nhat. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController, SwiftTrisDelegate, UIGestureRecognizerDelegate {
    
    var scene: GameScene!
    var swiftris:SwiftTris!
    
    var panPointReference:CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the view.
        let skView = view as SKView
        skView.multipleTouchEnabled = false
        
        // Create and configure the scene.
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        // #1
        scene.tick = didTick
        
        swiftris = SwiftTris()
        swiftris.delegate = self
        swiftris.beginGame()
        
        // Present the scene.
        skView.presentScene(scene)
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // #3
    func didTick() {
        swiftris.letShapeFall()
//        swiftris.fallingShape?.lowerShapeByOneRow()
//        scene.redrawShape(swiftris.fallingShape!, completion: {})
    }
    
    @IBAction func didTap(sender: UITapGestureRecognizer) {
        swiftris.rotateShape()
    }
    
    @IBAction func didPan(sender: UIPanGestureRecognizer) {
        let currentPoint = sender.translationInView(self.view)
        if let originalPoint = panPointReference {
            if abs(currentPoint.x - originalPoint.x) > (BlockSize * 0.9) {
                if sender.velocityInView(self.view).x > CGFloat(0) {
                    swiftris.moveShapeRight()
                    panPointReference = currentPoint
                } else {
                    swiftris.moveShapeLeft()
                    panPointReference = currentPoint
                }
            } else if sender.state == .Began {
                panPointReference = currentPoint
            }
        }
    }
    
    func nextShape() {
        let newShapes = swiftris.newShape()
        if let fallingShape = newShapes.fallingShape {
            self.scene.addPreviewShapeToScene(newShapes.nextShape!){}
            self.scene.movePreviewShape(fallingShape) {
                self.view.userInteractionEnabled = true
                self.scene.startTicking()
            }
        }
    }
    
    func gameDidBegin(swiftris: SwiftTris) {
        if swiftris.nextShape != nil && swiftris.nextShape!.blocks[0].sprite == nil {
            scene.addPreviewShapeToScene(swiftris.nextShape!) {
                self.nextShape()
            }
        } else {
            nextShape()
        }
    }
    
    func gameDidEnd(swiftris: SwiftTris) {
         view.userInteractionEnabled = false
        scene.stopTicking()
    }
    
    func gameDidLevelUp(swiftris: SwiftTris) {
        
    }
    
    func gameShapeDidDrop(swiftris: SwiftTris) {
        
    }
    
    func gameShapeDidLand(swiftris: SwiftTris) {
        scene.stopTicking()
        nextShape()
    }
    
    func gameShapeDidMove(swiftris: SwiftTris) {
        scene.redrawShape(swiftris.fallingShape!) {}
    }
}
