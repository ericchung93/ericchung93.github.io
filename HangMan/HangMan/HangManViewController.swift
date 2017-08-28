//
//  HangManViewController.swift
//  HangMan
//
//  Created by Eric Chung on 7/28/17.
//  Copyright © 2017 Eric Chung. All rights reserved.
//

import UIKit

//extension Timer {
//    class func schedule(delay: TimeInterval, handler: @escaping (Timer!) -> Void) -> Timer {
//        let fireDate = delay + CFAbsoluteTimeGetCurrent()
//        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, 0, 0, 0, handler)
//        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, CFRunLoopMode.commonModes)
//        return timer!
//    }
//}
//
//func getRequest(callback: @escaping (_ array: [String])->Void) {
//    var request = URLRequest(url: URL(string: "https://ericchung93.github.io/hangman_words.txt")!)
//    request.httpMethod = "GET"
//    let session = URLSession.shared
//    
//    session.dataTask(with: request) {data, response, err in
//        var result = String(data: data!, encoding: .utf8)
//        var set = CharacterSet()
//        set.insert(charactersIn: "\n ")
//        result = result?.trimmingCharacters(in: set)
//        if let words = result?.components(separatedBy: " ") {
//            callback(words)
//        }
//        
//    }.resume()
//}

class HangManViewController: UIViewController, UITextFieldDelegate {
    var wordArr : [String] = []
    var mysteryWord: String = ""
    var hangCount : Int = 0
    var guessArr : [String] = []
    var guess: String = ""
    var gameArr : [String] = []
    var hangman: [UIImage] = [#imageLiteral(resourceName: "Hangman0"), #imageLiteral(resourceName: "Hangman1"), #imageLiteral(resourceName: "Hangman2"), #imageLiteral(resourceName: "Hangman3"), #imageLiteral(resourceName: "Hangman4"),#imageLiteral(resourceName: "Hangman5"), #imageLiteral(resourceName: "Hangman6")]
    
    @IBOutlet weak var WordLabel: UILabel!
    @IBOutlet weak var WordSpaces: UILabel!
    @IBOutlet weak var HangmanImage: UIImageView!
    @IBOutlet weak var LettersGuessed: UILabel!
    @IBOutlet weak var GuessField: UITextField!
    @IBOutlet weak var GuessedLetters: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        hangCount = 0
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(HangManViewController.back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
        self.GuessField.delegate = self
        getRequest() { words in
            self.wordArr = words
            let randomIndex = Int(arc4random_uniform(UInt32(self.wordArr.count)))
            print(self.wordArr)
            self.mysteryWord = self.wordArr[randomIndex]
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func play() {
        for i in 0..<mysteryWord.characters.count{
            gameArr.append("_")
        }
        WordLabel.text = gameArr.joined(separator: "  ")
        HangmanImage.image = hangman[hangCount]

        print(WordSpaces.text)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func PressedGuess(_ sender: Any) {
        guess = GuessField.text!
        let pattern = "[^A-z]+"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let matches = regex.matches(in: guess, options: [], range: NSRange(location: 0, length: guess.characters.count))
        if guessArr.contains(guess.uppercased()) {
            WordSpaces.text = "ERROR: LETTER ALREADY GUESSED"
        }
        else if guess.uppercased() == "" {
            WordSpaces.text = "ERROR: PLEASE ENTER A LETTER"
        }
        else if matches.count > 0 {
            WordSpaces.text = "ERROR: YOU HAVE ENTERED A NON-LETTER"
        }
        else if guess.characters.count > 1 {
            WordSpaces.text = "ERROR: YOU HAVE ENTERED MORE THAN ONE CHARACTER"
        }
        else if mysteryWord.uppercased().range(of: guess.uppercased()) != nil {
            print("exists")
            WordSpaces.text = "THE LETTER EXISTS"
            guessArr.append(guess.uppercased())
            let characters = mysteryWord.characters.map { String($0) }
            for i in 0..<characters.count {
                if guess.uppercased() == characters[i].uppercased() {
                    gameArr[i] = guess.uppercased()
                }
            }
            print(gameArr)
            WordLabel.text = gameArr.joined(separator: "  ")
            GuessedLetters.text = guessArr.joined(separator: "")
            for i in 0..<characters.count {
                if gameArr.contains("_") {
                    print("Not Finished")
                }
                else {
                    WordSpaces.text = "YOU WIN! CONGRATULATIONS!"
                    Timer.schedule(delay: 3) { _ in
                        self.navigationController?.popViewController(animated: true)
                    }

                    return
                }
            }
        }
        else {
            print("does not exist")
            WordSpaces.text = "THE LETTER DOES NOT EXIST"
            hangCount = hangCount + 1
            HangmanImage.image = hangman[hangCount]
            guessArr.append(guess.uppercased())
            GuessedLetters.text = guessArr.joined(separator: "")
            print(hangCount)
            if hangCount > 5 {
                WordSpaces.text = "YOU LOSE! THE CORRECT WORD WAS: \n" + String(mysteryWord.uppercased())
                Timer.schedule(delay: 3) { _ in
                    self.navigationController?.popViewController(animated: true)
                }
                return
            }
        }
    }

}
