//
//  PlayGameViewController.swift
//  iosImageProject
//
//  Created by Whitney Lauren on 6/19/15.
//  Copyright (c) 2015 Aimee Bragg. All rights reserved.
//

import UIKit

class PlayGameViewController: UIViewController {
    
    @IBOutlet weak var guessField: UITextField!
    
    
    @IBAction func nextButton(sender: UIButton) {
      //This should display the next in posted pictures.
      
    }
    
    @IBAction func backButton(sender: UIButton) {
        
        println("PlayGameVC 1: \(self.navigationController?.viewControllers)")
        
        let previousScreenVC = self.navigationController?.viewControllers[1] as! ProfileViewController

        self.navigationController?.popToViewController(previousScreenVC, animated: true)

    }

    
    @IBOutlet var postedPics: [UIImageView]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
