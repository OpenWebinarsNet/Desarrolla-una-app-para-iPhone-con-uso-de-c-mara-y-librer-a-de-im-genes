//
//  Tools.swift
//  Projecto-2
//
//  Created by Fredy asencios on 23/03/22.
//

import Foundation
import UIKit

extension UIView{
    func roudedView(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.topRight , .bottomRight],
            cornerRadii: CGSize(width: 30, height: 30))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    func roudedButton(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.topLeft , .bottomLeft],
            cornerRadii: CGSize(width: 20, height: 20))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    func roundedImageView(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.topLeft , .bottomLeft, .topRight, .bottomRight],
            cornerRadii: CGSize(width: 20, height: 20))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}
extension DateFormatter {
   static let ddMMyyyy: DateFormatter = {
      let formatter = DateFormatter()
      formatter.timeZone = TimeZone(abbreviation: "UTC") //TimeZone.current
      formatter.dateFormat = "dd/MM/yyyy"
      return formatter
   }()
}


extension Date {
   func formatToString(using formatter: DateFormatter) -> String {
      return formatter.string(from: self)
   }
}
