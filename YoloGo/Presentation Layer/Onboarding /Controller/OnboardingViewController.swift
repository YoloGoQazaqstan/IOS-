//
//  OnboardingViewController.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 14.12.2021.
//

import UIKit

final class OnboardingViewController: BaseViewController {
    
    // MARK: - Properties
    
    private var progressView: UIView = {
        let v = UIView()
        v.backgroundColor = .green
        return v
    }()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    var currentIndexPath = 1
    
    var items: [OnboadingItems] = [
        OnboadingItems(imageName: "OnboardingFirst", text: "YoloGo - выберите цену и\n быстро закажите такси."),
        OnboadingItems(imageName: "OnboardingSecond", text: "YoloGo - сэкономьте свое\n время!"),
        OnboadingItems(imageName: "OnboardingThird", text: "YoloGo - создаем будущее\n вместе!")
    ]
    
    var delegate: OnboardingCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayouts()
        startTimer()
        
        // test
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let vc = HomeViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        progressView.setGradientBackground()
    }
    
}

// MARK: - Configure UI
extension OnboardingViewController: ConfigureView {
    
    func setLayouts() {
        
        [progressView, collectionView].forEach {
            view.addSubview($0)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(progressView.safeAreaLayoutGuide.snp.bottom).offset(24.0)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        configureView()
        configureCollectionView()

    }
    
    func configureView() {
        
        navigationController?.navigationBar.isHidden = true
        
        UIView.animateKeyframes(withDuration: 0.5, delay: 0.5, options: .calculationModeLinear) {
            self.progressView.frame = CGRect(x: 0, y: self.view.frame.origin.y + 40, width: 0, height: 16.0)
        } completion: { _ in
            UIView.animate(withDuration: 4.0) {
                self.progressView.frame = CGRect(x: 0, y: self.view.frame.origin.y + 40, width: self.view.frame.size.width, height: 16.0)
            }
        }
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: "OnboardingCell")
    }
    
    func startTimer() {
        _ =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
    }


    @objc func scrollAutomatically(_ timer1: Timer) {
        
        let coll = collectionView
        
        for cell in coll.visibleCells {
            
            let indexPath: IndexPath? = coll.indexPath(for: cell)
            
            if ((indexPath?.row)! < items.count - 1){
                let indexPath1: IndexPath?
                indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)

                coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
            }
            
            else {
                let indexPath1: IndexPath?
                indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
            }
        }
    }
}

// MARK: - CollectionView DataSource

extension OnboardingViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as! OnboardingCollectionViewCell
        cell.configure(data: items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width - 16.0, height: collectionView.frame.size.height - 16.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
