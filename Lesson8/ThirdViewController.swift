//
//  ThirdViewController.swift
//  Lesson8
//
//  Created by Dmitriy Budanov on 03.03.2022.
//

import UIKit

class ThirdViewController: UIViewController {

    // MARK: - Public properties
    
    var circles:[UIView] = []
    var circleRadius:CGFloat = 25
    
    // MARK: - IBActions

    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        let circle = UIView()
        let pointX = sender.location(in: self.view).x
        let pointY = sender.location(in: self.view).y
        for index in 0..<circles.count {
            let leftEdge = circles[index].frame.origin.x
            let rightEdge = circles[index].frame.origin.x + (circleRadius * 2)
            let topEdge = circles[index].frame.origin.y
            let bottomEdge = circles[index].frame.origin.y + (circleRadius * 2)
            if pointX > leftEdge,
               pointX < rightEdge,
               pointY < bottomEdge,
               pointY > topEdge {
                circles[index].removeFromSuperview()
                circles.remove(at: index)
                return
            }
        }
        circle.backgroundColor = .red
        circle.frame = CGRect(x: pointX - circleRadius,
                              y:pointY - circleRadius,
                              width: circleRadius * 2,
                              height: circleRadius * 2)
        circle.layer.cornerRadius = circleRadius
        circles.append(circle)
        view.addSubview(circle)
    }
}
