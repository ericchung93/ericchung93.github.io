//
//  ViewController.swift
//  HangMan
//
//  Created by Eric Chung on 7/27/17.
//  Copyright © 2017 Eric Chung. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {
    @IBOutlet weak var WordListButton: UIButton!

    var gamesPlayed = 0
    var gamesWon = 0
    var highestStage = 0
    var penguPoints = 0
    var stageCleared = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gamesPlayedDefaults = UserDefaults.standard
        let gamesWonDefaults = UserDefaults.standard
        let highestStageDefaults = UserDefaults.standard
        let penguPointsDefaults = UserDefaults.standard
        let stageClearedDefaults = UserDefaults.standard
        
        
        
        if let gamesPlayedDefaults = UserDefaults.standard.value(forKey: "GamesPlayed") as? Int {
            gamesPlayed = gamesPlayedDefaults
        }
            gamesPlayedDefaults.setValue(gamesPlayed, forKey: "GamesPlayed")
        if let gamesWonDefaults = UserDefaults.standard.value(forKey: "GamesWon") as? Int {
            gamesWon = gamesWonDefaults
        }
            gamesWonDefaults.setValue(gamesWon, forKey: "GamesWon")
        if let highestStageDefaults = UserDefaults.standard.value(forKey: "HighestStage") as? Int {
            highestStage = highestStageDefaults
        }
            highestStageDefaults.setValue(highestStage, forKey: "HighestStage")
        if let penguPointsDefaults = UserDefaults.standard.value(forKey: "PenguPoints") as? Int {
            penguPoints = penguPointsDefaults
        }
            penguPointsDefaults.setValue(penguPoints, forKey: "PenguPoints")
        if let stageClearedDefaults = UserDefaults.standard.value(forKey: "StageCleared") as? Int {
            stageCleared = stageClearedDefaults
        }
            stageClearedDefaults.setValue(stageCleared, forKey: "StageCleared")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

