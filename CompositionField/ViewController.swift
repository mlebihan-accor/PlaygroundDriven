//
//  ViewController.swift
//  CompositionField
//
//  Created by mlebihan on 12/02/2021.
//

import UIKit

public class ViewController: UIViewController {
  
  @IBOutlet weak var mainStackView: UIStackView!
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    // MARK: - set up main stack view
    self.mainStackView.axis = .vertical
    self.mainStackView.translatesAutoresizingMaskIntoConstraints = false
    self.mainStackView.spacing = 24
    self.mainStackView.layoutMargins = self.traitCollection.horizontalSizeClass == .regular
      ? .init(top: 36, left: 36, bottom: 36, right: 36)
      : .init(top: 16, left: 16, bottom: 16, right: 16)
    self.mainStackView.isLayoutMarginsRelativeArrangement = true
    
    //  MARK: - label and textField stack view
    let titleAndInteractiveFieldStackView = UIStackView()
    titleAndInteractiveFieldStackView.translatesAutoresizingMaskIntoConstraints = false
    titleAndInteractiveFieldStackView.axis = .horizontal // change axis with available space
    titleAndInteractiveFieldStackView.distribution = .fillProportionally
    titleAndInteractiveFieldStackView.backgroundColor = .clear
    
    mainStackView.addArrangedSubview(titleAndInteractiveFieldStackView)
    
    //  MARK: - titleLabel
    
    let titleLabel = UILabel()
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.text = "Code Postal"
    titleLabel.textColor = .textBody
    titleLabel.font = self.traitCollection.verticalSizeClass == .regular && self.traitCollection.horizontalSizeClass == .regular
      ? .preferredFont(forTextStyle: .footnote, compatibleWith: self.traitCollection)
      : .preferredFont(forTextStyle: .footnote, compatibleWith: self.traitCollection)
    titleLabel.textAlignment = .natural
    titleAndInteractiveFieldStackView.addArrangedSubview(titleLabel)
    
    //  MARK: - interactive field
    
    let interactiveTextField = UITextField()
    interactiveTextField.translatesAutoresizingMaskIntoConstraints = false
    interactiveTextField.text = "Required"
    interactiveTextField.textColor = .textMuted
    interactiveTextField.font = self.traitCollection.verticalSizeClass == .regular && self.traitCollection.horizontalSizeClass == .regular
      ? .preferredFont(forTextStyle: .footnote, compatibleWith: self.traitCollection)
      : .preferredFont(forTextStyle: .footnote, compatibleWith: self.traitCollection)
    interactiveTextField.textAlignment = .natural
    titleAndInteractiveFieldStackView.addArrangedSubview(interactiveTextField)
    
    //  MARK: - icon and message stack view
    
    let iconAndMessageStackView = UIStackView()
    iconAndMessageStackView.translatesAutoresizingMaskIntoConstraints = false
    iconAndMessageStackView.axis = .horizontal
    iconAndMessageStackView.distribution = .fillProportionally
    mainStackView.addArrangedSubview(iconAndMessageStackView)
    
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
    
    let icon = UIImage(named: "Warn")
    let iconImageView = UIImageView()
    iconImageView.translatesAutoresizingMaskIntoConstraints = false
    iconImageView.image = icon
    iconImageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
    iconImageView.setContentHuggingPriority(.defaultLow + 1, for: .horizontal)
    iconImageView.setContentCompressionResistancePriority(.defaultLow + 1, for: .horizontal)
    
    iconAndMessageStackView.addArrangedSubview(iconImageView)
    iconAndMessageStackView.addArrangedSubview(messageLabel)
    
    NSLayoutConstraint.activate(
      [iconImageView.centerYAnchor.constraint(equalTo: messageLabel.centerYAnchor),
       iconImageView.heightAnchor.constraint(equalTo: messageLabel.heightAnchor),
       iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor)
      ]
    )
  }
}
