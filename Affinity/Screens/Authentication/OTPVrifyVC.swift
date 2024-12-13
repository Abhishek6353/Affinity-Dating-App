//
//  OTPVrifyVC.swift
//  Affinity
//
//  Created by Abhishek on 14/12/24.
//

import UIKit
import DPOTPView

class OTPVrifyVC: UIViewController {
    
    
    //MARK - @IBOutlets
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var otpView: DPOTPView!
    
    
    
    //MARK - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        otpView.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        otpView.resignFirstResponder()
    }
   
    
    
    //MARK - @IBActions
    @IBAction func btnBackAction(_ sender: UIButton) {
        SceneDelegate().sceneDelegate?.mainNav?.popViewController(animated: true)
    }
    
}
