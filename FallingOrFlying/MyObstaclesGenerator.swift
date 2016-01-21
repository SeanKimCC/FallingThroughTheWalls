//
//  MyObstaclesGenerator.swift
//  FallingOrFlying
//
//  Created by Sean Kim on 2015-11-18.
//  Copyright © 2015 Sean Kim. All rights reserved.
//

import Foundation
import SpriteKit

class MyObstaclesGenerator: SKSpriteNode
{
    var obstaclesTimer: NSTimer?
    var arraySize = Int(0)
    var obstacleArray = [MyObstacles]()
    
    func startGenerateObstacleEvery(seconds:NSTimeInterval) // add a parameter for size here, and 
    {
        obstaclesTimer = NSTimer.scheduledTimerWithTimeInterval(seconds, target: self, selector: "GenerateObstacle", userInfo: nil, repeats: true)
        
    }
    
    func GenerateObstacle()
    {
        var colorValue: CGFloat!
        var randNum: UInt32!
        var counter:CGFloat = 0
        var leftWidth = CGFloat(size.width/5);
        var rightWidth = CGFloat(size.width - leftWidth - size.width/2)
        var leftObstacle:MyObstacles!
        //var leftObstacle = MyObstacles(obstacleColour: UIColor.blackColor(), obstacleWidth: leftWidth, obstacleHeight: CGFloat(size.height/20))
        var rightObstacle:MyObstacles!
        //var rightObstacle = MyObstacles(obstacleColour: UIColor.blackColor(), obstacleWidth: rightWidth, obstacleHeight: CGFloat(size.height/20))
        //leftObstacle.position.x = -size.width/2 + leftWidth/2 + size.width/18
        //leftObstacle.position.y = -size.height/2 // - size.width/18
        
        //rightObstacle.position.x = size.width/2 - rightWidth/2 - size.width/18
        //rightObstacle.position.y = -size.height/2 // - size.width/18
        //addChild(leftObstacle)
        //addChild(rightObstacle)
        var keepTrack = Int(0)
        
        obstacleArray = [MyObstacles]()
        for var j = 0; j < 10; j++
        {
    
            randNum = arc4random_uniform(2)
            if j == 9
            {
                for var k = 0; k < 5; k++
                {
                    
                    if keepTrack > 0
                    {
                        keepTrack -= 1
                        leftWidth -= CGFloat(size.width/20)
                    }
                    else if keepTrack < 0
                    {
                        keepTrack += 1
                        leftWidth += CGFloat(size.width/20)
                    }
                    
                    counter = counter + 1
                    if counter > 25
                    {
                        colorValue = 255 - (10.2 * (counter-25))
                    }
                    else
                    {
                        colorValue = 10.2 * counter
                    }
                    rightWidth = CGFloat(size.width - leftWidth - size.width/2)
                    leftObstacle = MyObstacles(obstacleColour: UIColor(red: colorValue/255, green: colorValue/255, blue: colorValue/255, alpha: 1.0) , obstacleWidth: leftWidth, obstacleHeight: CGFloat(size.height/20))
                    
                    rightObstacle = MyObstacles(obstacleColour: UIColor(red: colorValue/255, green: colorValue/255, blue: colorValue/255, alpha: 1.0), obstacleWidth: rightWidth, obstacleHeight: CGFloat(size.height/20))
                    
                    
                    //leftObstacle = MyObstacles(obstacleColour: UIColor.blackColor(), obstacleWidth: leftWidth, obstacleHeight: CGFloat(size.height/20))
                    //rightObstacle = MyObstacles(obstacleColour: UIColor.blackColor(), obstacleWidth: rightWidth, obstacleHeight: CGFloat(size.height/20))
                    leftObstacle.position.x = -size.width/2 + leftWidth/2 + size.width/18
                    leftObstacle.position.y = -size.height/2 - (counter)*(size.height/10)//- (counter+i)*(size.height/20) // - size.width/18
                    
                    rightObstacle.position.x = size.width/2 - rightWidth/2 - size.width/18
                    rightObstacle.position.y = -size.height/2 - (counter)*(size.height/10)//- size.width/18
                    
                    obstacleArray.append(leftObstacle)
                    obstacleArray.append(rightObstacle)
                    addChild(leftObstacle)
                    addChild(rightObstacle)
                    arraySize += 2

                    
                }
                
            }
            else
            {
                if randNum == 0
                {
                    
                    for var i = 1; i < 6; i++
                    {
                        if leftWidth >= CGFloat(size.width/20)
                        {
                            keepTrack -= 1
                            leftWidth -= CGFloat(size.width/20)
                        }
                        else
                        {
                            keepTrack += 2
                            leftWidth += CGFloat(size.width/10)
                        }
                        counter = counter + 1
                        if counter > 25
                        {
                            colorValue = 255 - (10.2 * (counter-25))
                        }
                        else
                        {
                            colorValue = 10.2 * counter
                        }
                        rightWidth = CGFloat(size.width - leftWidth - size.width/2)
                        leftObstacle = MyObstacles(obstacleColour: UIColor(red: colorValue/255, green: colorValue/255, blue: colorValue/255, alpha: 1.0) , obstacleWidth: leftWidth, obstacleHeight: CGFloat(size.height/20))
                        
                        rightObstacle = MyObstacles(obstacleColour: UIColor(red: colorValue/255, green: colorValue/255, blue: colorValue/255, alpha: 1.0), obstacleWidth: rightWidth, obstacleHeight: CGFloat(size.height/20))
                        //leftObstacle = MyObstacles(obstacleColour: UIColor.blackColor(), obstacleWidth: leftWidth, obstacleHeight: CGFloat(size.height/20))
                        //rightObstacle = MyObstacles(obstacleColour: UIColor.blackColor(), obstacleWidth: rightWidth, obstacleHeight: CGFloat(size.height/20))
                        leftObstacle.position.x = -size.width/2 + leftWidth/2 + size.width/18
                        leftObstacle.position.y = -size.height/2 - (counter)*(size.height/10)//- (counter+i)*(size.height/20) // - size.width/18
                        
                        rightObstacle.position.x = size.width/2 - rightWidth/2 - size.width/18
                        rightObstacle.position.y = -size.height/2 - (counter)*(size.height/10)//- size.width/18
                        obstacleArray.append(leftObstacle)
                        obstacleArray.append(rightObstacle)
                        addChild(leftObstacle)
                        addChild(rightObstacle)
                        arraySize += 2

                        //counter = counter + 1
                    }
                }
                else
                {
                    for var i = 1; i < 6; i++
                    {
                        if rightWidth >= CGFloat(size.width/20)
                        {
                            keepTrack += 1
                            leftWidth += CGFloat(size.width/20)
                        }
                        else
                        {
                            keepTrack -= 2
                            leftWidth -= CGFloat(size.width/10)
                        }
                        counter = counter + 1
                        if counter > 25
                        {
                            colorValue = 255 - (10.2 * (counter-25))
                        }
                        else
                        {
                            colorValue = 10.2 * counter
                        }
                        rightWidth = CGFloat(size.width - leftWidth - size.width/2)
                        leftObstacle = MyObstacles(obstacleColour: UIColor(red: colorValue/255, green: colorValue/255, blue: colorValue/255, alpha: 1.0) , obstacleWidth: leftWidth, obstacleHeight: CGFloat(size.height/20))
                        
                        rightObstacle = MyObstacles(obstacleColour: UIColor(red: colorValue/255, green: colorValue/255, blue: colorValue/255, alpha: 1.0), obstacleWidth: rightWidth, obstacleHeight: CGFloat(size.height/20))
                        //leftObstacle = MyObstacles(obstacleColour: UIColor.blackColor(), obstacleWidth: leftWidth, obstacleHeight: CGFloat(size.height/20))
                        //rightObstacle = MyObstacles(obstacleColour: UIColor.blackColor(), obstacleWidth: rightWidth, obstacleHeight: CGFloat(size.height/20))
                        leftObstacle.position.x = -size.width/2 + leftWidth/2 + size.width/18
                        leftObstacle.position.y = -size.height/2 - (counter)*(size.height/10)// - size.width/18
                        
                        rightObstacle.position.x = size.width/2 - rightWidth/2 - size.width/18
                        rightObstacle.position.y = -size.height/2 -  (counter)*(size.height/10) // - size.width/18 - size.height
                        obstacleArray.append(leftObstacle)
                        obstacleArray.append(rightObstacle)
                        addChild(leftObstacle)
                        addChild(rightObstacle)
                        arraySize += 2

                    }
                }
            }
        }
        //deleteObstacles(100)
        
    }
    // go around the loop by making GenerateObstacle func to have constant starting and ending leftWidth.
    //create a whole screen of walls at a time. If rand = 0, the width of right wall decreases for all ten. else, the width of left wall decreases for all ten (there is constant space between walls)
    func deleteObstacles(num: Int)
    {
        for var count = 0; count < num; count++
        {
            obstacleArray[count].removeFromParent()
        }
    }
    func stop()
    {
        obstaclesTimer?.invalidate()
        for var i = 0; i < 100; i++
        {
            obstacleArray[i].removeAllActions()
        }

    }
    
}