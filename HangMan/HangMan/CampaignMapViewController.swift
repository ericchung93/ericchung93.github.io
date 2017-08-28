//
//  CampaignMapViewController.swift
//  HangMan
//
//  Created by Eric Chung on 8/13/17.
//  Copyright © 2017 Eric Chung. All rights reserved.
//

import UIKit



class CampaignMapViewController: UIViewController {
    @IBOutlet weak var stage1: UIButton!
    @IBOutlet weak var stage2: UIButton!
    @IBOutlet weak var stage3: UIButton!
    @IBOutlet weak var stage4: UIButton!
    @IBOutlet weak var stage5: UIButton!
    @IBOutlet weak var stage6: UIButton!
    @IBOutlet weak var stage7: UIButton!
    @IBOutlet weak var stage8: UIButton!
    @IBOutlet weak var stage9: UIButton!
    @IBOutlet weak var stage10: UIButton!
    @IBOutlet weak var stage11: UIButton!
    @IBOutlet weak var stage12: UIButton!
    @IBOutlet weak var stage13: UIButton!
    @IBOutlet weak var stage14: UIButton!
    @IBOutlet weak var stage15: UIButton!
    
    var highestStage : Int!
    var stageCleared : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stage2.isHidden = true
        stage3.isHidden = true
        stage4.isHidden = true
        stage5.isHidden = true
        stage6.isHidden = true
        stage7.isHidden = true
        stage8.isHidden = true
        stage9.isHidden = true
        stage10.isHidden = true
        stage11.isHidden = true
        stage12.isHidden = true
        stage13.isHidden = true
        stage14.isHidden = true
        stage15.isHidden = true
        let highestStageDefaults = UserDefaults.standard
        highestStage = highestStageDefaults.value(forKey: "HighestStage") as! Int
        let stageClearedDefaults = UserDefaults.standard
        stageCleared = stageClearedDefaults.value(forKey: "StageCleared") as! Int
        if stageCleared > highestStage
        {
            highestStage = stageCleared
        }
        if highestStage > 0 {
            stage2.isHidden = false
        }
        if highestStage > 1 {
            stage3.isHidden = false
        }
        if highestStage > 2 {
            stage4.isHidden = false
        }
        if highestStage > 3 {
            stage5.isHidden = false
        }
        if highestStage > 4 {
            stage6.isHidden = false
        }
        if highestStage > 5 {
            stage7.isHidden = false
        }
        if highestStage > 6 {
            stage8.isHidden = false
        }
        if highestStage > 7 {
            stage9.isHidden = false
        }
        if highestStage > 8 {
            stage10.isHidden = false
        }
        if highestStage > 9 {
            stage11.isHidden = false
        }
        if highestStage > 10 {
            stage12.isHidden = false
        }
        if highestStage > 11 {
            stage13.isHidden = false
        }
        if highestStage > 12 {
            stage14.isHidden = false
        }
        if highestStage > 13 {
            stage15.isHidden = false
        }

        highestStageDefaults.setValue(highestStage, forKey: "HighestStage")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let highestStageDefaults = UserDefaults.standard
        highestStage = highestStageDefaults.value(forKey: "HighestStage") as! Int
        let stageClearedDefaults = UserDefaults.standard
        stageCleared = stageClearedDefaults.value(forKey: "StageCleared") as! Int
        if stageCleared > highestStage
        {
            highestStage = stageCleared
        }
        if highestStage > 0 {
            stage2.isHidden = false
        }
        if highestStage > 1 {
            stage3.isHidden = false
        }
        if highestStage > 2 {
            stage4.isHidden = false
        }
        if highestStage > 3 {
            stage5.isHidden = false
        }
        if highestStage > 4 {
            stage6.isHidden = false
        }
        if highestStage > 5 {
            stage7.isHidden = false
        }
        if highestStage > 6 {
            stage8.isHidden = false
        }
        if highestStage > 7 {
            stage9.isHidden = false
        }
        if highestStage > 8 {
            stage10.isHidden = false
        }
        if highestStage > 9 {
            stage11.isHidden = false
        }
        if highestStage > 10 {
            stage12.isHidden = false
        }
        if highestStage > 11 {
            stage13.isHidden = false
        }
        if highestStage > 12 {
            stage14.isHidden = false
        }
        if highestStage > 13 {
            stage15.isHidden = false
        }
        highestStageDefaults.setValue(highestStage, forKey: "HighestStage")
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "Stage1toSplatter" {
            let vc = segue.destination as! SplatterManViewController
            vc.stage = 1
        }
        else if segue.identifier == "Stage2toSplatter" {
            let vc = segue.destination as! SplatterManViewController
            vc.stage = 2
        }
        else if segue.identifier == "Stage3toSplatter" {
            let vc = segue.destination as! SplatterManViewController
            vc.stage = 3
        }
        else if segue.identifier == "Stage4toSplatter" {
            let vc = segue.destination as! SplatterManViewController
            vc.stage = 4
        }
        else if segue.identifier == "Stage5toSplatter" {
            let vc = segue.destination as! SplatterManViewController
            vc.stage = 5
        }
        else if segue.identifier == "Stage6toSplatter" {
            let vc = segue.destination as! SplatterManViewController
            vc.stage = 6
        }
        else if segue.identifier == "Stage7toSplatter" {
            let vc = segue.destination as! SplatterManViewController
            vc.stage = 7
        }
        else if segue.identifier == "Stage8toSplatter" {
            let vc = segue.destination as! SplatterManViewController
            vc.stage = 8
        }
        else if segue.identifier == "Stage9toSplatter" {
            let vc = segue.destination as! SplatterManViewController
            vc.stage = 9
        }
        else if segue.identifier == "Stage10toSplatter" {
            let vc = segue.destination as! SplatterManViewController
            vc.stage = 10
        }
        else if segue.identifier == "Stage11toSplatter" {
            let vc = segue.destination as! SplatterManViewController
            vc.stage = 11
        }
        else if segue.identifier == "Stage12toSplatter" {
            let vc = segue.destination as! SplatterManViewController
            vc.stage = 12
        }
        else if segue.identifier == "Stage13toSplatter" {
            let vc = segue.destination as! SplatterManViewController
            vc.stage = 13
        }
        else if segue.identifier == "Stage14toSplatter" {
            let vc = segue.destination as! SplatterManViewController
            vc.stage = 14
        }
        else if segue.identifier == "Stage15toSplatter" {
            let vc = segue.destination as! SplatterManViewController
            vc.stage = 15
        }
    }
    

}
