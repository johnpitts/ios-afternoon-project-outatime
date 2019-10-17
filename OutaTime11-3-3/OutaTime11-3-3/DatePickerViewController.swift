//
//  DatePickerViewController.swift
//  OutaTime11-3-3
//
//  Created by John Pitts on 10/16/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // potentially preset the picker to something
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goButtonTapped(_ sender: Any) {
        
        // read the picker
        //delegate?.destinationDateWasChosen(date: datePicker!.datePickerMode)
        // send picker info back to TimeCircuitsVC
        dismiss(animated: true, completion: nil)
    }


}
