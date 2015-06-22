//
//  RegisterViewController.swift
//  iosImageProject
//
//  Created by Whitney Lauren on 6/19/15.
//  Copyright (c) 2015 Aimee Bragg. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var fullnameOutlet: UITextField!
    
    @IBOutlet weak var usernameOutlet: UITextField!
    
    
    @IBOutlet weak var emailOutlet: UITextField!
    
    @IBOutlet weak var passwordOulet: UITextField!

    @IBAction func submitButton(sender: UIButton) {
        
        RailsRequest.session().username = usernameOutlet.text
        RailsRequest.session().password = passwordOulet.text
        RailsRequest.session().fullname = fullnameOutlet.text
        RailsRequest.session().email = emailOutlet.text
        
        RailsRequest.session().registerWithCompletion { () -> Void in

            var profileVC = self.storyboard?.instantiateViewControllerWithIdentifier("profileVC")
                as! ProfileViewController
            
            self.navigationController?.pushViewController(profileVC, animated: true)
            
//            self.presentViewController(profileVC, animated: false, completion: nil)

            
        }
        
        
    }
    

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
