//
//  MyProfileViewController.swift
//  HangMan
//
//  Created by Eric Chung on 8/11/17.
//  Copyright © 2017 Eric Chung. All rights reserved.
//

import UIKit
import CoreData

class MyProfileViewController: UIViewController {
    @IBOutlet weak var gamesPlayed: UILabel!
    @IBOutlet weak var gamesWon: UILabel!
    @IBOutlet weak var highestStage: UILabel!
    @IBOutlet weak var penguPoints: UILabel!
    
    var gamesPlayed1 : Int!
    var gamesWon1 : Int!
    var highestStage1: Int!
    var penguPoints1: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        let gamesPlayedDefaults = UserDefaults.standard
        let gamesWonDefaults = UserDefaults.standard
        let highestStageDefaults = UserDefaults.standard
        let penguPointsDefaults = UserDefaults.standard
        
        gamesPlayed1 = gamesPlayedDefaults.value(forKey: "GamesPlayed") as! Int
        gamesWon1 = gamesWonDefaults.value(forKey: "GamesWon") as! Int
        highestStage1 = highestStageDefaults.value(forKey: "HighestStage") as! Int
        penguPoints1 = penguPointsDefaults.value(forKey: "PenguPoints") as! Int
        
        gamesPlayed.text = String(gamesPlayed1)
        gamesWon.text = String(gamesWon1)
        highestStage.text = String(highestStage1)
        penguPoints.text = String(penguPoints1)

        // Do any additional setup after loading the view.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let gamesPlayedDefaults = UserDefaults.standard
        let gamesWonDefaults = UserDefaults.standard
        let highestStageDefaults = UserDefaults.standard
        let penguPointsDefaults = UserDefaults.standard
        
        gamesPlayed1 = gamesPlayedDefaults.value(forKey: "GamesPlayed") as! Int
        gamesWon1 = gamesWonDefaults.value(forKey: "GamesWon") as! Int
        highestStage1 = highestStageDefaults.value(forKey: "HighestStage") as! Int
        penguPoints1 = penguPointsDefaults.value(forKey: "PenguPoints") as! Int
        
        gamesPlayed.text = String(gamesPlayed1)
        gamesWon.text = String(gamesWon1)
        highestStage.text = String(highestStage1)
        penguPoints.text = String(penguPoints1)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
