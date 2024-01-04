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

    var originalTexts: [UILabel : String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let labels = [label1, label2, label3, label4, label5, label6, label7, label8, label9]
        // originalTexts 초기값 설정
        for label in labels {
            originalTexts[label!] = label?.text
        }
        updateTapTimes()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let labels = [label1, label2, label3, label4, label5, label6, label7, label8, label9]
        // tag: 1~9
        let index = sender.tag - 1
        if let label = labels[index] {
            print("index = \(index)")
            let tapTimes = UserDefaults.standard.integer(forKey: "tapTimes\(index)") + 1
            UserDefaults.standard.set(tapTimes, forKey: "tapTimes\(index)")
            let updatedTap = UserDefaults.standard.integer(forKey: "tapTimes\(index)")
            if let originalLabel = originalTexts[label] {
                label.text = "\(originalLabel) \(updatedTap)"
            }
        }
    }
    
    func updateTapTimes() {
        print("updateTapTimes")
        let labels = [label1, label2, label3, label4, label5, label6, label7, label8, label9]
        
        for index in 0...8 {
            let key = "tapTimes\(index)"
            let lastTapTimes = UserDefaults.standard.integer(forKey: key)
            print(lastTapTimes)
            labels[index]?.text = "좋아해 \(lastTapTimes)"
        }
    }
    
}

