//
//  ViewController.swift
//  CompositionField
//
//  Created by mlebihan on 12/02/2021.
//

import UIKit

public class CompositionFieldViewController: UIViewController {
  
  @IBOutlet weak var mainStackView: UIStackView!

  public var labelAndTextFieldAxis: NSLayoutConstraint.Axis = .horizontal
  
  public override func viewDidLoad() {
    super.viewDidLoad()

    // screen size
    
    // MARK: - set up main stack view
    self.mainStackView.axis = .vertical
    self.mainStackView.translatesAutoresizingMaskIntoConstraints = false
    self.mainStackView.spacing = 16
    self.mainStackView.layoutMargins = self.traitCollection.horizontalSizeClass == .regular
      ? .init(top: 36, left: 36, bottom: 36, right: 36)
      : .init(top: 16, left: 16, bottom: 16, right: 16)
    self.mainStackView.isLayoutMarginsRelativeArrangement = true

    self.mainStackView.addArrangedSubview(CompositionFieldView(label: "Code Postal",
                                                               isOnError: false,
                                                               titleAndInteractiveFieldStackViewAxis: labelAndTextFieldAxis))
    self.mainStackView.addArrangedSubview(CompositionFieldView(label: "Nom",
                                                               isOnError: true,
                                                               titleAndInteractiveFieldStackViewAxis: labelAndTextFieldAxis))
    self.mainStackView.addArrangedSubview(CompositionFieldView(label: "Prenom",
                                                               isOnError: true,
                                                               titleAndInteractiveFieldStackViewAxis: labelAndTextFieldAxis))
  }
}
