//
//  InfoViewController.swift
//  diploma
//
//  Created by Gleb Chumachenko on 4.10.22.
//

import UIKit

class InfoViewController: UIViewController {
    

    @IBOutlet weak var festLabel: UILabel!
    @IBOutlet weak var festInfo: UITextView!
    @IBOutlet weak var festImage: UIImageView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var notifButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tuneUI()
    }
    
    func tuneUI() {
        dateLabel.text = UserDefaults.standard.string(forKey: "date")
        festLabel.text =  UserDefaults.standard.string(forKey: "title")!
        festInfo.text =  UserDefaults.standard.string(forKey: "body")!
        festImage.image = Singleton.shared.festImage
        
        
        festInfo.isEditable = false
        
        
//        let sb = UIStoryboard.init(name: "Main", bundle: nil)
//        sb.instantiateViewController(withIdentifier: "String") as!
    }
    
    
    
    
    @IBAction func shareAction(_ sender: Any) {
        let activityController = UIActivityViewController(activityItems: [festInfo.text!], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
}


