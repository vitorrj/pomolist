//
//  AddTaskViewController.swift
//  Pomolist
//
//  Created by Vitor Rodrigues on 10/12/2019.
//  Copyright © 2019 Vitor Rodrigues. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    var stepperNumber: Int = 0
    
    @IBOutlet weak var taskInfo: UITextField!
    
    
    @IBOutlet weak var pomodoroLabel: UILabel!
    @IBOutlet weak var stepperOutlet: UIStepper!
    @IBAction func stepperAction(_ sender: UIStepper) {
            stepperNumber = Int(sender.value)
        pomodoroLabel.text = "\(stepperNumber) pomodoro"
        
    }


    @IBAction func doneButton(_ sender: Any) {
        if taskInfo.text != nil
        {   
         performSegue(withIdentifier: "taskSegue", sender: self)
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let timerViewController = segue.destination as! ViewController
        
        timerViewController.task = taskInfo.text!
        timerViewController.addTimeLabel()
        timerViewController.setButton.isHidden = true
        
        //PREPARE POMODORO LABEL
        timerViewController.pomodoroQuantity = stepperNumber
        timerViewController.pomodoroQuantityLabel.isHidden = false
        timerViewController.pomodoroQuantityLabel.text = "0 / \(stepperNumber)"
            
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepperOutlet.wraps = true
        stepperOutlet.autorepeat = true
        stepperOutlet.maximumValue = 48
        

    }
        

}
