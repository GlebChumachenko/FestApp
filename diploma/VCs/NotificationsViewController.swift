//
//  NotificationsViewController.swift
//  diploma
//
//  Created by Gleb Chumachenko on 19.10.22.
//

import UIKit
import UserNotifications

class NotificationsViewController: UIViewController {
    

    @IBOutlet weak var festLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var notifyButton: UIButton!
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notify()
        
    }
    
    private func notify() {
        festLabel.text =  UserDefaults.standard.string(forKey: "title") ?? "iii"
        notifyButton.titleLabel?.font = UIFont(name: "Futura", size: 31)
        notificationCenter.requestAuthorization(options: [.alert, .sound]) { granted, error in
            if !granted {
                print("ok")
            }
        }
    }
    
    @IBAction func notifyAction(_ sender: Any) {
        
        
        notificationCenter.getNotificationSettings { settings in
            
            DispatchQueue.main.async {
                
            if settings.authorizationStatus == .authorized {
                let date = self.datePicker.date
                let content = UNMutableNotificationContent()
                content.title = self.festLabel.text!
                content.body = "The \(UserDefaults.standard.string(forKey: "title") ?? "iii") is soon! 🎉"
                
                let dateComp = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComp, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                self.notificationCenter.add(request)
                let ac: UIAlertController = UIAlertController(title: "Notifications scheduled", message: "At " + self.formDate(date: date), preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in }))
                self.present(ac, animated: true)
            }
            else {
                let ac: UIAlertController = UIAlertController(title: "Enable notifications?", message: "To use this feature you must enable notifications in settings", preferredStyle: .alert)
                let gotoSettings = UIAlertAction(title: "Settings", style: .default) { _ in
                    
                    guard let setURl = URL(string: UIApplication.openSettingsURLString) else {
                        return
                    }
                    
                    if UIApplication.shared.canOpenURL(setURl) {
                        UIApplication.shared.open(setURl)
                    }
                }
                ac.addAction(gotoSettings)
                ac.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { _ in }))
                self.present(ac, animated: true)
                
            }
          }
        }
    }
    
    func formDate(date: Date) -> String {

        let dateForm = DateFormatter()
        dateForm.timeZone = .current
        dateForm.dateFormat = "d MMM HH:mm"

        return dateForm.string(from: date)
   }

}
