//
//  Fonts.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 12.12.2021.
//

import Foundation
import UIKit

struct Fonts {
   
    static let fontName = "SF Pro Display"
    static func bold(size: Float = getFontSize(size: .regular)) -> UIFont {
        return UIFont(name: "\(fontName) Bold", size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size), weight: .bold)
    }
    static func regular(size: Float = getFontSize(size: .regular)) -> UIFont {
        return UIFont(name: "\(fontName) Regular", size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size), weight: .regular)
    }
    
    static func light(size: Float = getFontSize(size: .regular)) -> UIFont {
        return UIFont(name: "\(fontName) Light", size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size), weight: .light)
    }
    static func medium(size: Float = getFontSize(size: .regular)) -> UIFont {
        return UIFont(name: "\(fontName) Medium", size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size), weight: .medium)
    }
    static func semibold(size: Float = getFontSize(size: .regular)) -> UIFont {
        return UIFont(name: "\(fontName) SemiBold", size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size), weight: .semibold)
    }
    static func semiboldItalic(size: Float = getFontSize(size: .regular)) -> UIFont {
        return UIFont(name: "\(fontName) SemiBoldItalic", size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size), weight: .semibold)
    }
    
    enum AppFontSize {
        case big
        case regular
        case big1
    }
    
    static func getFontSize(size: AppFontSize) -> Float {
        switch size {
        case .big:
            return 20
        case .regular:
            return 17
        case .big1:
            return 23
        }
    }
}
