//
//  HomeFloatingViewController.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 16.12.2021.
//

import UIKit

class HomeFloatingViewController: BaseViewController {
    
    // MARK: - Properties
    
    var startPositionView = YoloCustomView(icon: "startPoint", address: "Ваш адрес")
    var finishPositionView = YoloCustomView(icon: "endPoint", address: "Адрес, по которому вы хотите вызвать такси")
    var priceView = YoloCustomView(icon: "tenge", address: "")
    
    lazy var stackPointView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            startPositionView,
            finishPositionView,
            priceView
        ])
        
        sv.spacing = 16.0
        sv.axis = .vertical
        
        return sv
    }()
    
    var priceTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Предложите цену"
        tf.font = Fonts.medium(size: 16.0)
        tf.backgroundColor = .clear
        return tf
    }()
    
    var searchTaxiButton: ActualGradientButton = {
        let btn = ActualGradientButton(type: .system)
        btn.setTitle("Поиск такси", font: Fonts.medium(size: 18.0), color: .white)
        btn.layer.cornerRadius = 16.0
        btn.addTarget(self, action: #selector(handleShowSearchFlow), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayouts()
        showToChooseAddressFlow()
    }
}

// MARK: - Configure UI

extension HomeFloatingViewController: ConfigureView {
    
    func setLayouts() {
        
        [stackPointView, searchTaxiButton].forEach {
            view.addSubview($0)
        }
        
        stackPointView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16.0)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(24.0)
        }
        
        searchTaxiButton.snp.makeConstraints {
            $0.top.equalTo(stackPointView.safeAreaLayoutGuide.snp.bottom).offset(16.0)
            $0.height.equalTo(48.0)
            $0.leading.trailing.equalToSuperview().inset(16.0)
        }
        
        configureView()
    }
    
    func configureView() {
        priceView.addressImage.snp.remakeConstraints {
            $0.height.width.equalTo(16.0)
            $0.leading.equalToSuperview().inset(16.0)
            $0.centerY.equalToSuperview()
        }
        
        priceView.addSubview(priceTextField)
        
        priceTextField.snp.makeConstraints {
            $0.leading.equalTo(priceView.addressImage.safeAreaLayoutGuide.snp.trailing).offset(16.0)
            $0.trailing.bottom.top.equalToSuperview()
        }
    }
    
    func showToChooseAddressFlow() {
        
        let vc = ChooseAddressViewController()
        
        [startPositionView, finishPositionView].forEach {
            $0.onTapped { [unowned self] in
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    // MARK: - Objective Methods
    @objc
    fileprivate func handleShowSearchFlow() {
        let vc = SearchTaxiViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
