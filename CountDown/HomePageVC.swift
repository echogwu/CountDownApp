//
//  ViewController.swift
//  CountDown
//
//  Created by WuGuihua on 10/27/16.
//  Copyright © 2016 EchoForFun. All rights reserved.
//

import UIKit

class HomePageVC: UIViewController {

    @IBOutlet weak var days: UILabel!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var minutes: UILabel!
    @IBOutlet weak var seconds: UILabel!
    @IBOutlet weak var refresh: UIButton!
    
    @IBOutlet weak var dateDisplayLabel: UILabel!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    @IBAction func selectADate(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm a Z"
        let strDate = dateFormatter.string(from: self.myDatePicker.date)
        self.dateDisplayLabel.text = strDate
        self.calculateTimeInterval()
    }
    
    override func viewDidLoad() {
        refresh.layer.cornerRadius = 10
        calculateTimeInterval()
        
    }
    
    func calculateTimeInterval(){
        let dateMakerFormatter = DateFormatter()
        dateMakerFormatter.dateFormat = "yyyy/MM/dd hh:mm a Z"
        
        let startTime = NSDate()

        let calendarComp = NSCalendar.current.dateComponents(Set<Calendar.Component>([.day, .hour, .minute, .second]), from: startTime as Date, to: self.myDatePicker.date)
        days.text = calendarComp.day?.description
        hours.text = calendarComp.hour?.description
        minutes.text = calendarComp.minute?.description
        seconds.text = calendarComp.second?.description
        
        /*
         //How to get date components
         let date = NSDate()
         let calendar = NSCalendar.current
         let components = calendar.dateComponents(Set<Calendar.Component>([.year, .month, .day, .hour, .minute, .second]), from: date as Date)
         let year = components.year
         let month = components.month
         let day = components.day
         let hour = components.hour
         let minute = components.minute
         let second = components.second
         print(year, month, day,hour, minute, second)
         the output is: Optional(2016) Optional(10) Optional(27) Optional(12) Optional(52) Optional(2)
         */
        
//        else{
//            let ac = UIAlertController(title: "Set end time", message: "You have not set an aiming date yet", preferredStyle: .alert)
//            ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//            self.present(ac, animated: true)
//        }
        
    }
    
    @IBAction func refreshTime(_ sender: UIButton) {
        calculateTimeInterval()
    }
}
 

