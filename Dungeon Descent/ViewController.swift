//
//  ViewController.swift
//  Dungeon Descent
//
//  Created by John Rocco on 3/6/19.
//  Copyright © 2019 John Rocco. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    let player = SKSpriteNode(fileNamed: "player.png")

    override func viewDidLoad() {
        super.viewDidLoad()
        player?.anchorPoint = CGPoint(x: 100, y: 100)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

