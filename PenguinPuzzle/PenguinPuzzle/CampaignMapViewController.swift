//
//  CampaignMapViewController.swift
//  PenguinPuzzle
//
//  Created by Eric Chung on 8/24/17.
//  Copyright © 2017 Eric Chung. All rights reserved.
//

import UIKit

class CampaignMapViewController: UIViewController {
    @IBOutlet var Btn1: UIButton!
    @IBOutlet var Btn2: UIButton!
    @IBOutlet var Btn3: UIButton!
    @IBOutlet var Btn4: UIButton!
    @IBOutlet var Btn5: UIButton!
    @IBOutlet var Btn6: UIButton!
    @IBOutlet var Btn7: UIButton!
    @IBOutlet var Btn8: UIButton!
    @IBOutlet var Btn9: UIButton!
    @IBOutlet var Btn10: UIButton!
    @IBOutlet var Btn11: UIButton!
    @IBOutlet var Btn12: UIButton!
    @IBOutlet var Btn13: UIButton!
    @IBOutlet var Btn14: UIButton!
    @IBOutlet var Btn15: UIButton!
    @IBOutlet var PlayBtn: UIButton!
    @IBOutlet var StageDescription: UILabel!
    @IBOutlet var YetiWalk: UIImageView!
    @IBOutlet var StageTopic: UILabel!
 
