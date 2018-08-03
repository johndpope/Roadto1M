//
//  ViewController.swift
//  Road to 1M
//  VERSION v1.5 *Alpha*
//  Copyright © 2018 1M. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase
//THINGS TO DO:///////////////////////////////////////////////////
// Work on Share Buttons and getting the share buttons to function
// Check for Bugs and De-Bug
// Remember to save backups to the backup folder
//
//////////////////////////////////////////////////////////////////
class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
          loginButton.frame = CGRect.init(x: 0, y: 620, width: view.frame.width, height: 50)
        
        // Facebook Access Tokens
        
        
        if (FBSDKAccessToken.current()) != nil  {
            //User is logged in
            print("Has Access token")
           
            animateHomeScreen()
            userHasBeenReturnedToMenu()
        
        } else {
            loadHomeScreen()
        }
    }
    //Outlets
    @IBOutlet weak var logoMainScreen: UIImageView!
    @IBOutlet weak var textFieldMainScreen: UIImageView!
    @IBOutlet weak var continueButton: UIButton! // +300 2
    @IBOutlet weak var upgradeButton: UIButton! // +300 3
    
 
    /////////// CHANGE TO LOGIN WITH FACEBOOK///////////////
  
    // Outlets for Icon Screen
    @IBOutlet weak var emailListButton: UIButton! // +282 0.5
    @IBOutlet weak var chatIconButton: UIButton! // +282 1
    @IBOutlet weak var businessIconButton: UIButton! // +388 1.2
    @IBOutlet weak var findNicheButton: UIButton! // +391 1.4
    @IBOutlet weak var sharingText: UIImageView! // -275 2
    @IBOutlet weak var fbSharebutton: UIButton! // -236 3
    @IBOutlet weak var twitterShareButton: UIButton! //-236 3.2
    @IBOutlet weak var instagramShareButton: UIButton! // -236 3.4
    
    // IBActions
    
    
    @IBAction func upgradeButtonTabbed(_ sender: Any) {
        performSegue(withIdentifier: "IAPSegue", sender: nil)
    }
    
    
    
    
    //HomeScreen Animations
    
    
    func animateHomeScreen() {
        self.continueButton.isHidden = true
        self.upgradeButton.isHidden = true
        
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseOut, animations: {self.emailListButton.frame.origin.y += 282})
        UIView.animate(withDuration: 1, delay: 1, options: .curveEaseOut, animations: {self.chatIconButton.frame.origin.y += 282})
        UIView.animate(withDuration: 1, delay: 1.2, options: .curveEaseOut, animations: {self.businessIconButton.frame.origin.y += 388})
        UIView.animate(withDuration: 1, delay: 1.4, options: .curveEaseOut, animations: {self.findNicheButton.frame.origin.y += 391})
        UIView.animate(withDuration: 1, delay: 2, options: .curveEaseOut, animations: {self.sharingText.frame.origin.y -= 275})
        UIView.animate(withDuration: 1, delay: 3, options: .curveEaseOut, animations: {self.fbSharebutton.frame.origin.y -= 236})
        UIView.animate(withDuration: 1, delay: 3.2, options: .curveEaseOut, animations: {self.twitterShareButton.frame.origin.y -= 236})
        UIView.animate(withDuration: 1, delay: 3.4, options: .curveEaseOut, animations: {self.instagramShareButton.frame.origin.y -= 236})
        print("Icons are in place!")
       
    }

    
    
    func loadHomeScreen () {
        UIView.animate(withDuration: 1.5, delay: 0.1, options: .curveEaseOut, animations: {self.logoMainScreen.frame.origin.y -= 440})
        UIView.animate(withDuration: 1.5, delay: 1.5, options: .curveEaseOut, animations: {self.textFieldMainScreen.frame.origin.x += 345})
        UIView.animate(withDuration: 1.5,delay: 2, options: .curveEaseOut, animations: {self.continueButton.frame.origin.x += 300})
        UIView.animate(withDuration: 1.5, delay: 3, options: .curveEaseOut, animations: {self.upgradeButton.frame.origin.x += 300})
       
        let alert = UIAlertController(title: "Welcome!", message: "Welcome to Road to One Million Application! - Alpha Version - 1M Development Team", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue!", style: .default, handler: nil))
        self.present(alert, animated: true)
       
        
    
    }
// Animates whats happened after the continue button has been clicked
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        if (FBSDKAccessToken.current()) == nil  {
            let alert = UIAlertController(title: "You must be logged in!", message: "Please login with facebook to use this application! Sending you back to the homescreen!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
            print("Home Screen is Not animating")
        } else {
            animateHomeScreen()
            //Animating if works :)
    }
    }
    
    
    func isUserLoggedIn() {
        if (FBSDKAccessToken.current()) != nil  {
            //User is logged in!
            print("Has Access token")
            performSegue(withIdentifier: "chatViewSegue", sender: self)
        } else {
            //User is logged out
           let alert = UIAlertController(title: "Sorry", message: "You need to be logged in to use this function", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            print("Needs to be logged in")
            self.present(alert, animated: true)
        }
    }
    //// BUTTON ACTIONS
    
    
    @IBAction func chatIconTapped(_ sender: UIButton) {
        isUserLoggedIn()
        }
    
    @IBAction func emailListButtonTapped(_ sender: UIButton) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "emailViewController")
        
        let top = UIApplication.shared.keyWindow?.rootViewController
        
        top?.present(viewController, animated: true, completion: nil)
        
    }
    
    
    
    
    //NAVIGATION
    // WHEN THE RETURN BUTTON IS CALLED!
    func userHasBeenReturnedToMenu() {
        if (FBSDKAccessToken.current()) != nil  {
            UIView.animate(withDuration: 1.5, delay: 0.1, options: .curveEaseOut, animations: {self.logoMainScreen.frame.origin.y -= 440})
            UIView.animate(withDuration: 1.5, delay: 1.5, options: .curveEaseOut, animations: {self.textFieldMainScreen.frame.origin.x += 345})
            
            print("Already Logged in")
        
        }
    }
}
    
