//
//  SelectGenderVC.swift
//  Affinity
//
//  Created by Abhishek on 17/12/24.
//

import UIKit
import MaterialComponents

class SelectGenderVC: UIViewController {
    
    // MARK: - Properties
    private var selectedGender: String = ""
    
    
    // MARK: - @IBOutlets
    @IBOutlet weak var viewOtherGenderTxtField: UIView!
    @IBOutlet weak var txtOtherGender: UITextField!
    @IBOutlet weak var btnWoman: UIButton!
    @IBOutlet weak var btnMan: UIButton!
    @IBOutlet weak var btnCooseOther: UIButton!
    


    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        txtOtherGender.delegate = self
    }
    
    
    
    // MARK: - @IBActions
    @IBAction func btnBackAction(_ sender: UIButton) {
        SceneDelegate().sceneDelegate?.mainNav?.popViewController(animated: true)
    }
    
    @IBAction func btnSelectGenderAction(_ sender: UIButton) {
        selectedGender(on: sender.tag)
    }
    
    @IBAction func btnContinueAction(_ sender: UIButton) {
//        if selectedGender != "" {
//            print("Selected Gender: \(self.selectedGender)")
//        } else {
//            print("Please select gender")
//        }
        guard let vc = storyboard?.instantiateViewController(withIdentifier: SelectInterestsVC.className) as? SelectInterestsVC else { return }
        SceneDelegate().sceneDelegate?.mainNav?.pushViewController(vc, animated: true)
    }
    
    
    
    // MARK: - Functions
    private func setupUI() {
        viewOtherGenderTxtField.alpha = 0
    }

    private func selectedGender(on index : Int) {
        switch index {
            
        case 0:
            selectedGender = btnWoman.titleLabel?.text ?? ""
            
            btnWoman.backgroundColor = .primaryRed
            btnMan.backgroundColor = .clear
            btnCooseOther.backgroundColor = .clear
            self.txtOtherGender.text?.removeAll()
            UIView.animate(withDuration: 0.3) {
                self.viewOtherGenderTxtField.alpha = 0
            }
            
            
        case 1:
            selectedGender = btnMan.titleLabel?.text ?? ""
            
            btnWoman.backgroundColor = .clear
            btnMan.backgroundColor = .primaryRed
            btnCooseOther.backgroundColor = .clear
            self.txtOtherGender.text?.removeAll()
            UIView.animate(withDuration: 0.3) {
                self.viewOtherGenderTxtField.alpha = 0
            }
            
        default:
            selectedGender = ""
            
            btnWoman.backgroundColor = .clear
            btnMan.backgroundColor = .clear
            btnCooseOther.backgroundColor = .primaryRed
            UIView.animate(withDuration: 0.3) {
                self.viewOtherGenderTxtField.alpha = 1
            }
        }
    }
}




// MARK: - UITextFieldDelegate
extension SelectGenderVC: UITextFieldDelegate {
    
    // Called when the text field resigns first responder
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == txtOtherGender {
            self.selectedGender = textField.text ?? ""
        }
    }
}
