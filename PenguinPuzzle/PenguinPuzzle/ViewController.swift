//
//  ViewController.swift
//  PenguinPuzzle
//
//  Created by Eric Chung on 8/24/17.
//  Copyright © 2017 Eric Chung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var PlayCampaign: UIButton!
    @IBOutlet var WordList: UIButton!
    @IBOutlet var PenguProfile: UIButton!
    @IBOutlet var PenguLabel: UILabel!
    @IBOutlet var PuzzleLabel: UILabel!
    
    
    var gamesPlayed = 0
    var gamesWon = 0
    var highestStage = 0
    var penguPoints = 0
    var stageCleared = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        PenguLabel.textColor = UIColor.white
        PuzzleLabel.textColor = UIColor.white
        PlayCampaign.titleLabel?.textColor = UIColor.white
        WordList.titleLabel?.textColor = UIColor.white
        PenguProfile.titleLabel?.textColor = UIColor.white
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"ArcticHome")!)
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "ArcticHome")?.draw(in: self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        // Do any additional setup after loading the view, typically from a nib.
        
        let gamesPlayedDefaults = UserDefaults.standard
        let gamesWonDefaults = UserDefaults.standard
        let highestStageDefaults = UserDefaults.standard
        let penguPointsDefaults = UserDefaults.standard
        let stageClearedDefaults = UserDefaults.standard
        
        if let gamesPlayedDefaults = UserDefaults.standard.value(forKey: "GamesPlayed") as? Int {
            gamesPlayed = gamesPlayedDefaults
        }
        gamesPlayedDefaults.setValue(gamesPlayed, forKey: "GamesPlayed")
        print(gamesPlayedDefaults)
        if let gamesWonDefaults = UserDefaults.standard.value(forKey: "GamesWon") as? Int {
            gamesWon = gamesWonDefaults
        }
        gamesWonDefaults.setValue(gamesWon, forKey: "GamesWon")
        print(gamesWonDefaults)
        if let highestStageDefaults = UserDefaults.standard.value(forKey: "HighestStage") as? Int {
            highestStage = highestStageDefaults
        }
        highestStageDefaults.setValue(highestStage, forKey: "HighestStage")
        print(highestStageDefaults)
        if let penguPointsDefaults = UserDefaults.standard.value(forKey: "PenguPoints") as? Int {
            penguPoints = penguPointsDefaults
        }
        penguPointsDefaults.setValue(penguPoints, forKey: "PenguPoints")
        print(penguPointsDefaults)
        if let stageClearedDefaults = UserDefaults.standard.value(forKey: "StageCleared") as? Int {
            stageCleared = stageClearedDefaults
        }
        stageClearedDefaults.setValue(stageCleared, forKey: "StageCleared")
        print(stageCleared)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        PlayCampaign.titleLabel?.textColor = UIColor.white
        WordList.titleLabel?.textColor = UIColor.white
        PenguProfile.titleLabel?.textColor = UIColor.white
    }
    
    @IBAction func PlayCampaign(_ sender: Any) {
        print("Play Campaign")
        PlayCampaign.titleLabel?.textColor = UIColor.cyan
        
    }
    @IBAction func WordList(_ sender: Any) {
        print("Word List")
        WordList.titleLabel?.textColor = UIColor.cyan
    }
    @IBAction func PenguProfile(_ sender: Any) {
        print("PenguProfile")
        PenguProfile.titleLabel?.textColor = UIColor.cyan
    }
    
    


}

