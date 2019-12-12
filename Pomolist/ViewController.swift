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
    @IBOutlet weak var setButton: UIButton!
    @IBOutlet weak var pomodoroQuantityLabel: UILabel!
    
    @IBOutlet weak var startButtonOutlet: UIButton!
    @IBAction func startButton(_ sender: UIButton) {
        
        timeLeft = 10
        timeLabel.text = timeLeft.time

        startButtonOutlet.isHidden = true
        pauseButtonOutlet.isHidden = false
        
        
        strokeIt.fromValue = 0
        strokeIt.toValue = 1
        strokeIt.duration = 1500
        timeLeftShapeLayer.add(strokeIt, forKey: nil)
        endTime = Date().addingTimeInterval(timeLeft)
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
        
    @IBOutlet weak var pauseButtonOutlet: UIButton!
    @IBAction func pauseButton(_ sender: UIButton) {
        startButtonOutlet.isHidden = false
        pauseButtonOutlet.isHidden = true
        timer.invalidate()
    }
        
    
//    Variables
    var task = "add a task to start focusing"
    let timeLeftShapeLayer = CAShapeLayer()
    let bgShapeLayer = CAShapeLayer()
    var timeLeft: TimeInterval = 10
    var endTime: Date?
    var timeLabel =  UILabel()
    var timer = Timer()
    let strokeIt = CABasicAnimation(keyPath: "strokeEnd")
    var pomodoroQuantity: Int = 0
    var pomodoroCurrent: Int = 0
    
    
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
        timeLabel.font = UIFont(name:"Avenir", size: 25.0)
        view.addSubview(timeLabel)
    }

    
    func addTask() {
        taskName.text = task
    }
    
    func updatePomodoro() {
        pomodoroCurrent = pomodoroCurrent + 1
        pomodoroQuantityLabel.text = "\(pomodoroCurrent) / \(pomodoroQuantity)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 0.94, alpha: 1.0)
        
        drawBgShape()
        drawTimeLeftShape()
        addTask()
        if (task == "add a task to start focusing"){
        startButtonOutlet.isHidden = true
        pauseButtonOutlet.isHidden = true
        }else{
            pauseButtonOutlet.isHidden = true
        }

    }
    
    @objc func updateTime() {
    if timeLeft > 0 {
        timeLeft = endTime?.timeIntervalSinceNow ?? 0
        timeLabel.text = timeLeft.time
        } else {
        pauseButtonOutlet.isHidden = true
        startButtonOutlet.isHidden = false
        timeLabel.text = "00:00"
        updatePomodoro()
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

