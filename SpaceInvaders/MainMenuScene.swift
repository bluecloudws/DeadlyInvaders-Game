//
//  MainMenuScene.swift
//  SpaceInvaders
//
//  Copyright © 2016 bluecloudws. All rights reserved.
//

import Foundation

import SpriteKit

class MainMenuScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        
        let background = SKSpriteNode (imageNamed: "background")
        // center of screen
        background.position = CGPoint(x: self.size.width/2,y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let gameBy = SKLabelNode(fontNamed: "The Bold Font")
        gameBy.text = "bluecloud.ws"
        gameBy.fontSize = 50
        gameBy.fontColor = SKColor.whiteColor()
        gameBy.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.78)
        gameBy.zPosition = 1
        self.addChild(gameBy)
        
        let gameName1 = SKLabelNode(fontNamed: "The Bold Font")
        gameName1.text = "Deadly"
        gameName1.fontSize = 200
        gameName1.fontColor = SKColor.whiteColor()
        gameName1.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.7)
        gameName1.zPosition = 1
        self.addChild(gameName1)

        let gameName2 = SKLabelNode(fontNamed: "The Bold Font")
        gameName2.text = "Invaders"
        gameName2.fontSize = 200
        gameName2.fontColor = SKColor.whiteColor()
        gameName2.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.625)
        gameName2.zPosition = 1
        self.addChild(gameName2)

        
        let startGame = SKLabelNode(fontNamed: "The Bold Font")
        startGame.text = "Start Game"
        startGame.fontSize = 150
        startGame.fontColor = SKColor.whiteColor()
        startGame.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.4)
        startGame.zPosition = 1
        startGame.name = "startButton"
        self.addChild(startGame)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches{
            
            // another way to figure out whether we touched any of the nodes
            // compare with Restart in the Game Over scene
            let pointOfTouch = touch.locationInNode(self)
            let nodeITapped = nodeAtPoint(pointOfTouch)
            
            if nodeITapped.name == "startButton" {
                let sceneToMoveTo = GameScene (size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fadeWithDuration(0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                
            }
            
        }
    }
}
