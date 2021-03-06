//
//  ViewController.swift
//  Puzzle
//
//  Created by Felita Tangono on 26/07/18.
//  Copyright © 2018 Felita Tangono. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var gridCollection: [UIView]!
    @IBOutlet var PuzzleCollection: [UIImageView]!

    @IBOutlet var gesture4: UIPanGestureRecognizer!
    @IBOutlet var gesture6: UIPanGestureRecognizer!
    @IBOutlet var gesture2: UIPanGestureRecognizer!
    @IBOutlet var gesture1: UIPanGestureRecognizer!
    @IBOutlet var gesture3: UIPanGestureRecognizer!
    @IBOutlet var gesture0: UIPanGestureRecognizer!
    @IBOutlet var gesture8: UIPanGestureRecognizer!
    @IBOutlet var gesture5: UIPanGestureRecognizer!
    @IBOutlet var gesture7: UIPanGestureRecognizer!
    
    var animator: UIDynamicAnimator!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       randomPosisiGambar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
       randomPosisiGambar()
    }
    
    func addGesture(gesture: UIPanGestureRecognizer){
        let location = gesture.location(in: self.view)
        gesture.view!.center = location

        
        if (gesture.state == .cancelled || gesture.state == .ended)
        {
            snap(gambar: gesture)
        }
    }
    
    func snap(gambar: UIPanGestureRecognizer){
        var matchedPuzzle = 0
        for index in gridCollection{
            if index.frame.intersects(gambar.view!.frame){
                UIView.animate(withDuration: 0.1) {
                    gambar.view!.center = index.center
                }
            }
            //check matched puzzle and grid count
            for index2 in PuzzleCollection{
                checkWin(grid: index, puzzle: index2, matchedPuzzle: &matchedPuzzle)
            }
        }
    }
    
    func dropObject(){
        animator = UIDynamicAnimator(referenceView: self.view)
        
        let gravity = UIGravityBehavior(items: PuzzleCollection)
        let direct = CGVector(dx: 1.0, dy: 1.0)
        gravity.gravityDirection = direct
        
        let collision = UICollisionBehavior(items: PuzzleCollection)
        collision.translatesReferenceBoundsIntoBoundary = true
        
        let bounce = UIDynamicItemBehavior(items: PuzzleCollection)
        bounce.elasticity = 1
        
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        animator.addBehavior(bounce)
    }
    
    func randomPosisiGambar(){
        for index in PuzzleCollection{
            let randomX = Int(arc4random_uniform(300))
            let randomY = Int(arc4random_uniform(700))
            index.frame = CGRect(x: randomX, y: randomY, width: 100, height: 100)
        }
    }
    
    func checkWin(grid: UIView, puzzle: UIImageView, matchedPuzzle: inout Int){
        if puzzle.tag == grid.tag && grid.frame.minX == puzzle.frame.minX{
            matchedPuzzle += 1
            print(matchedPuzzle)
            if matchedPuzzle == 9 {
                dropObject()
            }
        }
    }
    
    @IBAction func drag0(_ sender: UIPanGestureRecognizer) {
        addGesture(gesture: sender)
    }
    
    @IBAction func drag1(_ sender: UIPanGestureRecognizer) {
        addGesture(gesture: sender)
    }
    
    @IBAction func drag2(_ sender: UIPanGestureRecognizer) {
        addGesture(gesture: sender)
    }
    
    @IBAction func drag3(_ sender: UIPanGestureRecognizer) {
        addGesture(gesture: sender)
    }
    
    @IBAction func drag4(_ sender: UIPanGestureRecognizer) {
        addGesture(gesture: sender)
    }
    
    
    @IBAction func drag6(_ sender: UIPanGestureRecognizer) {
        addGesture(gesture: sender)
    }
    
    @IBAction func drag5(_ sender: UIPanGestureRecognizer) {
        addGesture(gesture: sender)
    }
    
    
    @IBAction func drag8(_ sender: UIPanGestureRecognizer) {
        addGesture(gesture: sender)
    }
    
    @IBAction func drag7(_ sender: UIPanGestureRecognizer) {
        addGesture(gesture: sender)
    }
    
    
}

