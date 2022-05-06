//
//  DVDScene.swift
//  DVD_ScreenSaver
//
//  Created by Terry Kuo on 2022/5/6.
//

import UIKit
import SpriteKit

class DVDScene: SKScene {
    var dvdLogoNode = SKSpriteNode()
    
    private var changeColor: SKAction {
        return SKAction.colorize(with: UIColor.generateRandomColor(), colorBlendFactor: 1.0, duration: 0)
    }
    
    var moveTransform = CGAffineTransform()
    var moveSpeed: CGFloat = 2
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        moveTransform = CGAffineTransform(translationX: moveSpeed, y: moveSpeed)
        dvdLogoNode.texture = SKTexture(imageNamed: "dvd-2")
        dvdLogoNode.size = CGSize(width: 100, height: 50)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(dvdLogoNode)
        dvdLogoNode.run(changeColor)
    }
    
    override func update(_ currentTime: TimeInterval) {
        let currentFrame = dvdLogoNode.calculateAccumulatedFrame()
        
        if currentFrame.maxY >= self.frame.maxY { //colliding top of the screen
            moveTransform.ty = -moveSpeed
            dvdLogoNode.run(changeColor)
        }
        
        if currentFrame.maxX >= self.frame.maxX { //colliding right of the screen
            moveTransform.tx = -moveSpeed
            dvdLogoNode.run(changeColor)
        }
        
        if currentFrame.minY <= self.frame.minY { //colliding bottom of the screen
            moveTransform.ty = moveSpeed
            dvdLogoNode.run(changeColor)
        }
        
        if currentFrame.minX <= self.frame.minX { //colliding left of the screen
            moveTransform.ty = moveSpeed
            dvdLogoNode.run(changeColor)
        }
        
        dvdLogoNode.position = dvdLogoNode.position.applying(moveTransform)
        //move node position with transform
    }
}
