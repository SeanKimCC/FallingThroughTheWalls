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
    @IBOutlet var viewLeft: UIView!
    @IBOutlet var viewRight: UIView!
    
    let longPressRec = UILongPressGestureRecognizer()
    let tapRec = UITapGestureRecognizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let skView = self.view as! SKView
        skView.multipleTouchEnabled = false
        
        scene = GameScene(size:skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
        
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
