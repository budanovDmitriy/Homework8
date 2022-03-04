//
//  SecondViewController.swift
//  Lesson8
//
//  Created by Dmitriy Budanov on 03.03.2022.
//

import UIKit

class SecondViewController: UIViewController {

    var circleRadius:CGFloat = 25
    var circleStep:CGFloat = 25
    var circleStartPositionX:CGFloat? = nil
    var circleStartPositionY:CGFloat? = nil
    @IBOutlet weak var circleView: UIView!
    
    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        
        switch sender.direction {
        case .down:
            if circleView.frame.origin.y < view.frame.height - circleRadius {
                circleView.frame.origin.y += circleStep}
        case .up:
            if circleView.frame.origin.y >  circleRadius {
                circleView.frame.origin.y -= circleStep
                }
        case .left:
            if circleView.frame.origin.x >  circleRadius {
                circleView.frame.origin.x -= circleStep
        }
        case .right:
            if circleView.frame.origin.x <  view.frame.width - circleRadius {
            circleView.frame.origin.x += circleStep
            }
        default:
            break
        }
        circleView.backgroundColor = UIColor.rgb(red: CGFloat(arc4random_uniform(255)), green: CGFloat(arc4random_uniform(255)), blue:CGFloat( arc4random_uniform(255)))
    }
    
    private func setupCircleView() {
        circleStartPositionX = view.frame.width / 2 - circleRadius
        circleStartPositionY = view.frame.height / 2 - circleRadius
        circleView.frame = CGRect(x: circleStartPositionX ?? 0 , y: circleStartPositionY ?? 0, width: 50, height: 50)
        circleView.backgroundColor = .red
        circleView.layer.cornerRadius = circleRadius
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCircleView()
    }


}

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
      }
}
