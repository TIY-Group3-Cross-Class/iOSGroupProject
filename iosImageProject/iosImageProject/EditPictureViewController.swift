//
//  EditPictureViewController.swift
//  iosImageProject
//
//  Created by Whitney Lauren on 6/19/15.
//  Copyright (c) 2015 Aimee Bragg. All rights reserved.
//

import UIKit

class EditPictureViewController: UIViewController {
    
    @IBAction func backButton(sender: UIButton) {
        var profileVC = self.storyboard?.instantiateViewControllerWithIdentifier("profileVC")
            as! ProfileViewController
        
        self.presentViewController(profileVC, animated: false, completion: nil)
    }
    
    @IBAction func submitButton(sender: UIButton) {
        var profileVC = self.storyboard?.instantiateViewControllerWithIdentifier("profileVC")
            as! ProfileViewController
        
        self.presentViewController(profileVC, animated: false, completion: nil)
    }
    
    @IBOutlet weak var answerField: UITextField!
    

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
