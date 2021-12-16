//
//  AuthorizationCollectionViewDataSources.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 09.12.2021.
//

import Foundation
import UIKit

typealias AuthorizationCollectionViewProtocol = UICollectionViewDataSource & UICollectionViewDelegateFlowLayout

extension AuthorizationViewController: AuthorizationCollectionViewProtocol {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SignInCell", for: indexPath) as! SignInCell
            cell.signInButton.addTarget(self, action: #selector(showVerification), for: .touchUpInside)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VerifiCell", for: indexPath) as! VerificationCell
            cell.verifyButton.addTarget(self, action: #selector(showOnboarding), for: .touchUpInside)
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.size.width - 32.0
        let height = view.frame.size.height / 2.1
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scroll = scrollView.contentOffset.x / view.frame.width
        pageControl.currentPage = Int(scroll)
    }
    
    // MARK: - Objective Methods
    
    @objc
    private func showVerification() {
        let indexPath = IndexPath(item: 1, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
    }
    
    @objc
    private func showOnboarding() {
        let onboardingVC = OnboardingViewController()
        navigationController?.pushViewController(onboardingVC, animated: true)
    }
    
}
