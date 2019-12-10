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
    
    @IBAction func doneButton(_ sender: Any) {
        if taskInfo.text != nil
        {
         performSegue(withIdentifier: "taskSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let timerViewController = segue.destination as! ViewController
        timerViewController.task = taskInfo.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
        

}
