//
//  SplatterManViewController.swift
//  HangMan
//
//  Created by Eric Chung on 8/3/17.
//  Copyright © 2017 Eric Chung. All rights reserved.
//

import UIKit
import CoreData

extension Timer {
    class func schedule(delay: TimeInterval, handler: @escaping (Timer!) -> Void) -> Timer {
        let fireDate = delay + CFAbsoluteTimeGetCurrent()
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, 0, 0, 0, handler)
        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, CFRunLoopMode.commonModes)
        return timer!
    }
}

func getRequest(callback: @escaping (_ array: [String])->Void) {
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

class SplatterManViewController: UIViewController, UICollisionBehaviorDelegate {
    var wordArr : [String] = []
    var mysteryWord: String = ""
    var hangCount : Int = 0
    var guessArr : [String] = []
    var guess: String = ""
    var gameArr : [String] = []
    var runAwayImg: [UIImage] = [#imageLiteral(resourceName: "PenguWalk4x0"), #imageLiteral(resourceName: "PenguWalk4x1"), #imageLiteral(resourceName: "PenguWalk4x2"), #imageLiteral(resourceName: "PenguWalk4x3"), #imageLiteral(resourceName: "PenguWalk4x4"), #imageLiteral(resourceName: "PenguWalk4x5")]
    var getKilledImg: [UIImage] = [#imageLiteral(resourceName: "PenguHit0"), #imageLiteral(resourceName: "PenguHit0"), #imageLiteral(resourceName: "PenguHit0"), #imageLiteral(resourceName: "PenguHit1"), #imageLiteral(resourceName: "PenguHit1"), #imageLiteral(resourceName: "PenguHit1"), #imageLiteral(resourceName: "PenguHit1"), #imageLiteral(resourceName: "PenguHit1"), #imageLiteral(resourceName: "PenguHit3"), #imageLiteral(resourceName: "PenguHit4"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5"), #imageLiteral(resourceName: "PenguHit5")]
    var deathImg: [UIImage] = []
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var firstContact = false
    let barrier = UIView(frame: CGRect(x: 0, y: 420, width: 420, height: 10))
    var gamesPlayed: Int!
    var gamesWon: Int!
    var highestStage: Int!
    var penguPoints: Int!
    var pengusSaved = 0
    var stage: Int!
    
    @IBOutlet weak var QBtn: UIButton!
    @IBOutlet weak var WBtn: UIButton!
    @IBOutlet weak var EBtn: UIButton!
    @IBOutlet weak var RBtn: UIButton!
    @IBOutlet weak var TBtn: UIButton!
    @IBOutlet weak var YBtn: UIButton!
    @IBOutlet weak var UBtn: UIButton!
    @IBOutlet weak var IBtn: UIButton!
    @IBOutlet weak var OBtn: UIButton!
    @IBOutlet weak var PBtn: UIButton!
    @IBOutlet weak var ABtn: UIButton!
    @IBOutlet weak var SBtn: UIButton!
    @IBOutlet weak var DBtn: UIButton!
    @IBOutlet weak var FBtn: UIButton!
    @IBOutlet weak var GBtn: UIButton!
    @IBOutlet weak var HBtn: UIButton!
    @IBOutlet weak var JBtn: UIButton!
    @IBOutlet weak var KBtn: UIButton!
    @IBOutlet weak var LBtn: UIButton!
    @IBOutlet weak var ZBtn: UIButton!
    @IBOutlet weak var XBtn: UIButton!
    @IBOutlet weak var CBtn: UIButton!
    @IBOutlet weak var VBtn: UIButton!
    @IBOutlet weak var BBtn: UIButton!
    @IBOutlet weak var NBtn: UIButton!
    @IBOutlet weak var MBtn: UIButton!
    @IBOutlet weak var GameSpace: UILabel!
    @IBOutlet weak var MsgSpace: UILabel!
    @IBOutlet var PenguImage: UIImageView!
    @IBOutlet var PenguImage1: UIImageView!
    @IBOutlet var PenguImage2: UIImageView!
    @IBOutlet var PenguImage3: UIImageView!
    @IBOutlet var PenguImage4: UIImageView!
    @IBOutlet var PenguImage5: UIImageView!
    

    override func viewDidLoad() {
        let gamesPlayedDefaults = UserDefaults.standard
        let gamesWonDefaults = UserDefaults.standard
        let highestStageDefaults = UserDefaults.standard
        let penguPointsDefaults = UserDefaults.standard
        gamesPlayed = gamesPlayedDefaults.value(forKey: "GamesPlayed") as! Int
        gamesWon = gamesWonDefaults.value(forKey: "GamesWon") as! Int
        highestStage = highestStageDefaults.value(forKey: "HighestStage") as! Int
        penguPoints = penguPointsDefaults.value(forKey: "PenguPoints") as! Int
        hideButtons()
        super.viewDidLoad()
        initializeObjects()
        Timer.schedule(delay: 1.0) { _ in
        self.showButtons()
        }
        hangCount = 0
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(HangManViewController.back(sender:)))
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
        PenguImage.image = #imageLiteral(resourceName: "PenguHit0")
        PenguImage1.image = #imageLiteral(resourceName: "PenguHit0")
        PenguImage2.image = #imageLiteral(resourceName: "PenguHit0")
        PenguImage3.image = #imageLiteral(resourceName: "PenguHit0")
        PenguImage4.image = #imageLiteral(resourceName: "PenguHit0")
        PenguImage5.image = #imageLiteral(resourceName: "PenguHit0")
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [PenguImage, PenguImage1, PenguImage2, PenguImage3, PenguImage4, PenguImage5])
        animator.addBehavior(gravity)
        collision = UICollisionBehavior(items: [PenguImage, PenguImage1, PenguImage2, PenguImage3, PenguImage4, PenguImage5])
        collision.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: barrier.frame))
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        collision.collisionDelegate = self
        let itemBehavior = UIDynamicItemBehavior(items: [PenguImage, PenguImage1, PenguImage2, PenguImage3, PenguImage4, PenguImage5])
        itemBehavior.elasticity = 0.2
        itemBehavior.allowsRotation = false
        animator.addBehavior(itemBehavior)
    }
    
    func hideButtons() {
        self.QBtn.isHidden = true
        self.WBtn.isHidden = true
        self.EBtn.isHidden = true
        self.RBtn.isHidden = true
        self.TBtn.isHidden = true
        self.YBtn.isHidden = true
        self.UBtn.isHidden = true
        self.IBtn.isHidden = true
        self.OBtn.isHidden = true
        self.PBtn.isHidden = true
        self.ABtn.isHidden = true
        self.SBtn.isHidden = true
        self.DBtn.isHidden = true
        self.FBtn.isHidden = true
        self.GBtn.isHidden = true
        self.HBtn.isHidden = true
        self.JBtn.isHidden = true
        self.KBtn.isHidden = true
        self.LBtn.isHidden = true
        self.ZBtn.isHidden = true
        self.XBtn.isHidden = true
        self.CBtn.isHidden = true
        self.VBtn.isHidden = true
        self.BBtn.isHidden = true
        self.NBtn.isHidden = true
        self.MBtn.isHidden = true
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
    
    func play() {
        gamesPlayed = gamesPlayed + 1
        print(gamesPlayed)
        let gamesPlayedDefaults = UserDefaults.standard
        gamesPlayedDefaults.setValue(gamesPlayed, forKey: "GamesPlayed")
        GameSpace.text = "WELCOME"
        for i in 0..<mysteryWord.characters.count{
            gameArr.append("_")
        }
        GameSpace.text = gameArr.joined(separator: "  ")
    }

    func test() {
        if mysteryWord.range(of: guess) != nil {
            print("exists")
            MsgSpace.text = "THE LETTER EXISTS"
            guessArr.append(guess)
            let characters = mysteryWord.characters.map { String($0) }
            for i in 0..<characters.count {
                if guess == characters[i] {
                    gameArr[i] = guess
                }
            }
            print(gameArr)
            GameSpace.text = gameArr.joined(separator: "  ")
            for i in 0..<characters.count {
                if gameArr.contains("_") {
                    print("Not Finished")
                }
                else {
                    hideButtons()
                    MsgSpace.text = "YOU WIN! CONGRATULATIONS!"
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
                    
//                    for constraint in (PenguImage.superview!.constraints) {
//                        if let first = constraint.firstItem as? NSObject, first == PenguImage {
//                            PenguImage.superview!.removeConstraint(constraint)
//                        } else if let second = constraint.secondItem as? NSObject, second == PenguImage {
//                            PenguImage.superview!.removeConstraint(constraint)
//                        }
//                    }
//                    PenguImage.removeConstraints(PenguImage.constraints)
                    UIImageView.animate(withDuration: 5, animations: {
                        self.PenguImage.frame.origin.x -= 500
//                        self.PenguImage.center.x -= 500
                        self.PenguImage1.frame.origin.x -= 500
                        self.PenguImage2.frame.origin.x -= 500
                        self.PenguImage3.frame.origin.x -= 500
                        self.PenguImage4.frame.origin.x -= 500
                        self.PenguImage5.frame.origin.x -= 500
                        
                    })
                    Timer.schedule(delay: 4.9) { _ in
                        for image in images {
                            image?.isHidden = true
                        }
                        let winAlert = UIAlertController(title: "You Win!", message: "You rescued " + String(6 - self.hangCount) + " Pengus!", preferredStyle: UIAlertControllerStyle.alert)
                        winAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) in self.navigationController?.popViewController(animated: true)}))
                        self.present(winAlert, animated: true, completion: nil)
                    }
                    
                    return
                }
            }
        }
        else {
        print("does not exist")
        MsgSpace.text = "THE LETTER DOES NOT EXIST"
        hangCount = hangCount + 1
                print(hangCount)
        if hangCount > 5 {
            hideButtons()
            MsgSpace.text = "YOU LOSE! THE CORRECT WORD WAS: \n" + String(mysteryWord)
            PenguImage5.animationImages = getKilledImg
            PenguImage5.animationDuration = 3.0
            PenguImage5.startAnimating()
            Timer.schedule(delay: 2.9) { _ in
                self.PenguImage5.stopAnimating()
                self.PenguImage5.isHidden = true
                let loseAlert = UIAlertController(title: "You Lost!", message: "The correct word is: \n" + self.mysteryWord, preferredStyle: UIAlertControllerStyle.alert)
                loseAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) in self.navigationController?.popViewController(animated: true)}))
                self.present(loseAlert, animated: true, completion: nil)

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
    }
    */
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
