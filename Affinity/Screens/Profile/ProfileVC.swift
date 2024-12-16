//
//  ProfileVC.swift
//  Affinity
//
//  Created by Abhishek on 15/12/24.
//

import UIKit
import MaterialComponents

class ProfileVC: UIViewController {
    
    // MARK: - Properties
    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        picker.maximumDate = Date()
        return picker
    }()
    
    
    // MARK: - @IBOutlets
    @IBOutlet weak var txtFirstName: MDCOutlinedTextField!
    @IBOutlet weak var txtLastName: MDCOutlinedTextField!
    @IBOutlet weak var txtChooseBirthdate: UITextField!
    @IBOutlet weak var lblChooseBirthdate: UILabel!
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    
    // MARK: - @IBOutlets
    @IBAction func btnSkipAction(_ sender: UIButton) {
    }
    
    @IBAction func btnContinueAction(_ sender: UIButton) {
        
    }
    
    
    
    // MARK: - Functions
    private func setupUI() {
        setDatePicker()
        
        UIHelper.shared.configureOutlineTextField(for: txtFirstName, placeholder: "First Name")
        UIHelper.shared.configureOutlineTextField(for: txtLastName, placeholder: "Last Name")
    }
        
    private func setDatePicker() {
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onClickDoneButton))
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        txtChooseBirthdate.inputAccessoryView = toolBar
        
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = UIDatePicker.Mode.date
        datePickerView.preferredDatePickerStyle = .wheels
        datePickerView.backgroundColor = .white
        datePickerView.maximumDate = Date()
        
        txtChooseBirthdate.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(handleDatePicker(sender:)), for: UIControl.Event.valueChanged)
    }
    
    @objc func onClickDoneButton() {
        txtChooseBirthdate.resignFirstResponder()
    }
    
    @objc func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        lblChooseBirthdate.text = dateFormatter.string(from: sender.date)
    }
}
