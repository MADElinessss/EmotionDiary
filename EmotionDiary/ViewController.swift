//
//  ViewController.swift
//  EmotionDiary
//
//  Created by 신정연 on 1/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var label5: UILabel!
    @IBOutlet var label6: UILabel!
    @IBOutlet var label7: UILabel!
    @IBOutlet var label8: UILabel!
    @IBOutlet var label9: UILabel!
    
    var tapTimes: [UILabel : Int] = [:]
    var originalTexts: [UILabel : String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let labels = [label1, label2, label3, label4, label5, label6, label7, label8, label9]
        for label in labels {
            tapTimes[label!] = 0
            originalTexts[label!] = label?.text
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let labels = [label1, label2, label3, label4, label5, label6, label7, label8, label9]
        
        if let label = labels[sender.tag - 1] {
            tapTimes[label]! += 1
            label.text! = "\(originalTexts[label] ?? "") \(tapTimes[label]!)"
        }
    }
    
}

