//
//  GameViewController.swift
//  SpaceInvaders
//
//  Copyright (c) 2016 bluecloudws. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

class GameViewController: UIViewController {

    var backingAudio = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let filePath = NSBundle.mainBundle().pathForResource("backing-track", ofType: "m4a")
        let audioNSURL = NSURL(fileURLWithPath: filePath!)

        do { backingAudio = try AVAudioPlayer(contentsOfURL: audioNSURL) }
        catch { return print("Cannot find Audio") }
        
        backingAudio.numberOfLoops = -1
        backingAudio.volume = 0.5
        backingAudio.play()
        
        let scene = MainMenuScene(size: CGSize(width:1536, height:2048))
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = false
            skView.showsNodeCount = false
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        
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