    var highestStage : Int!
    var stageCleared : Int!
    var stageSelected : Int = 0
    var wordListLevel : String = ""
    var displayMsgs : [String] = ["", "Stage 1", "Stage 2", "Stage 3", "Stage 4", "Stage 5", "Stage 6", "Stage 7", "Stage 8", "Stage 9", "Stage 10", "Stage 11", "Stage 12", "Stage 13", "Stage 14", "Stage 15"]
    var topics : [String] = ["Topic: ", "Topic: Sea Life","Topic: Musical", "Topic: Food","Topic: Sports", "Topic: Car Brands","Topic: College Majors", "Topic: Major U.S. Cities","Topic: Fruits and Vegetables", "Topic: Clarity Names","Topic: Countries", "Topic: Assorted","Topic: Assorted", "Topic: Assorted","Topic: Assorted", "Topic: Difficult"]
    var lime : UIColor = UIColor(red: 102/255, green: 250/255, blue: 51/255, alpha: 0.5)
    var ice : UIColor = UIColor(red: 50/255, green: 200/255, blue: 255/255, alpha: 0.5)
    var startWalking : [UIImage] = [#imageLiteral(resourceName: "YetiWalk-1"), #imageLiteral(resourceName: "YetiWalk-2"), #imageLiteral(resourceName: "YetiWalk-3"), #imageLiteral(resourceName: "YetiWalk-4")]
    override func viewDidLoad() {
        super.viewDidLoad()
        Btn2.isHidden = true
        Btn3.isHidden = true
        Btn4.isHidden = true
        Btn5.isHidden = true
        Btn6.isHidden = true
        Btn7.isHidden = true
        Btn8.isHidden = true
        Btn9.isHidden = true
        Btn10.isHidden = true
        Btn11.isHidden = true
        Btn12.isHidden = true
        Btn13.isHidden = true
        Btn14.isHidden = true
        Btn15.isHidden = true
        Btn1.layer.cornerRadius = 20.0
        Btn1.clipsToBounds = true
        Btn2.layer.cornerRadius = 20.0
        Btn2.clipsToBounds = true
        Btn3.layer.cornerRadius = 20.0
        Btn3.clipsToBounds = true
        Btn4.layer.cornerRadius = 20.0
        Btn4.clipsToBounds = true
        Btn5.layer.cornerRadius = 20.0
        Btn5.clipsToBounds = true
        Btn6.layer.cornerRadius = 20.0
        Btn6.clipsToBounds = true
        Btn7.layer.cornerRadius = 20.0
        Btn7.clipsToBounds = true
        Btn8.layer.cornerRadius = 20.0
        Btn8.clipsToBounds = true
        Btn9.layer.cornerRadius = 20.0
        Btn9.clipsToBounds = true
        Btn10.layer.cornerRadius = 20.0
        Btn10.clipsToBounds = true
        Btn11.layer.cornerRadius = 20.0
        Btn11.clipsToBounds = true
        Btn12.layer.cornerRadius = 20.0
        Btn12.clipsToBounds = true
        Btn13.layer.cornerRadius = 20.0
        Btn13.clipsToBounds = true
        Btn14.layer.cornerRadius = 20.0
        Btn14.clipsToBounds = true
        Btn15.layer.cornerRadius = 20.0
        Btn15.clipsToBounds = true
        allIce()
        yetiWalk()
        StageDescription.text = ""
        YetiWalk.image = #imageLiteral(resourceName: "YetiNPepe")
        PlayBtn.isEnabled = false
        let highestStageDefaults = UserDefaults.standard
        highestStage = highestStageDefaults.value(forKey: "HighestStage") as! Int
        let stageClearedDefaults = UserDefaults.standard
        stageCleared = stageClearedDefaults.value(forKey: "StageCleared") as! Int
        if stageCleared > highestStage
        {
            highestStage = stageCleared
        }
        if highestStage > 0 {
            Btn2.isHidden = false
        }
        if highestStage > 1 {
            Btn3.isHidden = false
        }
        if highestStage > 2 {
            Btn4.isHidden = false
        }
        if highestStage > 3 {
            Btn5.isHidden = false
        }
        if highestStage > 4 {
            Btn6.isHidden = false
        }
        if highestStage > 5 {
            Btn7.isHidden = false
        }
        if highestStage > 6 {
            Btn8.isHidden = false
        }
        if highestStage > 7 {
            Btn9.isHidden = false
        }
        if highestStage > 8 {
            Btn10.isHidden = false
        }
        if highestStage > 9 {
            Btn11.isHidden = false
        }
        if highestStage > 10 {
            Btn12.isHidden = false
        }
        if highestStage > 11 {
            Btn13.isHidden = false
        }
        if highestStage > 12 {
            Btn14.isHidden = false
        }
        if highestStage > 13 {
            Btn15.isHidden = false
        }
        highestStageDefaults.setValue(highestStage, forKey: "HighestStage")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func display() {
        StageDescription.text = displayMsgs[stageSelected]
        StageTopic.text = topics[stageSelected]
    }
    func yetiWalk() {
        YetiWalk.animationImages = startWalking
        YetiWalk.animationDuration = 1.0
        YetiWalk.startAnimating()
    }
    func allIce() {
        Btn1.backgroundColor = ice
        Btn2.backgroundColor = ice
        Btn3.backgroundColor = ice
        Btn4.backgroundColor = ice
        Btn5.backgroundColor = ice
        Btn6.backgroundColor = ice
        Btn7.backgroundColor = ice
        Btn8.backgroundColor = ice
        Btn9.backgroundColor = ice
        Btn10.backgroundColor = ice
        Btn11.backgroundColor = ice
        Btn12.backgroundColor = ice
        Btn13.backgroundColor = ice
        Btn14.backgroundColor = ice
        Btn15.backgroundColor = ice
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        allIce()
        PlayBtn.isEnabled = false
        StageDescription.text = ""
        StageTopic.text = ""
        let highestStageDefaults = UserDefaults.standard
        highestStage = highestStageDefaults.value(forKey: "HighestStage") as! Int
        let stageClearedDefaults = UserDefaults.standard
        stageCleared = stageClearedDefaults.value(forKey: "StageCleared") as! Int
        if stageCleared > highestStage
        {
            highestStage = stageCleared
        }
        if highestStage > 0 {
            Btn2.isHidden = false
        }
        if highestStage > 1 {
            Btn3.isHidden = false
        }
        if highestStage > 2 {
            Btn4.isHidden = false
        }
        if highestStage > 3 {
            Btn5.isHidden = false
        }
        if highestStage > 4 {
            Btn6.isHidden = false
        }
        if highestStage > 5 {
            Btn7.isHidden = false
        }
        if highestStage > 6 {
            Btn8.isHidden = false
        }
        if highestStage > 7 {
            Btn9.isHidden = false
        }
        if highestStage > 8 {
            Btn10.isHidden = false
        }
        if highestStage > 9 {
            Btn11.isHidden = false
        }
        if highestStage > 10 {
            Btn12.isHidden = false
        }
        if highestStage > 11 {
            Btn13.isHidden = false
        }
        if highestStage > 12 {
            Btn14.isHidden = false
        }
        if highestStage > 13 {
            Btn15.isHidden = false
        }
        highestStageDefaults.setValue(highestStage, forKey: "HighestStage")
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toGameBoard" {
            let vc = segue.destination as! PenguViewController
            vc.stage = stageSelected
            vc.wordListURL = wordListLevel
            print(vc.stage)
        }
    }
    
    @IBAction func Btn1Pressed(_ sender: Any) {
        stageSelected = 1
        wordListLevel = "https://ericchung93.github.io/hangman_words1.txt"
        PlayBtn.isEnabled = true
        display()
        allIce()
        Timer.schedule(delay: 0.1) { _ in
            self.Btn1.backgroundColor = self.lime
        }
    }
    @IBAction func Btn2Pressed(_ sender: Any) {
        stageSelected = 2
        wordListLevel = "https://ericchung93.github.io/hangman_words2.txt"
        PlayBtn.isEnabled = true
        display()
        allIce()
        Timer.schedule(delay: 0.1) { _ in
            self.Btn2.backgroundColor = self.lime
        }

    }
    @IBAction func Btn3Pressed(_ sender: Any) {
        stageSelected = 3
        wordListLevel = "https://ericchung93.github.io/hangman_words3.txt"
        PlayBtn.isEnabled = true
        display()
        allIce()
        Timer.schedule(delay: 0.1) { _ in
            self.Btn3.backgroundColor = self.lime
        }

    }
    @IBAction func Btn4Pressed(_ sender: Any) {
        stageSelected = 4
        wordListLevel = "https://ericchung93.github.io/hangman_words4.txt"
        PlayBtn.isEnabled = true
        display()
        allIce()
        Timer.schedule(delay: 0.1) { _ in
            self.Btn4.backgroundColor = self.lime
        }

    }
    @IBAction func Btn5Pressed(_ sender: Any) {
        stageSelected = 5
        wordListLevel = "https://ericchung93.github.io/hangman_words5.txt"
        PlayBtn.isEnabled = true
        display()
        allIce()
        Timer.schedule(delay: 0.1) { _ in
            self.Btn5.backgroundColor = self.lime
        }

    }
    @IBAction func Btn6Pressed(_ sender: Any) {
        stageSelected = 6
        wordListLevel = "https://ericchung93.github.io/hangman_words6.txt"
        PlayBtn.isEnabled = true
        display()
        allIce()
        Timer.schedule(delay: 0.1) { _ in
            self.Btn6.backgroundColor = self.lime
        }

    }
    @IBAction func Btn7Pressed(_ sender: Any) {
        stageSelected = 7
        wordListLevel = "https://ericchung93.github.io/hangman_words7.txt"
        PlayBtn.isEnabled = true
        display()
        allIce()
        Timer.schedule(delay: 0.1) { _ in
            self.Btn7.backgroundColor = self.lime
        }

    }
    @IBAction func Btn8Pressed(_ sender: Any) {
        stageSelected = 8
        wordListLevel = "https://ericchung93.github.io/hangman_words8.txt"
        PlayBtn.isEnabled = true
        display()
        allIce()
        Timer.schedule(delay: 0.1) { _ in
            self.Btn8.backgroundColor = self.lime
        }

    }
    @IBAction func Btn9Pressed(_ sender: Any) {
        stageSelected = 9
        wordListLevel = "https://ericchung93.github.io/hangman_words9.txt"
        PlayBtn.isEnabled = true
        display()
        allIce()
        Timer.schedule(delay: 0.1) { _ in
            self.Btn9.backgroundColor = self.lime
        }

    }
    @IBAction func Btn10Pressed(_ sender: Any) {
        stageSelected = 10
        wordListLevel = "https://ericchung93.github.io/hangman_words10.txt"
        PlayBtn.isEnabled = true
        display()
        allIce()
        Timer.schedule(delay: 0.1) { _ in
            self.Btn10.backgroundColor = self.lime
        }

    }
    @IBAction func Btn11Pressed(_ sender: Any) {
        stageSelected = 11
        wordListLevel = "https://ericchung93.github.io/easy_words0.txt"
        PlayBtn.isEnabled = true
        display()
        allIce()
        Timer.schedule(delay: 0.1) { _ in
            self.Btn11.backgroundColor = self.lime
        }

    }
    @IBAction func Btn12Pressed(_ sender: Any) {
        stageSelected = 12
        wordListLevel = "https://ericchung93.github.io/easy_words1.txt"
        PlayBtn.isEnabled = true
        display()
        allIce()
        Timer.schedule(delay: 0.1) { _ in
            self.Btn12.backgroundColor = self.lime
        }

    }
    @IBAction func Btn13Pressed(_ sender: Any) {
        stageSelected = 13
        wordListLevel = "https://ericchung93.github.io/easy_words2.txt"
        PlayBtn.isEnabled = true
        display()
        allIce()
        Timer.schedule(delay: 0.1) { _ in
            self.Btn13.backgroundColor = self.lime
        }

    }
    @IBAction func Btn14Pressed(_ sender: Any) {
        stageSelected = 14
        wordListLevel = "https://ericchung93.github.io/easy_words3.txt"
        PlayBtn.isEnabled = true
        display()
        allIce()
        Timer.schedule(delay: 0.1) { _ in
            self.Btn14.backgroundColor = self.lime
        }

    }
    @IBAction func Btn15Pressed(_ sender: Any) {
        stageSelected = 15
        wordListLevel = "https://ericchung93.github.io/impossible_words.txt"
        PlayBtn.isEnabled = true
        display()
        allIce()
        Timer.schedule(delay: 0.1) { _ in
            self.Btn15.backgroundColor = self.lime
        }

    }
    @IBAction func PressedPlay(_ sender: Any) {
        
    }
    

}
