//
//  FormTableViewCell.swift
//  Form
//
//  Created by mlebihan on 26/02/2021.
//

import UIKit
import Foundation

public class FormTableViewCell: UITableViewCell {

  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var label: UILabel!

  public override func awakeFromNib() {
    super.awakeFromNib()

    contentView.backgroundColor = .clear
    containerView.backgroundColor = .yellow
  }

  func set(text: String) {
    label.text = text
  }

  func setTopRadius(_ radius: CGFloat) {
    containerView.layer.cornerRadius = radius
    containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
  }

  func setBottomRadius(_ radius: CGFloat) {
    containerView.layer.cornerRadius = radius
    containerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
  }

  func removeRadius() {
    containerView.layer.cornerRadius = 0
  }

  func setBorder() {
    containerView.addTopBorder(with: .red, andWidth: 1)
    containerView.layer.addCorner(.topLeft, thickness: 1, color: UIColor.red.cgColor)
    
  }
}

extension UIView {
  func addTopBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
    let border = UIView()
    border.backgroundColor = color
    border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
    border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: borderWidth)
    addSubview(border)
  }
  func addBottomBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
    let border = UIView()
    border.backgroundColor = color
    border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
    border.frame = CGRect(x: 0, y: frame.size.height - borderWidth, width: frame.size.width, height: borderWidth)
    addSubview(border)
  }
  func addLeftBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
    let border = UIView()
    border.backgroundColor = color
    border.frame = CGRect(x: 0, y: 0, width: borderWidth, height: frame.size.height)
    border.autoresizingMask = [.flexibleHeight, .flexibleRightMargin]
    addSubview(border)
  }
  func addRightBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
    let border = UIView()
    border.backgroundColor = color
    border.autoresizingMask = [.flexibleHeight, .flexibleLeftMargin]
    border.frame = CGRect(x: frame.size.width - borderWidth, y: 0, width: borderWidth, height: frame.size.height)
    addSubview(border)
  }
}

extension CALayer {
  enum Corner {
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
  }

  func addCorner(_ corner: Corner, thickness: CGFloat, color: CGColor) {
    // Set default to top left
    let width = frame.size.width; let height = frame.size.height
    var x = cornerRadius
    var y = cornerRadius
    var startAngle: CGFloat = .pi; var endAngle: CGFloat = .pi*3/2

    switch corner {
    case .bottomLeft:
      y = height - cornerRadius
      startAngle = .pi/2; endAngle = .pi

    case .bottomRight:
      x = width - cornerRadius
      y = height - cornerRadius
      startAngle = 0; endAngle = .pi/2

    case .topRight:
      x = width - cornerRadius
      startAngle = .pi*3/2; endAngle = 0

    default: break
    }

    let cornerPath = UIBezierPath(arcCenter: CGPoint(x: x, y: y),
                                  radius: cornerRadius - thickness,
                                  startAngle: startAngle,
                                  endAngle: endAngle,
                                  clockwise: true)

    let cornerShape = CAShapeLayer()
    cornerShape.path = cornerPath.cgPath
    cornerShape.lineWidth = thickness
    cornerShape.strokeColor = color
    cornerShape.fillColor = nil
    addSublayer(cornerShape)
  }
}
