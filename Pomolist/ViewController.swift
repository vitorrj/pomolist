//
//  ViewController.swift
//  Pomolist
//
//  Created by Vitor Rodrigues on 05/12/2019.
//  Copyright © 2019 Vitor Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    Buttons and Labels
    @IBOutlet weak var taskName: UILabel!
    
    @IBAction func startButton(_ sender: UIButton) {
        
        strokeIt.fromValue = 0
        strokeIt.toValue = 1
        strokeIt.duration = 1500
        timeLeftShapeLayer.add(strokeIt, forKey: nil)
        
        endTime = Date().addingTimeInterval(timeLeft)
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func pauseButton(_ sender: UIButton) {
    }
    
//    Variables
    var task = "your task"
    let timeLeftShapeLayer = CAShapeLayer()
    let bgShapeLayer = CAShapeLayer()
    var timeLeft: TimeInterval = 1500
    var endTime: Date?
    var timeLabel =  UILabel()
    var timer = Timer()
    let strokeIt = CABasicAnimation(keyPath: "strokeEnd")
    
    
//    Functions
    func drawBgShape() {
        bgShapeLayer.path = UIBezierPath(arcCenter: CGPoint(x: view.frame.midX , y: view.frame.midY), radius:
            100, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
        bgShapeLayer.strokeColor = UIColor.white.cgColor
        bgShapeLayer.fillColor = UIColor.clear.cgColor
        bgShapeLayer.lineWidth = 15
        view.layer.addSublayer(bgShapeLayer)
    }
    func drawTimeLeftShape() {
        timeLeftShapeLayer.path = UIBezierPath(arcCenter: CGPoint(x: view.frame.midX , y: view.frame.midY), radius:
            100, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
        timeLeftShapeLayer.strokeColor = UIColor.black.cgColor
        timeLeftShapeLayer.fillColor = UIColor.clear.cgColor
        timeLeftShapeLayer.lineWidth = 15
        view.layer.addSublayer(timeLeftShapeLayer)
    }
    func addTimeLabel() {
        timeLabel = UILabel(frame: CGRect(x: view.frame.midX-50 ,y: view.frame.midY-25, width: 100, height: 50))
        timeLabel.textAlignment = .center
        timeLabel.text = timeLeft.time
        view.addSubview(timeLabel)
    }

    
    func addTask() {
        taskName.text = task
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 0.94, alpha: 1.0)
        drawBgShape()
        drawTimeLeftShape()
        addTimeLabel()
        addTask()

    }
    
    @objc func updateTime() {
    if timeLeft > 0 {
        timeLeft = endTime?.timeIntervalSinceNow ?? 0
        timeLabel.text = timeLeft.time
        } else {
        timeLabel.text = "00:00"
        timer.invalidate()
        }
    }
}

extension TimeInterval {
    var time: String {
        return String(format:"%02d:%02d", Int(self/60),  Int(ceil(truncatingRemainder(dividingBy: 60))) )
    }
}
extension Int {
    var degreesToRadians : CGFloat {
        return CGFloat(self) * .pi / 180
    }
}

