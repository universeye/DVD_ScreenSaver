//
//  ViewController.swift
//  DVD_ScreenSaver
//
//  Created by Terry Kuo on 2022/5/6.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSKView()
    }

    func configureSKView() {
        let skView = SKView(frame: view.bounds) //create spiteKit view
        skView.translatesAutoresizingMaskIntoConstraints = false
        skView.ignoresSiblingOrder = true
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        view.addSubview(skView)
        
        let scene = DVDScene(size: skView.bounds.size) //create game scene
        scene.scaleMode = .resizeFill
        //use .resizeFill do the nodes resize and update with screen orientation changes.
        
        
        //apply constaints
        NSLayoutConstraint.activate([
            skView.topAnchor.constraint(equalTo: view.topAnchor),
            skView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            skView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            skView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        
        skView.presentScene(scene)
    }
    
    
}

