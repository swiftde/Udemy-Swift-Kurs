//
//  movieVC.swift
//  Kapitel 1
//
//  Created by Udemy on 28.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit
import MediaPlayer

class movieVC: UIViewController {

    var moviePlayer: MPMoviePlayerController!
    var dragView: DraggableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width/16*9)
        dragView = DraggableView(frame: frame)
        dragView.center = view.center
        
        
        let videoURL = NSBundle.mainBundle().URLForResource("video", withExtension: "mov")
        moviePlayer = MPMoviePlayerController(contentURL: videoURL)
        moviePlayer.view.frame.origin = CGPoint(x: 0, y: 0)
        moviePlayer.view.frame.size = dragView.frame.size
        dragView.addSubview(moviePlayer.view)
        moviePlayer.controlStyle = .None
        moviePlayer.repeatMode = .One
        moviePlayer.prepareToPlay()
        
        view.addSubview(dragView)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        moviePlayer.play()
    }
    
}


class DraggableView: UIView {
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
		var location = CGPoint()
        for touch: AnyObject in touches {
            location = (touch as! UITouch).locationInView(self.superview)
        }
        UIView.beginAnimations("dragging", context: nil)
        self.center = location
        UIView.commitAnimations()
        
    }
}
