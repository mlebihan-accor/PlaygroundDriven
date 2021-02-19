//
//  CompositionField.swift
//  CompositionField
//
//  Created by mlebihan on 16/02/2021.
//

import Foundation
import UIKit

public class CompositionField: UIView {

  convenience init(label: String, isOnError: Bool) {
    self.init()

    // MARK: - Stack Container

    let stackContainer = UIStackView()
    stackContainer.axis = .vertical
    stackContainer.translatesAutoresizingMaskIntoConstraints = false
    stackContainer.spacing = 4

    addSubview(stackContainer)

    NSLayoutConstraint.activate(
      [
        stackContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        stackContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        stackContainer.topAnchor.constraint(equalTo: self.topAnchor),
        stackContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      ]
    )

    //  MARK: - label and textField stack view

    let titleAndInteractiveFieldStackView = UIStackView()
    titleAndInteractiveFieldStackView.translatesAutoresizingMaskIntoConstraints = false
    // get UIapplication.shared.UIContentSizeCategory to set `titleAndInteractiveFieldStackView.axis`
    titleAndInteractiveFieldStackView.axis = .horizontal
    titleAndInteractiveFieldStackView.alignment = titleAndInteractiveFieldStackView.axis == .vertical ? .leading : .fill
    titleAndInteractiveFieldStackView.backgroundColor = .clear
    titleAndInteractiveFieldStackView.spacing = titleAndInteractiveFieldStackView.axis == .vertical ? 2 : 8

    stackContainer.addArrangedSubview(titleAndInteractiveFieldStackView)

    //  MARK: - titleLabel

    let titleLabel = UILabel()
    titleLabel.numberOfLines = 2
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.text = label
    titleLabel.textColor = .textBody
    titleLabel.font = self.traitCollection.verticalSizeClass == .regular && self.traitCollection.horizontalSizeClass == .regular
      ? .preferredFont(forTextStyle: .body, compatibleWith: self.traitCollection)
      : .preferredFont(forTextStyle: .body, compatibleWith: self.traitCollection)
    titleLabel.textAlignment = .natural
    titleAndInteractiveFieldStackView.addArrangedSubview(titleLabel)
    let multiplier: CGFloat = titleAndInteractiveFieldStackView.axis == .vertical ? 1.0 : 0.3
    titleLabel.widthAnchor.constraint(equalTo: titleAndInteractiveFieldStackView.widthAnchor, multiplier: multiplier).isActive = true

    //  MARK: - interactive field

    let interactiveTextField = UITextField()
    interactiveTextField.translatesAutoresizingMaskIntoConstraints = false
    interactiveTextField.text = "Required"
    interactiveTextField.textColor = .textMuted
    interactiveTextField.font = self.traitCollection.verticalSizeClass == .regular && self.traitCollection.horizontalSizeClass == .regular
      ? .preferredFont(forTextStyle: .body, compatibleWith: self.traitCollection)
      : .preferredFont(forTextStyle: .body, compatibleWith: self.traitCollection)
    interactiveTextField.textAlignment = .natural
    titleAndInteractiveFieldStackView.addArrangedSubview(interactiveTextField)


    if isOnError {
      //  MARK: - icon and message stack view

      let iconAndMessageStackView = UIStackView()
      iconAndMessageStackView.translatesAutoresizingMaskIntoConstraints = false
      iconAndMessageStackView.axis = .horizontal
      iconAndMessageStackView.spacing = 6

      stackContainer.addArrangedSubview(iconAndMessageStackView)

      //  MARK: - message
      
      let messageLabel = UILabel()
      messageLabel.translatesAutoresizingMaskIntoConstraints = false
      messageLabel.text = "Zip code is not valid"
      messageLabel.textColor = .alertDanger
      messageLabel.font = self.traitCollection.verticalSizeClass == .regular && self.traitCollection.horizontalSizeClass == .regular
        ? .preferredFont(forTextStyle: .caption1, compatibleWith: self.traitCollection)
        : .preferredFont(forTextStyle: .caption1, compatibleWith: self.traitCollection)
      messageLabel.textAlignment = .natural

      //  MARK: - icon

      let bundle = Bundle(for: CompositionField.self)
      let icon = UIImage(named: "Warn", in: bundle, compatibleWith: nil)
      let iconImageView = UIImageView()
      iconImageView.translatesAutoresizingMaskIntoConstraints = false
      iconImageView.image = icon
      iconImageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
      iconImageView.setContentHuggingPriority(.defaultLow + 1, for: .horizontal)

      iconAndMessageStackView.addArrangedSubview(iconImageView)
      iconAndMessageStackView.addArrangedSubview(messageLabel)

      iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor).isActive = true
    }
  }
}
