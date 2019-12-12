//
//  AddTaskViewController.swift
//  Pomolist
//
//  Created by Vitor Rodrigues on 10/12/2019.
//  Copyright © 2019 Vitor Rodrigues. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    
    @IBOutlet weak var taskInfo: UITextField!
    
    
    @IBOutlet weak var pomodoroLabel: UILabel!
    @IBOutlet weak var stepperOutlet: UIStepper!
    @IBAction func stepperAction(_ sender: UIStepper) {
        var stepperNumber: Int
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
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepperOutlet.wraps = true
        stepperOutlet.autorepeat = true
        stepperOutlet.maximumValue = 48
        

    }
        

}
