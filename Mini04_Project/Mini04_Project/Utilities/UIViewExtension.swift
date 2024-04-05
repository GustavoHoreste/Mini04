//
//  UIViewExtension.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 05/04/24.
//

import Foundation
import UIKit

extension UIView {
    func rotate(degrees: CGFloat) {
        rotate(radians: CGFloat.pi * degrees / 180.0)
    }

    func rotate(radians: CGFloat) {
        self.transform = CGAffineTransform(rotationAngle: radians)
    }
}
