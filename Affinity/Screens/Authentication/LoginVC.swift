//
//  LoginVC.swift
//  Affinity
//
//  Created by Abhishek on 14/12/24.
//

import UIKit
import CountryPickerView

class LoginVC: UIViewController {
    
    // MARK: - Properties
    private lazy var counryPickerView: CountryPickerView = {
        let cpv = CountryPickerView()
        cpv.font = UIFont.systemFont(ofSize: 14)
        cpv.delegate = self
        cpv.flagSpacingInView = 5
        cpv.showCountryCodeInView = false
        return cpv
    }()
    
    private lazy var countryPickerContainer: UIView = {
        let container = UIView()
        counryPickerView.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(counryPickerView)
        
        // Add width constraint to container
        container.widthAnchor.constraint(equalToConstant: 80).isActive = true

        NSLayoutConstraint.activate([
            counryPickerView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            counryPickerView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            counryPickerView.heightAnchor.constraint(equalTo: container.heightAnchor)
        ])
        
        // Add 5 points trailing padding
        counryPickerView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -5).isActive = true
        
        return container
    }()
    
    
    
    // MARK: - @IBOutlets
    @IBOutlet weak var txtPhoneNumber: UITextField! {
        didSet {
            configurePhoneNumberTextField()
        }
    }
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        txtPhoneNumber.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        txtPhoneNumber.resignFirstResponder()
    }

    
    // MARK: - @IBActions
    @IBAction func btnContinueAction(_ sender: UIButton) {
        handleContinueButtonTap()
    }
    
    
    // MARK: - Private Functions
    private func configurePhoneNumberTextField() {
        txtPhoneNumber.leftView = countryPickerContainer
        txtPhoneNumber.leftViewMode = .always
        txtPhoneNumber.textContentType = .telephoneNumber
        txtPhoneNumber.keyboardType = .numberPad
    }
    
    private func setupUI() {
        // Add any additional UI setup here
    }
    
    private func handleContinueButtonTap() {
        txtPhoneNumber.resignFirstResponder()
        
        guard let phoneNumber = txtPhoneNumber.text, !phoneNumber.isEmpty else {
            print("Please enter phone number")
            return
        }
        
        // Handle phone number validation and continue action
        let formattedNumber = "\(counryPickerView.selectedCountry.phoneCode) \(phoneNumber)"
        print("Formatted phone number: \(formattedNumber)")
        
        
        guard let otpVerifyVC = self.storyboard?.instantiateViewController(withIdentifier: OTPVrifyVC.className) as? OTPVrifyVC else {
            return
        }
        SceneDelegate().sceneDelegate?.mainNav?.pushViewController(otpVerifyVC, animated: true)
    }

}


// MARK: - Country Picker Delegate Methods
extension LoginVC: CountryPickerViewDelegate {
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: CPVCountry) {
        print("Selected Country: \(country)")
    }
}
