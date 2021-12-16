//
//  BaseViewModel.swift
//  YoloGo
//
//  Created by Zhanibek Santay on 12.12.2021.
//

import Foundation

class BaseViewModel<C: Coordinator> {
    
    weak var coordinator: C?
    
    init(coordinator: C) {
        self.coordinator = coordinator
    }
}
