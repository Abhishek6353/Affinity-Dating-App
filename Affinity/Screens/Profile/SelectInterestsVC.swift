//
//  SelectInterestsVC.swift
//  Affinity
//
//  Created by Abhishek on 17/12/24.
//

import UIKit

class SelectInterestsVC: UIViewController {
    
    // MARK: - Properties
    
    
    
    // MARK: - @IBOutlets
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: InterestsCollCell.className, bundle: nil), forCellWithReuseIdentifier: InterestsCollCell.className)
        }
    }
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    // MARK: - @IBActions
    @IBAction func btnActionView(_ sender: UIButton) {
        
    }
    
    @IBAction func btnContinueAction(_ sender: UIButton) {
        
    }
    
    
    
    // MARK: - Functions
}



//MARK: - UIcollectionView methods
extension SelectInterestsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InterestsCollCell.className, for: indexPath) as? InterestsCollCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (Int(collectionView.frame.width)-20)/2, height: 45)
    }
}
