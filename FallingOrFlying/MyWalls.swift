//
//  MyWalls.swift
//  FallingOrFlying
//
//  Created by Sean Kim on 2015-11-17.
//  Copyright © 2015 Sean Kim. All rights reserved.
//

import Foundation
import SpriteKit

class MyWalls: SKSpriteNode
{
    let kNUM_SEGMENTS = 20
    var segment: SKSpriteNode!
    let kColorOne = UIColor.blackColor()
    let kColorTwo = UIColor.whiteColor()
    var goingUp: Bool = false;
    var timerWalls: NSTimer?
    
    init(size: CGSize, point: CGPoint)
    {
        super.init(texture: nil, color: UIColor.clearColor(), size: CGSizeMake(size.width, size.height))
        physical(size)
        
        
        anchorPoint = CGPointMake(0.5,0)
        var segmentColor: UIColor!
        for var i = -10; i < kNUM_SEGMENTS-10; i++ {
            if i % 2 == 0
            {
                segmentColor = kColorOne
            }
            else
            {
                segmentColor = kColorTwo
            }
            segment = SKSpriteNode(texture: nil, color: segmentColor, size: CGSizeMake(size.width, size.height / CGFloat(kNUM_SEGMENTS)))
            segment.position = CGPointMake(point.x, (CGFloat(i) + 0.5) * segment.size.height)
            addChild(segment)
            
            
        }
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func start()
    {
        let moveUp = SKAction.moveByX(0, y: frame.size.height/2, duration: 1.4)
        let comeBack = SKAction.moveToY(0, duration: 0)
        let moveSequence = SKAction.sequence([moveUp,comeBack])
        
        runAction(SKAction.repeatActionForever(moveSequence))
    }
    func flipGravity()
    {
        goingUp = !goingUp;
        
    }
    
    func physical(wallSize: CGSize)
    {
        physicsBody = SKPhysicsBody(rectangleOfSize: wallSize)
        physicsBody?.categoryBitMask = obstacleC
        physicsBody?.affectedByGravity = false

    }
}
