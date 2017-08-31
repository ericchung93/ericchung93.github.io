//
//  PenguViewController.swift
//  PenguinPuzzle
//
//  Created by Eric Chung on 8/24/17.
//  Copyright © 2017 Eric Chung. All rights reserved.
//

import UIKit

extension Timer {
    class func schedule(delay: TimeInterval, handler: @escaping (Timer!) -> Void) -> Timer {
        let fireDate = delay + CFAbsoluteTimeGetCurrent()
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, 0, 0, 0, handler)
        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, CFRunLoopMode.commonModes)
        return timer!
    }
}

/*func getRequest(callback: @escaping (_ array: [String])->Void) {
    var request = URLRequest(url: URL(string: "https://ericchung93.github.io/hangman_words.txt")!)
    request.httpMethod = "GET"
    let session = URLSession.shared
    
    session.dataTask(with: request) {data, response, err in
        var result = String(data: data!, encoding: .utf8)
        var set = CharacterSet()
        set.insert(charactersIn: "\n ")
        result = result?.trimmingCharacters(in: set)
        if let words = result?.components(separatedBy: " ") {
            callback(words)
        }
        
        }.resume()
}
*/
class PenguViewController: UIViewController, UICollisionBehaviorDelegate {
    @IBOutlet var PenguImage: UIImageView!
    @IBOutlet var PenguImage1: UIImageView!
    @IBOutlet var PenguImage2: UIImageView!
    @IBOutlet var PenguImage3: UIImageView!
    @IBOutlet var PenguImage4: UIImageView!
    @IBOutlet var PenguImage5: UIImageView!
    @IBOutlet var QBtn: UIButton!
    @IBOutlet var WBtn: UIButton!
    @IBOutlet var EBtn: UIButton!
    @IBOutlet var RBtn: UIButton!
    @IBOutlet var TBtn: UIButton!
    @IBOutlet var YBtn: UIButton!
    @IBOutlet var UBtn: UIButton!
    @IBOutlet var IBtn: UIButton!
    @IBOutlet var OBtn: UIButton!
    @IBOutlet var PBtn: UIButton!
    @IBOutlet var ABtn: UIButton!
    @IBOutlet var SBtn: UIButton!
    @IBOutlet var DBtn: UIButton!
    @IBOutlet var FBtn: UIButton!
    @IBOutlet var GBtn: UIButton!
    @IBOutlet var HBtn: UIButton!
    @IBOutlet var JBtn: UIButton!
    @IBOutlet var KBtn: UIButton!
    @IBOutlet var LBtn: UIButton!
    @IBOutlet var ZBtn: UIButton!
    @IBOutlet var XBtn: UIButton!
    @IBOutlet var CBtn: UIButton!
    @IBOutlet var VBtn: UIButton!
    @IBOutlet var BBtn: UIButton!
    @IBOutlet var NBtn: UIButton!
    @IBOutlet var MBtn: UIButton!
    @IBOutlet var GameField: UILabel!
    @IBOutlet var MsgField: UILabel!
    @IBOutlet var PopupLabel: UILabel!
    @IBOutlet var PopupImg: UIImageView!
    @IBOutlet var PopupMsgLabel: UILabel!
    @IBOutlet var PopupBtn: UIButton!
    @IBOutlet var PopupView: UIView!

    
    var wordArr : [String] = []
    var mysteryWord: String = ""
    var hangCount : Int = 0
    var guessArr : [String] = []
    var guess: String = ""
    var gameArr : [String] = []
    var runAwayImg: [UIImage] = [#imageLiteral(resourceName: "PenguWalk4x-1"), #imageLiteral(resourceName: "PenguWalk4x-2"), #imageLiteral(resourceName: "PenguWalk4x-3"), #imageLiteral(resourceName: "PenguWalk4x-4"), #imageLiteral(resourceName: "PenguWalk4x-5"), #imageLiteral(resourceName: "PenguWalk4x-6")]
    var getKilledImg: [UIImage] = [#imageLiteral(resourceName: "PenguHit0"), #imageLiteral(resourceName: "PenguHit0"), #imageLiteral(resourceName: "PenguHit0"), #imageLiteral(resourceName: "PenguHit1"), #imageLiteral(resourceName: "PenguHit1"), #imageLiteral(resourceName: "PenguHit1"), #imageLiteral(resourceName: "PenguHit1"), #imageLiteral(resourceName: "PenguHit1"), #imageLiteral(resourceName: "PenguHit3"), #imageLiteral(resourceName: "PenguHit4"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5")]
    var deathImg: [UIImage] = []
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var collision2: UICollisionBehavior!
    var firstContact = false
    let barrier = UIView(frame: CGRect(x: 0, y: 420, width: 420, height: 10))
    var gamesPlayed: Int!
    var gamesWon: Int!
    var highestStage: Int!
    var penguPoints: Int!
    var pengusSaved = 0
    var stage: Int!
    var wordListURL: String!
    let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(PenguViewController.back(sender:)))
    var didWin : Bool = false

    override func viewDidLoad() {
        let gamesPlayedDefaults = UserDefaults.standard
        let gamesWonDefaults = UserDefaults.standard
        let highestStageDefaults = UserDefaults.standard
        let penguPointsDefaults = UserDefaults.standard
        gamesPlayed = gamesPlayedDefaults.value(forKey: "GamesPlayed") as! Int
        gamesWon = gamesWonDefaults.value(forKey: "GamesWon") as! Int
        highestStage = highestStageDefaults.value(forKey: "HighestStage") as! Int
        penguPoints = penguPointsDefaults.value(forKey: "PenguPoints") as! Int
        PopupView.layer.cornerRadius = 10
        PopupView.layer.masksToBounds = true
        PopupBtn.layer.cornerRadius = 10
        PopupBtn.layer.masksToBounds = true
        showButtons()
        disable()
        super.viewDidLoad()
        initializeObjects()
        Timer.schedule(delay: 0.5) { _ in
            self.enable()
        }
        hangCount = 0
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = newBackButton
        getRequest() { words in
            self.wordArr = words
            let randomIndex = Int(arc4random_uniform(UInt32(self.wordArr.count)))
            print(self.wordArr)
            self.mysteryWord = self.wordArr[randomIndex].uppercased()
            print(randomIndex)
            print(self.mysteryWord)
            
            DispatchQueue.main.async {
                self.play()
            }
        }
        // Do any additional setup after loading the view.
    }
    
    func getRequest(callback: @escaping (_ array: [String])->Void) {
        var request = URLRequest(url: URL(string: wordListURL)!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        session.dataTask(with: request) {data, response, err in
            var result = String(data: data!, encoding: .utf8)
            var set = CharacterSet()
            set.insert(charactersIn: "\n ")
            result = result?.trimmingCharacters(in: set)
            if let words = result?.components(separatedBy: " ") {
                callback(words)
            }
            
            }.resume()
    }

    func back(sender: UIBarButtonItem) {
        // Perform your custom actions
        // ...
        // Go back to the previous ViewController
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func initializeObjects() {
        barrier.backgroundColor = UIColor.clear
        view.addSubview(barrier)
        newBackButton.isEnabled = true
        PenguImage.image = #imageLiteral(resourceName: "PenguHit0")
        PenguImage1.image = #imageLiteral(resourceName: "PenguHit0")
        PenguImage2.image = #imageLiteral(resourceName: "PenguHit0")
        PenguImage3.image = #imageLiteral(resourceName: "PenguHit0")
        PenguImage4.image = #imageLiteral(resourceName: "PenguHit0")
        PenguImage5.image = #imageLiteral(resourceName: "PenguHit0")
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [PenguImage, PenguImage1, PenguImage2, PenguImage3, PenguImage4, PenguImage5])
        animator.addBehavior(gravity)
        collision = UICollisionBehavior(items: [PenguImage, PenguImage2, PenguImage4])
        collision.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: barrier.frame))
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        collision.collisionDelegate = self
        collision2 = UICollisionBehavior(items: [PenguImage1, PenguImage3, PenguImage5])
        collision2.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: barrier.frame))
        collision2.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision2)
        collision2.collisionDelegate = self

        let itemBehavior = UIDynamicItemBehavior(items: [PenguImage, PenguImage1, PenguImage2, PenguImage3, PenguImage4, PenguImage5])
        itemBehavior.elasticity = 0.2
        itemBehavior.allowsRotation = false
        animator.addBehavior(itemBehavior)
    }
    
    func showButtons() {
        self.QBtn.isHidden = false
        self.WBtn.isHidden = false
        self.EBtn.isHidden = false
        self.RBtn.isHidden = false
        self.TBtn.isHidden = false
        self.YBtn.isHidden = false
        self.UBtn.isHidden = false
        self.IBtn.isHidden = false
        self.OBtn.isHidden = false
        self.PBtn.isHidden = false
        self.ABtn.isHidden = false
        self.SBtn.isHidden = false
        self.DBtn.isHidden = false
        self.FBtn.isHidden = false
        self.GBtn.isHidden = false
        self.HBtn.isHidden = false
        self.JBtn.isHidden = false
        self.KBtn.isHidden = false
        self.LBtn.isHidden = false
        self.ZBtn.isHidden = false
        self.XBtn.isHidden = false
        self.CBtn.isHidden = false
        self.VBtn.isHidden = false
        self.BBtn.isHidden = false
        self.NBtn.isHidden = false
        self.MBtn.isHidden = false
        
        
    }
    func disable() {
        self.QBtn.isEnabled = false
        self.WBtn.isEnabled = false
        self.EBtn.isEnabled = false
        self.RBtn.isEnabled = false
        self.TBtn.isEnabled = false
        self.YBtn.isEnabled = false
        self.UBtn.isEnabled = false
        self.IBtn.isEnabled = false
        self.OBtn.isEnabled = false
        self.PBtn.isEnabled = false
        self.ABtn.isEnabled = false
        self.SBtn.isEnabled = false
        self.DBtn.isEnabled = false
        self.FBtn.isEnabled = false
        self.GBtn.isEnabled = false
        self.HBtn.isEnabled = false
        self.JBtn.isEnabled = false
        self.KBtn.isEnabled = false
        self.LBtn.isEnabled = false
        self.ZBtn.isEnabled = false
        self.XBtn.isEnabled = false
        self.CBtn.isEnabled = false
        self.VBtn.isEnabled = false
        self.BBtn.isEnabled = false
        self.NBtn.isEnabled = false
        self.MBtn.isEnabled = false
    }
    
    func enable() {
        self.QBtn.isEnabled = true
        self.WBtn.isEnabled = true
        self.EBtn.isEnabled = true
        self.RBtn.isEnabled = true
        self.TBtn.isEnabled = true
        self.YBtn.isEnabled = true
        self.UBtn.isEnabled = true
        self.IBtn.isEnabled = true
        self.OBtn.isEnabled = true
        self.PBtn.isEnabled = true
        self.ABtn.isEnabled = true
        self.SBtn.isEnabled = true
        self.DBtn.isEnabled = true
        self.FBtn.isEnabled = true
        self.GBtn.isEnabled = true
        self.HBtn.isEnabled = true
        self.JBtn.isEnabled = true
        self.KBtn.isEnabled = true
        self.LBtn.isEnabled = true
        self.ZBtn.isEnabled = true
        self.XBtn.isEnabled = true
        self.CBtn.isEnabled = true
        self.VBtn.isEnabled = true
        self.BBtn.isEnabled = true
        self.NBtn.isEnabled = true
        self.MBtn.isEnabled = true
    }

    
    func play() {
        gamesPlayed = gamesPlayed + 1
        print(gamesPlayed)
        let gamesPlayedDefaults = UserDefaults.standard
        gamesPlayedDefaults.setValue(gamesPlayed, forKey: "GamesPlayed")
        MsgField.text = "WELCOME"
        for i in 0..<mysteryWord.characters.count{
            gameArr.append("_")
        }
        GameField.text = gameArr.joined(separator: "  ")
    }
    func showPopUp() {
        UIView.animate(withDuration: 0.5, animations: {
            self.PopupView.frame.origin.y += 700
            
        })
        if didWin == true {
            self.PopupLabel.text = "YOU WIN"
            self.PopupMsgLabel.text = "You rescued " + String(pengusSaved) + " Pengus!"
        }
        else {
            self.PopupLabel.text = "YOU LOSE"
            self.PopupMsgLabel.text = "The correct word was: \n" + String(mysteryWord)
        }
        }
    

    func test() {
        if mysteryWord.range(of: guess) != nil {
            print("exists")
            MsgField.text = "THE LETTER EXISTS"
            guessArr.append(guess)
            let characters = mysteryWord.characters.map { String($0) }
            for i in 0..<characters.count {
                if guess == characters[i] {
                    gameArr[i] = guess
                }
            }
            print(gameArr)
            GameField.text = gameArr.joined(separator: "  ")
            for i in 0..<characters.count {
                if gameArr.contains("_") {
                    print("Not Finished")
                }
                else {
                    showButtons()
                    disable()
                    newBackButton.isEnabled = false
                    MsgField.text = "YOU WIN! CONGRATULATIONS!"
                    didWin = true
                    gamesWon = gamesWon + 1
                    let gamesWonDefaults = UserDefaults.standard
                    gamesWonDefaults.setValue(gamesWon, forKey: "GamesWon")
                    pengusSaved = 6 - hangCount
                    let penguPointsDefaults = UserDefaults.standard
                    penguPoints = penguPoints + pengusSaved
                    penguPointsDefaults.setValue(penguPoints, forKey: "PenguPoints")
                    let stageClearedDefaults = UserDefaults.standard
                    stageClearedDefaults.setValue(stage, forKey: "StageCleared")
                    let images = [PenguImage, PenguImage1, PenguImage2, PenguImage3, PenguImage4, PenguImage5]
                    for image in images {
                        image?.animationImages = runAwayImg
                        image?.animationDuration = 0.2
                        image?.startAnimating()
                    }
                    
                    UIImageView.animate(withDuration: 5, animations: {
                        for image in images {
                            image?.frame.origin.x = (image?.frame.origin.x)! - 500
                            
                        }
                        
                    })
                    Timer.schedule(delay: 4.9) { _ in
                        self.PenguImage.isHidden = true
                        self.PenguImage1.isHidden = true
                        self.PenguImage2.isHidden = true
                        self.PenguImage3.isHidden = true
                        self.PenguImage4.isHidden = true
                        self.PenguImage5.isHidden = true
                        self.showPopUp()
//                        let winAlert = UIAlertController(title: "You Win!", message: "You rescued " + String(self.pengusSaved) + " Pengus!", preferredStyle: UIAlertControllerStyle.alert)
//                        winAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) in self.navigationController?.popViewController(animated: true)}))
//                        self.present(winAlert, animated: true, completion: nil)
                    }
                    
                    return
                }
            }
        }
        else {
            print("does not exist")
            MsgField.text = "THE LETTER DOES NOT EXIST"
            hangCount = hangCount + 1
            print(hangCount)
            if hangCount > 5 {
                showButtons()
                disable()
                newBackButton.isEnabled = false
                didWin = false
                MsgField.text = "YOU LOSE! THE CORRECT WORD WAS: \n" + String(mysteryWord)
                PenguImage5.animationImages = getKilledImg
                PenguImage5.animationDuration = 3.0
                PenguImage5.startAnimating()
                Timer.schedule(delay: 2.9) { _ in
                    self.PenguImage5.stopAnimating()
                    self.PenguImage5.isHidden = true
                    self.showPopUp()
//                    let loseAlert = UIAlertController(title: "You Lost!", message: "The correct word is: \n" + self.mysteryWord, preferredStyle: UIAlertControllerStyle.alert)
//                    loseAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) in self.navigationController?.popViewController(animated: true)}))
//                    self.present(loseAlert, animated: true, completion: nil)
                    
                }
                return
            }
            else if hangCount > 4 {
                PenguImage4.animationImages = getKilledImg
                PenguImage4.animationDuration = 3.0
                PenguImage4.startAnimating()
                Timer.schedule(delay: 2.9) { _ in
                    self.PenguImage4.stopAnimating()
                    self.PenguImage4.isHidden = true
                }
                
            }
            else if hangCount > 3 {
                PenguImage3.animationImages = getKilledImg
                PenguImage3.animationDuration = 3.0
                PenguImage3.startAnimating()
                Timer.schedule(delay: 2.9) { _ in
                    self.PenguImage3.stopAnimating()
                    self.PenguImage3.isHidden = true
                }
                
            }
            else if hangCount > 2 {
                PenguImage2.animationImages = getKilledImg
                PenguImage2.animationDuration = 3.0
                PenguImage2.startAnimating()
                Timer.schedule(delay: 2.9) { _ in
                    self.PenguImage2.stopAnimating()
                    self.PenguImage2.isHidden = true
                }
                
            }
            else if hangCount > 1 {
                PenguImage1.animationImages = getKilledImg
                PenguImage1.animationDuration = 3.0
                PenguImage1.startAnimating()
                Timer.schedule(delay: 2.9) { _ in
                    self.PenguImage1.stopAnimating()
                    self.PenguImage1.isHidden = true
                }
            }
            else if hangCount > 0 {
                PenguImage.animationImages = getKilledImg
                PenguImage.animationDuration = 3.0
                PenguImage.startAnimating()
                Timer.schedule(delay: 2.9) { _ in
                    self.PenguImage.stopAnimating()
                    self.PenguImage.isHidden = true
                }
                
            }
        }
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toPopUp" {
            let vc = segue.destination as! PopUpViewController
            vc.didYouWin = didWin
            vc.correctWord = String(mysteryWord)
            vc.pengusSaved = pengusSaved
            print(vc.didYouWin)
            print(vc.correctWord)
            print(vc.pengusSaved)
            
        }

        
    }
 */
    @IBAction func DismissPopup(_ sender: Any) {
        UIView.animate(withDuration: 0.2, animations: {
            self.PopupView.frame.origin.y -= 700
        })
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func QPressed(_ sender: Any) {
        guess = "Q"
        self.QBtn.isHidden = true
        test()
        return
    }
    @IBAction func WPressed(_ sender: Any) {
        guess = "W"
        self.WBtn.isHidden = true
        test()
        return

    }
    @IBAction func EPressed(_ sender: Any) {
        guess = "E"
        self.EBtn.isHidden = true
        test()
        return

    }
    @IBAction func RPressed(_ sender: Any) {
        guess = "R"
        self.RBtn.isHidden = true
        test()
        return

    }
    @IBAction func TPressed(_ sender: Any) {
        guess = "T"
        self.TBtn.isHidden = true
        test()
        return

    }
    @IBAction func YPressed(_ sender: Any) {
        guess = "Y"
        self.YBtn.isHidden = true
        test()
        return

    }
    @IBAction func UPressed(_ sender: Any) {
        guess = "U"
        self.UBtn.isHidden = true
        test()
        return

    }
    @IBAction func IPressed(_ sender: Any) {
        guess = "I"
        self.IBtn.isHidden = true
        test()
        return

    }
    @IBAction func OPressed(_ sender: Any) {
        guess = "O"
        self.OBtn.isHidden = true
        test()
        return

    }
    @IBAction func PPressed(_ sender: Any) {
        guess = "P"
        self.PBtn.isHidden = true
        test()
        return

    }
    @IBAction func APressed(_ sender: Any) {
        guess = "A"
        self.ABtn.isHidden = true
        test()
        return

    }
    @IBAction func SPressed(_ sender: Any) {
        guess = "S"
        self.SBtn.isHidden = true
        test()
        return

    }
    @IBAction func DPressed(_ sender: Any) {
        guess = "D"
        self.DBtn.isHidden = true
        test()
        return

    }
    @IBAction func FPressed(_ sender: Any) {
        guess = "F"
        self.FBtn.isHidden = true
        test()
        return

    }
    @IBAction func GPressed(_ sender: Any) {
        guess = "G"
        self.GBtn.isHidden = true
        test()
        return

    }
    @IBAction func HPressed(_ sender: Any) {
        guess = "H"
        self.HBtn.isHidden = true
        test()
        return

    }
    @IBAction func JPressed(_ sender: Any) {
        guess = "J"
        self.JBtn.isHidden = true
        test()
        return

    }
    @IBAction func KPressed(_ sender: Any) {
        guess = "K"
        self.KBtn.isHidden = true
        test()
        return

    }
    @IBAction func LPressed(_ sender: Any) {
        guess = "L"
        self.LBtn.isHidden = true
        test()
        return

    }
    @IBAction func ZPressed(_ sender: Any) {
        guess = "Z"
        self.ZBtn.isHidden = true
        test()
        return

    }
    @IBAction func XPressed(_ sender: Any) {
        guess = "X"
        self.XBtn.isHidden = true
        test()
        return

    }
    @IBAction func CPressed(_ sender: Any) {
        guess = "C"
        self.CBtn.isHidden = true
        test()
        return

    }
    @IBAction func VPressed(_ sender: Any) {
        guess = "V"
        self.VBtn.isHidden = true
        test()
        return

    }
    @IBAction func BPressed(_ sender: Any) {
        guess = "B"
        self.BBtn.isHidden = true
        test()
        return

    }
    @IBAction func NPressed(_ sender: Any) {
        guess = "N"
        self.NBtn.isHidden = true
        test()
        return

    }
    @IBAction func MPressed(_ sender: Any) {
        guess = "M"
        self.MBtn.isHidden = true
        test()
        return

    }
    
    

}
