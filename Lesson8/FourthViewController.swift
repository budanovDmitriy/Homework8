//
//  FourthViewController.swift
//  Lesson8
//
//  Created by Dmitriy Budanov on 03.03.2022.
//

import UIKit

class FourthViewController: UIViewController {

    var circleStartPositionX:CGFloat = 0
    var circleStartPositionY:CGFloat = 0
    var circleRadius:CGFloat = 25
    @IBOutlet weak var circleView: UIView!
    
    private func setupCircleView() {
        circleStartPositionX = view.frame.width / 2 - circleRadius
        circleStartPositionY = view.frame.height / 2 - circleRadius
        circleView.frame = CGRect(x: circleStartPositionX ?? 0 , y: circleStartPositionY ?? 0, width: 50, height: 50)
        circleView.backgroundColor = .red
        circleView.layer.cornerRadius = circleRadius
    }
    @IBAction func handlePan(_ panMoving: UIPanGestureRecognizer) {
      let moving = panMoving.translation(in: view)

      guard let panView = panMoving.view else {
        return
      }
      panView.center = CGPoint(
        x: panView.center.x + moving.x,
        y: panView.center.y + moving.y
      )
      panMoving.setTranslation(.zero, in: view)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCircleView()
        // Do any additional setup after loading the view.
    }


}
