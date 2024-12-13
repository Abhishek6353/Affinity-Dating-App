//
//  OnboardingViewController.swift
//  Affinity
//
//  Created by Abhishek on 11/12/24.
//

import UIKit

struct OnboardingItem {
    let title: String
    let subtitle: String
    let imageName: String
}


class OnboardingVC: UIViewController {
    
    // MARK: - Properties
    private let items = [
        OnboardingItem(title: "Algorithm",
                       subtitle: "Users going through a vetting process to ensure you never match with bots.",
                       imageName: "onboarding1"),
        OnboardingItem(title: "Matches",
                       subtitle: "We match you with people that have a large array of similar interests.",
                       imageName: "onboarding2"),
        OnboardingItem(title: "Premium",
                       subtitle: "Sign up today and enjoy the first month of premium benefits on us.",
                       imageName: "onboarding3")
    ]

    
    // MARK: - @IBOutlets
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            // Configure the layout
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
            
            // Assign the layout to the collection view
            collectionView.collectionViewLayout = layout
            collectionView.isPagingEnabled = true
            collectionView.showsHorizontalScrollIndicator = false
        }
    }
    
    @IBOutlet weak var pageControl: UIPageControl! {
        didSet {
            pageControl.numberOfPages = 3
            pageControl.tintColor = .inactive
            pageControl.currentPageIndicatorTintColor = .primaryRed
        }
    }
    

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }

    
    // MARK: - @IBActions
    @IBAction func btnCreateAccountAction(_ sender: UIButton) {
        guard let signupVC = storyboard?.instantiateViewController(withIdentifier: SignUpVC.className) as? SignUpVC else { return }
        SceneDelegate().sceneDelegate?.mainNav?.pushViewController(signupVC, animated: true)
    }
    
    
    // MARK: - Functions
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: OnboardingCell.className, bundle: nil), forCellWithReuseIdentifier: OnboardingCell.className)
    }

}



// MARK: - UICollectionView DataSource & Delegate
extension OnboardingVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.className, for: indexPath) as! OnboardingCell
        cell.configure(with: items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.bounds.width
        let page = Int((scrollView.contentOffset.x + (0.5 * width)) / width)
        pageControl.currentPage = page
    }
}

