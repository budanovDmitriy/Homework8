//
//  SecondViewController.swift
//  Lesson8
//
//  Created by Dmitriy Budanov on 03.03.2022.
//

import UIKit

class SecondViewController: UIViewController {

    // MARK: - Public properties
    
    var circleRadius:CGFloat = 25
    var circleStep:CGFloat = 25
    var circleStartPositionX:CGFloat? = nil
    var circleStartPositionY:CGFloat? = nil
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var circleView: UIView!
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCircleView()
    }
    
    // MARK: - Private methods

    private func setupCircleView() {
        circleStartPositionX = view.frame.width / 2 - circleRadius
        circleStartPositionY = view.frame.height / 2 - circleRadius
        circleView.frame = CGRect(x: circleStartPositionX ?? 0 ,
                                  y: circleStartPositionY ?? 0,
                                  width: circleRadius * 2,
                                  height: circleRadius * 2)
        circleView.backgroundColor = .red
        circleView.layer.cornerRadius = circleRadius
    }
    
    private func changeColor(){
        circleView.backgroundColor = UIColor.rgb(red: CGFloat(arc4random_uniform(255)),
                                                 green: CGFloat(arc4random_uniform(255)),
                                                 blue: CGFloat( arc4random_uniform(255)))
    }
    
    // MARK: - IBActions

    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        
        switch sender.direction {
        case .down:
            if circleView.frame.origin.y < view.frame.height - circleRadius * 2 {
                circleView.frame.origin.y += circleStep
                changeColor()
            }
        case .up:
            if circleView.frame.origin.y > circleRadius * 2 {
                circleView.frame.origin.y -= circleStep
                changeColor()
                }
        case .left:
            if circleView.frame.origin.x > circleRadius {
                circleView.frame.origin.x -= circleStep
                changeColor()
            }
        case .right:
            if circleView.frame.origin.x < view.frame.width - circleRadius {
                circleView.frame.origin.x += circleStep
                changeColor()
            }
        default:
            break
        }
    }
}

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
      }
}
