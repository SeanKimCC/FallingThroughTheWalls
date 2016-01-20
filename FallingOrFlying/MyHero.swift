//
//  MyHero.swift
//  FallingOrFlying
//
//  Created by Sean Kim on 2015-11-18.
//  Copyright © 2015 Sean Kim. All rights reserved.
//

import Foundation
import SpriteKit

class MyHero: SKSpriteNode {
    var leftArm: SKSpriteNode!
    var rightArm: SKSpriteNode!

    var eyeBrows: SKSpriteNode!
    
    init()
    {
        super.init(texture: nil, color: UIColor.clearColor(), size: CGSizeMake(36,54))
        let bodyTopColor = UIColor(red: 250/255, green: 50/255, blue: 50/255, alpha: 1.0) // allow custom color
        let bodyTop = SKSpriteNode(texture: nil, color: bodyTopColor, size: CGSizeMake(36, 24))
        bodyTop.position = CGPointMake(0, 3)
        addChild(bodyTop)
        
        let legDivider = SKSpriteNode(texture: nil, color: UIColor.blackColor(), size: CGSizeMake(1,12))
        let bodyBottomColor = UIColor(red: 100/255, green:100/255, blue: 100/255, alpha: 1.0)
        let bodyBottom = SKSpriteNode(texture: nil, color: UIColor.clearColor(), size: CGSizeMake(36,12))
        let bodyBottomLeft = SKSpriteNode(texture: nil, color: bodyBottomColor, size: CGSizeMake(18, 12))
        let bodyBottomRight = SKSpriteNode(texture: nil, color: bodyBottomColor, size: CGSizeMake(18, 12))
        
        addChild(bodyBottom)
        
        bodyBottom.position = CGPointMake(0, -15)
        bodyBottom.addChild(bodyBottomLeft)
        bodyBottom.addChild(bodyBottomRight)
        bodyBottom.addChild(legDivider)
        bodyBottomLeft.position = CGPointMake(-9,0)
        bodyBottomRight.position = CGPointMake(9,0)
        legDivider.position = CGPointMake(0, 0)
        
        
        
        let skinColor = UIColor(red: 207.0/255.0, green: 193.0/255.0, blue: 168.0/255.0, alpha: 1.0)
        let face = SKSpriteNode(texture: nil, color: skinColor, size: CGSizeMake(36, 20))
        face.position = CGPointMake(0, 25)
        addChild(face)
        
        let leftFoot = SKSpriteNode(texture: nil, color: skinColor, size: CGSizeMake(12, 6))
        let rightFoot = SKSpriteNode(texture: nil, color: skinColor, size: CGSizeMake(12, 6))
        leftFoot.position = CGPointMake(-9,-24)
        rightFoot.position = CGPointMake(9,-24)
        addChild(leftFoot)
        addChild(rightFoot)
        
        leftArm = SKSpriteNode(texture:nil, color: UIColor.blackColor(), size: CGSizeMake(6,24)) // 24-6
        rightArm = SKSpriteNode(texture:nil, color: UIColor.blackColor(), size: CGSizeMake(6,24)) // position(x,6) +-(18+3)
        leftArm.position = CGPointMake(-21, 3)
        rightArm.position = CGPointMake(21, 3)
        addChild(leftArm)
        addChild(rightArm)
        let leftHand = SKSpriteNode(texture: nil, color: skinColor, size: CGSizeMake(6,4))
        let rightHand = SKSpriteNode(texture: nil, color: skinColor, size: CGSizeMake(6,4))
        leftArm.addChild(leftHand)
        rightArm.addChild(rightHand)
        leftHand.position = CGPointMake(0,-10)
        rightHand.position = CGPointMake(0,-10)

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func startShaking()
    {
        //let moveLeft = SKAction.moveByX(-5, y: 0, duration: 1.0)
        let moveRight = SKAction.moveByX(6, y: 0, duration: 0.9)
        let moveLeft = SKAction.moveByX(-6, y: 0, duration: 0.9)
        let moveUp = SKAction.moveBy(CGVector(dx: 0, dy: 3), duration: 0.45)
        let moveDown = SKAction.moveBy(CGVector(dx: 0, dy: -3), duration: 0.45)
        let initialLeft = SKAction.moveByX(-3, y: 0, duration: 0.45)
        let sequenceShake = SKAction.sequence([moveRight,moveLeft])
        let sequenceUpAndDown = SKAction.sequence([moveDown,moveUp])
        
        runAction(initialLeft, completion: { () -> Void in
            self.runAction(SKAction.repeatActionForever(sequenceShake))
            self.runAction(SKAction.repeatActionForever(sequenceUpAndDown))
            })
        

                
        
        
        
    }
    func move(x: Int)
    {
        let moveSide = SKAction.moveByX(CGFloat(x*6), y: 0, duration: 0.05)
        self.runAction(SKAction.repeatActionForever(moveSide))
    }
}
