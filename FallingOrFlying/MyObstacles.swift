//
//  MyObstacles.swift
//  FallingOrFlying
//
//  Created by Sean Kim on 2015-11-18.
//  Copyright © 2015 Sean Kim. All rights reserved.
//

import Foundation
import SpriteKit

class MyObstacles: SKSpriteNode
{
    //var obstacleHeight:CGFloat!
    var obstacleColour:UIColor!
    //var obstacleWidth:CGFloat!
    
    
    
    init(obstacleColour:UIColor, obstacleWidth: CGFloat, obstacleHeight:CGFloat) {
        super.init(texture: nil, color: obstacleColour, size: CGSizeMake(obstacleWidth,obstacleHeight))
        let obstacleSize = CGSize(width: obstacleWidth, height: obstacleHeight)
        physical(obstacleSize)
        movingUp()
        
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func movingUp()
    {
        let moveUp = SKAction.moveByX(0, y: frame.size.height*44*5.0, duration: (3.08*5.0))
        
        runAction(moveUp)
    }
    func stopMoving()
    {
        removeAllActions()
    }
    func physical(paraSize: CGSize)
    {
        physicsBody = SKPhysicsBody(rectangleOfSize: paraSize)
        physicsBody?.categoryBitMask = obstacleC
        physicsBody?.affectedByGravity = false

    }
}