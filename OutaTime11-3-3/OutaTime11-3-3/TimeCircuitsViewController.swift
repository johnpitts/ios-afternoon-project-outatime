//
//  TimeCircuitsViewController.swift
//  OutaTime11-3-3
//
//  Created by John Pitts on 10/16/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class TimeCircuitsViewController: UIViewController {
    
    
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var destinationDateLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var mph: Int = 0
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MON dd year"
        return formatter
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentTimeLabel.text = String(describing: Date())
        speedLabel.text = "\(mph) m.p.h."
        lastTimeDepartedLabel.text = "_ _ _  _ _  _ _ _ _"
    }
    
    
    @IBAction func travelBackButtonTapped(_ sender: Any) {
        startTimer()
    }
    
    private func startTimer() {
        let timer = Timer(timeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    private func updateSpeed(timer: Timer) -> Void {
        print("update the mph textfield with mph counting upwards")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SetTime" {
            guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
            datePickerVC.delegate = self
        }
    }
}



extension TimeCircuitsViewController: DatePickerDelegate {
    
    func destinationDateWasChosen(date: Date) {
        #warning("this will pass the date chosen in DatePickerVC to this file")
        destinationDateLabel.text = "Mar 15 1970"
    }
}



