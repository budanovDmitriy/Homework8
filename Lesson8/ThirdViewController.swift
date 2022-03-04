//
//  ThirdViewController.swift
//  Lesson8
//
//  Created by Dmitriy Budanov on 03.03.2022.
//

import UIKit

class ThirdViewController: UIViewController {

    var circles:[UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        let pointX = sender.location(in: self.view).x
        let pointY = sender.location(in: self.view).y
        let circle = UIView()
        
        for index in 0..<circles.count {
            let leftEdge = circles[index].frame.origin.x
            let rightEdge = circles[index].frame.origin.x + 50
            let topEdge = circles[index].frame.origin.y
            let bottomEdge = circles[index].frame.origin.y + 50
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
        circle.frame = CGRect(x: pointX - 25, y:pointY - 25, width: 50, height: 50)
        circle.layer.cornerRadius = 25
            circles.append(circle)
        view.addSubview(circle)
        
        
    }
}
