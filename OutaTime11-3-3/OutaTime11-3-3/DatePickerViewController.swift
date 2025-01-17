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

        datePicker.setDate(Date(), animated: false)
        datePicker.backgroundColor = .black
        datePicker.setValue(UIColor.green, forKey: "textColor")
        
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goButtonTapped(_ sender: Any) {
        
        // read the picker
        let backToThePast = datePicker.date
        
        // let pickerData[pickerName.selectedRow(inComponent: 0)] so you send selectedRow to pickerView with column/component #.  if you are only selecting from one row then you use 0th element
        
        delegate?.destinationDateWasChosen(date: backToThePast)
        dismiss(animated: true, completion: nil)
    }


}
