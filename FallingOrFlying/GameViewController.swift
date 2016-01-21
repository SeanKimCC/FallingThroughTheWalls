//
//  GameViewController.swift
//  FallingOrFlying
//
//  Created by Sean Kim on 2015-11-17.
//  Copyright (c) 2015 Sean Kim. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    var scene: GameScene!
    
    
    @IBOutlet weak var lblScore: UILabel!
    var score:Int = -8
    var scoreTimer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let skView = self.view as! SKView
        skView.multipleTouchEnabled = false
        
        scene = GameScene(size:skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
        scene.gameViewCont = self
        lblScore.hidden = true
        lblScore.font = lblScore.font.fontWithSize(40)
        
        /*longPressRec.addTarget(self, action: "viewLeft")
        tapRec.addTarget(self, action: "viewLeft")
        longPressRec.addTarget(self, action: "viewRight")
        tapRec.addTarget(self, action: "viewRight")
        
        viewLeft.addGestureRecognizer(longPressRec)
        viewRight.addGestureRecognizer(longPressRec)
        
        viewLeft.userInteractionEnabled = true
        viewRight.userInteractionEnabled = true*/
        
        super.viewDidLoad()
        
        
        
        
    }
    func scores()
    {
        score += 1
        if score == 0
        {
            lblScore.hidden = false
        }
        lblScore.text = String(score)
    }
    func startScoring()
    {
        scoreTimer = NSTimer.scheduledTimerWithTimeInterval(0.14, target: self, selector: "scores", userInfo: nil, repeats: true)
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
