//
//  HelloViewController.swift
//  diploma
//
//  Created by Gleb Chumachenko on 29.09.22.
//

import UIKit

class HelloViewController: UIViewController {
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var appLabel: UILabel!
    @IBOutlet weak var barBtn: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tuneUI()
        
        
       // goButton.font = UIFont(name: "Futura", size: 31)!
        //goButton.layer.cornerRadius = 67
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        goButton.titleLabel?.font = UIFont(name: "Futura", size: 31)
        appLabel.text = "\tHello, it is FestApp 👋🏼 \nHere you can conveniently keep track of information on all upcoming festivals. \n\tGood luck 😘"
        animate()
        animateBtn()
    }


    private func tuneUI(){
        barBtn.hidesBackButton = true
        let width = goButton.bounds.width
        let top = appLabel.bounds.width
        bottomConstraint.constant = -width
        topConstraint.constant = -top
        
    }
    
    private func animate(){
        let top = appLabel.bounds.width
        topConstraint.constant = top/2
        
        UIView.animate(withDuration: 2.2, delay: 0, options: [ .curveEaseOut]) {
            self.view.layoutSubviews()
        }
    }
    
    private func animateBtn(){
        let width = goButton.bounds.width
        bottomConstraint.constant = width * 1.5
        
        UIView.animate(withDuration: 1.8, delay: 2.5, options: [ .curveEaseOut]) {
            self.view.layoutSubviews()
        }
    }
    
    
    var dict: [String : Bool] = [
        "firstStart" : false
    ]
    
    func isHide(){
        if dict["firstStart"] == true {
//            let sb = UIStoryboard.init(name: "Main", bundle: nil)
//            sb.
        }
            
    }
    
    @IBAction func changeValue(_ sender: Any) {
        
        dict.updateValue(true, forKey: "firstStart")
    }
    

    
}
