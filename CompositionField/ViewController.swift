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

    // screen size
    
    // MARK: - set up main stack view
    self.mainStackView.axis = .vertical
    self.mainStackView.translatesAutoresizingMaskIntoConstraints = false
    self.mainStackView.spacing = 16
    self.mainStackView.layoutMargins = self.traitCollection.horizontalSizeClass == .regular
      ? .init(top: 36, left: 36, bottom: 36, right: 36)
      : .init(top: 16, left: 16, bottom: 16, right: 16)
    self.mainStackView.isLayoutMarginsRelativeArrangement = true

    self.mainStackView.addArrangedSubview(CompositionField(label: "Code Postal", isOnError: false))
    self.mainStackView.addArrangedSubview(CompositionField(label: "Nom", isOnError: true))
    self.mainStackView.addArrangedSubview(CompositionField(label: "Prenom", isOnError: true))
  }
}
