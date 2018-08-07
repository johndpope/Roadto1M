//
//  UpgradeNowVC.swift
//  Road to 1M
// Version 1.5v *Alpha*
//  Copyright © 2018 1M. All rights reserved.
//

import UIKit
import StoreKit
import FBSDKLoginKit
import Firebase
//THINGS TO DO://///////////////////////////////////////////
// 
// Test it works (y)
// Maybe work on making the text field look better
//
////////////////////////////////////////////////////////////


class UpgradeNowVC: UIViewController {
    
    let token = FBSDKAccessToken.current()
    let currentToken = FBSDKAccessToken.currentAccessTokenIsActive()
    
    @IBOutlet weak var oneTimePay: UIButton!
    @IBOutlet weak var becomeAMember: UIButton!
    @IBOutlet weak var upgradeNow: UIButton!
    @IBOutlet weak var becomeAMemberLogo: UIImageView!
    @IBOutlet weak var oneTimePaymentLogo: UIImageView!
    @IBOutlet weak var slideUpBar: UIImageView!
    
    
    //MARK:- Upgrade Now Outlet
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

    }
    // Action of when upgrade button has been tapped!
  
    
    @IBAction func homeButtonTapped(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "homeViewController") as? UINavigationController
        performSegue(withIdentifier: "benefitsToHome", sender: nil)
    }

    @IBAction func oneTimePayButtonTapped(_ sender: UIButton) {
        print("One Time Pay Button Tapped")
    }
    
    @IBAction func becomeAMemberButtonTapped(_ sender: UIButton) {
        print("Become a Member Button Tapped!")
    }
    @IBAction func upgradeNowButtonTapped(_ sender: UIButton) {
        print("Upgrade Now Button Tapped")
        loadUpgradeBar()
    
    }
    
    // Loads the Upgrade Bar
    func loadUpgradeBar() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {self.slideUpBar.frame.origin.y -= 200})
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {self.oneTimePaymentLogo.frame.origin.y -= 200})
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {self.becomeAMemberLogo.frame.origin.y -= 200})
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {self.oneTimePay.frame.origin.y -= 200})
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {self.becomeAMember.frame.origin.y -= 200})
        print("Your upgrade bar is loading!!")
    }
    // Hides Upgrade Bar
    func cancelUpgradeBar() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {self.slideUpBar.frame.origin.y += 200})
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {self.oneTimePaymentLogo.frame.origin.y += 200})
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {self.becomeAMemberLogo.frame.origin.y += 200})
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {self.oneTimePay.frame.origin.y += 200})
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {self.becomeAMember.frame.origin.y += 200})
        print("We are hiding your upgrade bar!")
    }
}


    

