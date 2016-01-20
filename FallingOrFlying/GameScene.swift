//
//  GameScene.swift
//  FallingOrFlying
//
//  Created by Sean Kim on 2015-11-17.
//  Copyright (c) 2015 Sean Kim. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var hero: MyHero!
    var verticalWallLeft: MyWalls!
    var verticalWallRight: MyWalls!
    var obstacleGenerator: MyObstaclesGenerator! 
    var didItStart: Bool = false
    var firstTouch: Bool = false
    
    override func didMoveToView(view: SKView) {
        backgroundColor = UIColor(red: 184/255, green: 223/255, blue: 242/255, alpha: 1.0)
        hero = MyHero()
        hero.position = CGPointMake(self.frame.width/2, self.frame.height/2 + self.frame.height/3.5)
        addChild(hero)
        
        //verticalWallLeft = MyWalls(size: CGSizeMake(10, view.frame.height*2) , point: CGPointMake(5, view.frame.height/2 ))
        verticalWallLeft = MyWalls(size: CGSizeMake(view.frame.width/18, view.frame.height*2) , point: CGPointMake((view.frame.width/36), -view.frame.height))

        addChild(verticalWallLeft)
        //verticalWallRight = MyWalls(size: CGSizeMake(10, view.frame.height*2) , point: CGPointMake(view.frame.width-5, view.frame.height/2 ))
        verticalWallRight = MyWalls(size: CGSizeMake(view.frame.width/18, view.frame.height*2) , point: CGPointMake(view.frame.width-(view.frame.width/36), -view.frame.height))

        addChild(verticalWallRight)
        
        obstacleGenerator = MyObstaclesGenerator(color: UIColor.clearColor(), size: view.frame.size)
        obstacleGenerator.position = view.center
        addChild(obstacleGenerator)
        // test
        
        
    }
    func startEverything()
    {
        didItStart = true
        verticalWallLeft.start()
        verticalWallRight.start()
        hero.startShaking()
        obstacleGenerator.startGenerateObstacleEvery(1.4)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        if !didItStart {
            verticalWallLeft.start()
            verticalWallRight.start()
            hero.startShaking()
            obstacleGenerator.GenerateObstacle()
            
            obstacleGenerator.startGenerateObstacleEvery(1.4*5.0)
            didItStart = !didItStart
            firstTouch = true
        }
        else if firstTouch == true
        {
            
        }
        
        
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
