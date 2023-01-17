//
//  DownloadViewController.swift
//  diploma
//
//  Created by Gleb Chumachenko on 4.10.22.
//

import UIKit

class DownloadViewController: UIViewController {
    

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer()
    }

    

    func timer(){
        Timer.scheduledTimer(timeInterval: 2.8, target: self, selector: #selector(goNext), userInfo: nil, repeats: false)
        
        Timer.scheduledTimer(timeInterval:0.03, target: self, selector: #selector(download), userInfo: nil, repeats: true)

        progressView.progressViewStyle = .bar
        progressView.setProgress(0, animated: false)
    }

    @objc func download() {
        if progressView.progress != 1 {
            progressView.progress += 0.015
        }
    }
    
    @objc func goNext() {
        self.performSegue(withIdentifier: "downloadSegue", sender: nil)
    }
    
    
    
}
