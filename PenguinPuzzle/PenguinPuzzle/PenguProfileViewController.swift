//
//  PenguProfileViewController.swift
//  PenguinPuzzle
//
//  Created by Eric Chung on 8/24/17.
//  Copyright © 2017 Eric Chung. All rights reserved.
//

import UIKit

extension UIView {
    func addBackground(imageName: String = "PenguBackground", contextMode: UIViewContentMode = .scaleToFill) {
        // setup the UIImageView
        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        backgroundImageView.image = UIImage(named: imageName)
        backgroundImageView.contentMode = contentMode
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(backgroundImageView)
        sendSubview(toBack: backgroundImageView)
        
        // adding NSLayoutConstraints
        let leadingConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let trailingConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        let topConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
        let bottomConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
    }
}
class PenguProfileViewController: UIViewController {
    @IBOutlet var GamesPlayed: UILabel!
    @IBOutlet var GamesWon: UILabel!
    @IBOutlet var HighestStage: UILabel!
    @IBOutlet var PenguPoints: UILabel!
    
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
        
        view.addBackground(imageName: "PenguBackground")
        gamesPlayed1 = gamesPlayedDefaults.value(forKey: "GamesPlayed") as! Int
        gamesWon1 = gamesWonDefaults.value(forKey: "GamesWon") as! Int
        highestStage1 = highestStageDefaults.value(forKey: "HighestStage") as! Int
        penguPoints1 = penguPointsDefaults.value(forKey: "PenguPoints") as! Int
        
        GamesPlayed.text = String(gamesPlayed1)
        GamesWon.text = String(gamesWon1)
        HighestStage.text = String(highestStage1)
        PenguPoints.text = String(penguPoints1)

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
        
        GamesPlayed.text = String(gamesPlayed1)
        GamesWon.text = String(gamesWon1)
        HighestStage.text = String(highestStage1)
        PenguPoints.text = String(penguPoints1)
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
