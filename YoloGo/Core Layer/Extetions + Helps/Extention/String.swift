//
//  String.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 16.12.2021.
//

import Foundation
import UIKit
import CommonCrypto

extension String {
    
    public func replacingFirstOccurrence(of string: String, with replacement: String) -> String {
        guard let range = self.range(of: string) else {
            return self
        }
        return replacingCharacters(in: range, with: replacement)
    }
    
    func convertToPhoneNumTwo() -> String {
        return self.replacingOccurrences(of: "(.{1})(.{3})(.{4})(.{3})", with: "+$1 ($2) $3-$4", options: .regularExpression, range: nil)
    }
    
    public func trimTrailingWhitespace() -> String {
        if let trailingWs = self.range(of: "\\s+$", options: .regularExpression) {
            return self.replacingCharacters(in: trailingWs, with: "")
        } else {
            return self
        }
    }
    
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }
    
    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
    
    
    func toDate(format: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru")
        dateFormatter.dateFormat = format
        
        let date = dateFormatter.date(from: self)
        return date
    }
    
    func contains(find: String) -> Bool {
        return self.range(of: find) != nil
    }
    func containsIgnoringCase(find: String) -> Bool{
        return self.range(of: find, options: .caseInsensitive) != nil
    }
    
    func index(at offset: Int) -> Index? {
        precondition(offset >= 0, "offset can't be negative")
        return index(startIndex, offsetBy: offset, limitedBy: index(before: endIndex))
    }
    func character(at offset: Int) -> Character? {
        precondition(offset >= 0, "offset can't be negative")
        guard let index = index(at: offset) else { return nil }
        return self[index]
    }
    subscript(offset: Int) -> String {
        precondition(offset >= 0, "offset can't be negative")
        guard let character = character(at: offset) else { return "" }
        return String(character)
    }
    subscript(range: Range<Int>) -> Substring {
        precondition(range.lowerBound >= 0, "range lowerBound can't be negative")
        guard let startIndex = index(at: range.lowerBound) else { return "" }
        return self[startIndex..<(index(startIndex, offsetBy: range.count, limitedBy: endIndex) ?? endIndex)]
    }
    subscript(range: ClosedRange<Int>) -> Substring {
        precondition(range.lowerBound >= 0, "range lowerBound can't be negative")
        guard let startIndex = index(at: range.lowerBound) else { return "" }
        return self[startIndex..<(index(startIndex, offsetBy: range.count, limitedBy: endIndex) ?? endIndex)]
    }
    subscript(partialRange: PartialRangeFrom<Int>) -> Substring {
        return self[partialRange.lowerBound..<endIndex.utf16Offset(in: self)]
    }
    subscript(partialRange: PartialRangeUpTo<Int>) -> Substring {
        return self[startIndex.utf16Offset(in: self)..<partialRange.upperBound]
    }
    subscript(partialRange: PartialRangeThrough<Int>) -> Substring {
        return self[startIndex.utf16Offset(in: self)...partialRange.upperBound]
    }
    
}

extension String {
    
    static let serverDateTimeFormat = "yyyy-MM-dd HH:mm:ss"
    
}

extension String {
    
    func valueOf(_ queryParamaterName: String) -> String? {
        guard let url = URLComponents(string: self) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParamaterName })?.value
    }
    
}

extension String {
    
    mutating func removeLastCharIfPossible() {
        guard !isEmpty else {
            return
        }
        removeLast()
    }
    
}

extension String {
    
    func qrCode(withScale scale: (x: CGFloat, y: CGFloat)) -> UIImage? {
        let data = self.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: scale.x, y: scale.y)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }

    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

extension String {
  func toDate(withFormat format: String = "yyyy-MM-dd") -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    guard let date = dateFormatter.date(from: self) else {
      preconditionFailure("Take a look to your format")
    }
    return date
  }
}
extension String {
    func substring(_ r: Range<Int>) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
        let toIndex = self.index(self.startIndex, offsetBy: r.upperBound)
        let indexRange = Range<String.Index>(uncheckedBounds: (lower: fromIndex, upper: toIndex))
        return String(self[indexRange])
    }
}
extension Dictionary {
    mutating func merge(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}


extension String {
    var localized: String {
        get {
            return NSLocalizedString(self, comment: "")
        }
    }
    
    var textWithoutPhoneMask: String {
        if self.count == 0 {
            return self
        }
        
        var result = self
        
        result = result.replacingOccurrences(of: " ", with: "")
        result = result.replacingOccurrences(of: "(", with: "")
        result = result.replacingOccurrences(of: ")", with: "")
        result = result.replacingOccurrences(of: "-", with: "")
        
        return result
    }
    
    var onlyDigits: String {
        return self
            .components(separatedBy:CharacterSet.decimalDigits.inverted)
            .joined(separator: "")
    }
    
    
    func attributed(font: UIFont = Fonts.regular(), color: UIColor = .black, line: Bool = false, link: String? = nil) -> NSAttributedString {
        var attr: [NSAttributedString.Key:Any] = [NSAttributedString.Key.font: font,
                                                  NSAttributedString.Key.foregroundColor: color]
        if line {
            attr[NSAttributedString.Key.underlineStyle] = NSUnderlineStyle.single.rawValue
        }
        if let link = link {
            attr[NSAttributedString.Key.link] = link
        }
        return NSAttributedString(string: self, attributes: attr)
    }
}

// Validations
extension String {
    var isValidPassword: Bool {
        return !self.isEmpty
    }
    
    var isValidEmail: Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var isValidCode: Bool
    {
        return onlyDigits.count >= 4
    }
    var isValidPhone: Bool
    {
        return textWithoutPhoneMask.count == 12
    }
}


