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
    
    // NOTE:  TimeInterval class is in seconds
    
    var timer: Timer?
    private var duration: TimeInterval? = 90.0
    private var stopDate: Date? = nil
    
    var mph: Double = 0.0
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateFormat = "MMM dd YYYY"
        return formatter
    }
    
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        let date = Date()
        presentTimeLabel.text = dateFormatter.string(from: date).capitalized
        speedLabel.text = "\(mph) m.p.h."
        lastTimeDepartedLabel.text = "_ _ _  _ _  _ _ _ _"
    }
    
    
    @IBAction func travelBackButtonTapped(_ sender: Any) {
        startTimer()
    }
    
    private func startTimer() {
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: update(timer:))
        
        // THIS CODE RUNS BEFORE the block{closure/update} runs
        stopDate = Date(timeIntervalSinceNow: 88.1)
        //timer?.fire()
        print("activated timer")
    }
    
    private func update(timer: Timer) -> Void {      //this runs continuously with timer, hence 'block'
        

        if let stopDate = stopDate {
            let currentTime = Date()
            if currentTime <= stopDate {
                let dateInterval = DateInterval(start: currentTime, end: stopDate)
                mph = 88.0 - dateInterval.duration
                print(mph)
                speedLabel.text = "\(mph) m.p.h."
            } else {
                timer.invalidate()
                lastTimeDepartedLabel.text = presentTimeLabel.text
                presentTimeLabel.text = destinationDateLabel.text
                // show an alert with title "Time Travel Successful" and a message that says "Your new date is (present time)"
                speedLabel.text = "0 m.p.h."
                print("show alert controller")
            }
        }
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
        destinationDateLabel.text = dateFormatter.string(from: date)
        view.reloadInputViews()
    }
}



