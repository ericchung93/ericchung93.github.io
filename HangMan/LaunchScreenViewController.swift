//
//  LaunchScreenViewController.swift
//  HangMan
//
//  Created by Eric Chung on 8/23/17.
//  Copyright © 2017 Eric Chung. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {
   
    @IBOutlet weak var LaunchImage: UIImageView!
    @IBOutlet weak var LaunchLabel: UILabel!
    
    var loadingImage : [UIImage] = [#imageLiteral(resourceName: "YetiNPepe"), #imageLiteral(resourceName: "YetiNPepe2"), #imageLiteral(resourceName: "YetiNPepe3"), #imageLiteral(resourceName: "YetiNPepe4"), #imageLiteral(resourceName: "YetiNPepe5"), #imageLiteral(resourceName: "YetiNPepe6"), #imageLiteral(resourceName: "YetiNPepe7"), #imageLiteral(resourceName: "YetiNPepe8")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LaunchImage.isHidden = false
        LaunchImage.image = #imageLiteral(resourceName: "YetiNPepe")
        animate()
        
        // Do any additional setup after loading the view.
        perform(#selector(LaunchScreenViewController.showNavController), with: nil, afterDelay: 5.0)
    }
    func showNavController()
    {
        performSegue(withIdentifier: "ToNavigation", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func animate()
    {
        self.LaunchImage.animationImages = loadingImage
        self.LaunchImage.animationDuration = 1.0
        self.LaunchImage.startAnimating()
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
