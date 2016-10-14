//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    @IBAction func emailButton(_ sender: UIButton) {
        if emailValid() == true {
            sender.layer.borderWidth = 0
            submit()
        }
        else {
            animateButtonWithIncorrectInfo(sender)
        }
    }
    
    @IBAction func emailConfButton(_ sender: UIButton) {
        if confirmEmailValid() == true {
            sender.layer.borderWidth = 0
            submit()
        }
        else {
            animateButtonWithIncorrectInfo(sender)
        }
    }
    
    @IBAction func phoneButton(_ sender: UIButton) {
        if phoneValid() == true {
            sender.layer.borderWidth = 0
            submit()
        }
        else {
            animateButtonWithIncorrectInfo(sender)
        }
    }
    
    @IBAction func passButton(_ sender: UIButton) {
        if passwordValid() == true {
            sender.layer.borderWidth = 0
            submit()
        }
        else {
            animateButtonWithIncorrectInfo(sender)
        }
    }
    
    
    @IBAction func passValidButton(_ sender: UIButton) {
        if confirmPassValid() == true {
            sender.layer.borderWidth = 0
            submit()
        }
        else {
            animateButtonWithIncorrectInfo(sender)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        self.submitButton.isEnabled = false
        
    }
    
    func emailValid() -> Bool {
        if emailTextField.text!.contains("@") {
            return true
        }
        return false
    }
    
    func confirmEmailValid() -> Bool {
        if emailConfirmationTextField.text == emailTextField.text && emailConfirmationTextField.text!.contains("@") {
            return true
        }
        return false
    }
    
    func phoneValid() -> Bool {
        if (phoneTextField.text?.characters.count)! >= 7 {
            return true
        }
        return false
    }
    
    func passwordValid() -> Bool {
        if (passwordTextField.text?.characters.count)! >= 6 {
            return true
        }
        return false
    }
    
    func confirmPassValid() -> Bool {
        if passwordConfirmTextField.text == passwordTextField.text {
            return true
        }
        return false
    }
    
    func animateButtonWithIncorrectInfo(_ button: UIButton) {
        
        UIView.animate(withDuration: 0.6, animations: {
            
            button.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 5
            button.layer.borderColor = UIColor.red.cgColor
        
        }) { success in
            
            UIView.animate(withDuration: 0.6, animations: {
            
                button.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })
        }
    }
    
    func submit() {
        if emailValid() == true && confirmEmailValid() == true && phoneValid() == true && passwordValid() == true && confirmPassValid() == true {
            self.submitButton.isEnabled = true
        }
    }
}

