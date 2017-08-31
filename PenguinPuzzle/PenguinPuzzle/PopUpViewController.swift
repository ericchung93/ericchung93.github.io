//
//  PopUpViewController.swift
//  PenguinPuzzle
//
//  Created by Eric Chung on 8/30/17.
//  Copyright © 2017 Eric Chung. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    @IBOutlet var YouWinYouLose: UILabel!
    @IBOutlet var YetiImage: UIImageView!
    @IBOutlet var MsgLabel: UILabel!
    @IBOutlet var EscButton: UIButton!
    @IBOutlet var PopupView: UIView!

    var didYouWin : Bool = false
    var correctWord : String = ""
    var pengusSaved : Int = 0
    var deadYeti : [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PopupView.layer.cornerRadius = 20
        PopupView.layer.masksToBounds = true
        if didYouWin == true {
            YouWinYouLose.text = "YOU WIN"
            MsgLabel.text = "You Rescued " + String(pengusSaved) + " Pengus!"
        }
        else {
            YouWinYouLose.text = "YOU LOSE"
            MsgLabel.text = "The Correct Word Was: \n" + correctWord
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func OKPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        
    }

}
