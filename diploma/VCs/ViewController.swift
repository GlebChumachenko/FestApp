//
//  ViewController.swift
//  diploma
//
//  Created by Gleb Chumachenko on 25.09.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var festsButton: UIButton!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var calendarButton: UIButton!
    @IBOutlet weak var barBtn: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        festsButton.titleLabel?.font = UIFont(name: "Futura", size: 48)
        mapButton.titleLabel?.font = UIFont(name: "Futura", size: 31)
        calendarButton.titleLabel?.font = UIFont(name: "Futura", size: 31)
        barBtn.hidesBackButton = true
    }
   

}

