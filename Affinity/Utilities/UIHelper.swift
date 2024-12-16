//
//  UiHelper.swift
//  Affinity
//
//  Created by Abhishek on 15/12/24.
//

import Foundation
import MaterialComponents

class UIHelper: NSObject {
    
    static let shared = UIHelper()
    
    func configureOutlineTextField(for textField: MDCOutlinedTextField, placeholder text: String) {
        textField.label.text = text
        textField.placeholder = text
        textField.setOutlineColor(.lightGray, for: .normal)
        textField.setOutlineColor(.lightGray, for: .editing)
        textField.setOutlineColor(.lightGray, for: .disabled)
        textField.setFloatingLabelColor(.primaryBlack40, for: .normal)
        textField.setFloatingLabelColor(.primaryBlack40, for: .editing)
        textField.setFloatingLabelColor(.primaryBlack40, for: .disabled)
        textField.setNormalLabelColor(.primaryBlack40, for: .normal)
        textField.CornerRadius = 15
    }
}
