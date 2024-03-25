//
//  StringExtension.swift
//  MyTodoList
//
//  Created by 정유진 on 2024/03/25.
//

import Foundation
import UIKit
extension String {
    // 취소선 추가 메서드
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
    // 취소선 제거 메서드
    func removeStrikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.removeAttribute(NSAttributedString.Key.strikethroughStyle, range: NSRange(location: 0, length: attributeString.length))
        return attributeString
    }
}
