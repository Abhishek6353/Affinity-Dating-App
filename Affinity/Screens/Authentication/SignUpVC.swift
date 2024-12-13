//
//  SignUpVC.swift
//  Affinity
//
//  Created by Abhishek on 13/12/24.
//

import UIKit

class SignUpVC: UIViewController {
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    // MARK: - @IBActions
    @IBAction func btnPhoneNumberAction(_ sender: UIButton) {
        guard let phoneNumberVC = storyboard?.instantiateViewController(withIdentifier: LoginVC.className) as? LoginVC else { return }
        SceneDelegate().sceneDelegate?.mainNav?.pushViewController(phoneNumberVC, animated: true)
    }
}
