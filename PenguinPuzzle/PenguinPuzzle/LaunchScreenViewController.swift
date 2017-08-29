//
//  LaunchScreenViewController.swift
//  PenguinPuzzle
//
//  Created by Eric Chung on 8/24/17.
//  Copyright © 2017 Eric Chung. All rights reserved.
//

import UIKit

class SegueFromLeft: UIStoryboardSegue
{
    override func perform()
    {
        let src = self.source
        let dst = self.destination
        
        src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
        dst.view.transform = CGAffineTransform(translationX: src.view.frame.size.width, y: 0)
        
        UIView.animate(withDuration: 0.25,
                                   delay: 0.0,
                                   options: [UIViewAnimationOptions.curveEaseInOut],
                                   animations: {
                                    dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
        },
                                   completion: { finished in
                                    src.present(dst, animated: false, completion: nil)
        }
        )
    }
}

class LaunchScreenViewController: UIViewController {
   
    @IBOutlet var LoadingImage: UIImageView!
    @IBOutlet var LoadingLabel: UILabel!

    var launchImage : [UIImage] = [#imageLiteral(resourceName: "YetiNPepe"), #imageLiteral(resourceName: "YetiNPepe1"), #imageLiteral(resourceName: "YetiNPepe2"), #imageLiteral(resourceName: "YetiNPepe3"), #imageLiteral(resourceName: "YetiNPepe4"), #imageLiteral(resourceName: "YetiNPepe5"), #imageLiteral(resourceName: "YetiNPepe6"), #imageLiteral(resourceName: "YetiNPepe7"), #imageLiteral(resourceName: "YetiNPepe8")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadingImage.isHidden = false
        LoadingImage.image = #imageLiteral(resourceName: "YetiNPepe")
        animate()

        // Do any additional setup after loading the view.
        perform(#selector(LaunchScreenViewController.showNavController), with: nil, afterDelay: 5.0)
    }
    func showNavController()
    {
        performSegue(withIdentifier: "ToNavigation", sender: self)
    }
    func animate()
    {
        self.LoadingImage.animationImages = launchImage
        self.LoadingImage.animationDuration = 1.0
        self.LoadingImage.startAnimating()
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

}
