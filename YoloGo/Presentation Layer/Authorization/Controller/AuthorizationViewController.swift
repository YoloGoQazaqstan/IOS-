//
//  ViewController.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 07.12.2021.
//

import UIKit
import SnapKit

final class AuthorizationViewController: BaseViewController {
    
    // MARK: - Properties
    
    private var logoImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "logo")
        return img
    }()
    
    public var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    public let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.currentPageIndicatorTintColor = .white.withAlphaComponent(0.7)
        pc.pageIndicatorTintColor = .white.withAlphaComponent(0.3)
        pc.numberOfPages = 2
        pc.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
        return pc
    }()
    
    var coordinator: AuthorizationCoordinator?
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayouts()
        configureCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setGradientBackground()
        configureLayerCollectionView()
    }
    
}

extension AuthorizationViewController: ConfigureView {
    
    /// configure view Methods

    func setLayouts() {
        
        /// add views to superview
        [logoImage, collectionView, pageControl].forEach {
            view.addSubview($0)
        }
        
        configureView()
    }
    
    func configureView() {
        
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(view.frame.size.width / 2.5)
            $0.centerX.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(30.0)
            $0.leading.trailing.equalToSuperview().inset(16.0)
            $0.height.equalTo(view.frame.size.height / 2.0)
        }
        
        pageControl.snp.makeConstraints {
            $0.bottom.equalTo(collectionView.snp.top).inset(-8)
            $0.centerX.equalToSuperview()
        }
    }
    
    func configureCollectionView() {
        collectionView.backgroundColor = .white.withAlphaComponent(0.8)
    }
    
    func configureLayerCollectionView() {
        collectionView.layer.cornerRadius = 16.0
        collectionView.register(SignInCell.self, forCellWithReuseIdentifier: "SignInCell")
        collectionView.register(VerificationCell.self, forCellWithReuseIdentifier: "VerifiCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
}





