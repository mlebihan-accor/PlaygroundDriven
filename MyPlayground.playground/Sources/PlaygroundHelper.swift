import Foundation
import UIKit

public enum Device {
  case iphoneSE_2
  case iphone12_mini
  case iphone12
  case iphone12_pro_max
  case iPad_air4
}

public enum Orientation {
  case portrait
  case landscape
}

/**
 Creates a controller that represents a specific device, orientation with specific traits.

 - parameter device:           The device the controller should represent.
 - parameter orientation:      The orientation of the device.
 - parameter child:            An optional controller to put inside the parent controller. If omitted
 a blank controller will be used.
 - parameter additionalTraits: An optional set of traits that will also be applied. Traits in this collection
 will trump any traits derived from the device/orientation comboe specified.

 - returns: Two controllers: a root controller that can be set to the playground's live view, and a content
 controller which should have UI elements added to it
 */
public func playgroundHelper(child: UIViewController,
                             device: Device = .iphone12,
                             orientation: Orientation = .portrait,
                             contentSizeCategory: UIContentSizeCategory = .large,
                             additionalTraits: UITraitCollection = .init())
-> UIViewController {
  
  let parent = UIViewController()
  parent.addChild(child)
  
  let traits: UITraitCollection
  let parentSize: CGSize
  switch (device, orientation) {
  case (.iphoneSE_2, .portrait):
    parentSize = .init(width: 375, height: 667)
    traits = .init(traitsFrom: [
      .init(horizontalSizeClass: .compact),
      .init(verticalSizeClass: .regular),
      .init(userInterfaceIdiom: .phone)
    ])
  case (.iphoneSE_2, .landscape):
    parentSize = .init(width: 667, height: 375)
    traits = .init(traitsFrom: [
      .init(horizontalSizeClass: .compact),
      .init(verticalSizeClass: .compact),
      .init(userInterfaceIdiom: .phone)
    ])
  case (.iphone12_mini, .portrait):
    parentSize = .init(width: 360, height: 780)
    traits = .init(traitsFrom: [
      .init(horizontalSizeClass: .compact),
      .init(verticalSizeClass: .regular),
      .init(userInterfaceIdiom: .pad)
    ])
  case (.iphone12_mini, .landscape):
    parentSize = .init(width: 780, height: 360)
    traits = .init(traitsFrom: [
      .init(horizontalSizeClass: .compact),
      .init(verticalSizeClass: .compact),
      .init(userInterfaceIdiom: .pad)
    ])
  case (.iphone12, .portrait):
    parentSize = .init(width: 390, height: 844)
    traits = .init(traitsFrom: [
      .init(horizontalSizeClass: .compact),
      .init(verticalSizeClass: .regular),
      .init(userInterfaceIdiom: .pad)
    ])
  case (.iphone12, .landscape):
    parentSize = .init(width: 844, height: 390)
    traits = .init(traitsFrom: [
      .init(horizontalSizeClass: .compact),
      .init(verticalSizeClass: .compact),
      .init(userInterfaceIdiom: .pad)
    ])
  case (.iphone12_pro_max, .portrait):
    parentSize = .init(width: 428, height: 926)
    traits = .init(traitsFrom: [
      .init(horizontalSizeClass: .compact),
      .init(verticalSizeClass: .regular),
      .init(userInterfaceIdiom: .pad)
    ])
  case (.iphone12_pro_max, .landscape):
    parentSize = .init(width: 926, height: 428)
    traits = .init(traitsFrom: [
      .init(horizontalSizeClass: .regular),
      .init(verticalSizeClass: .compact),
      .init(userInterfaceIdiom: .pad)
    ])
  case (.iPad_air4, .portrait):
    parentSize = .init(width: 820, height: 1180)
    traits = .init(traitsFrom: [
      .init(horizontalSizeClass: .regular),
      .init(verticalSizeClass: .regular),
      .init(userInterfaceIdiom: .pad)
    ])
  case (.iPad_air4, .landscape):
    parentSize = .init(width: 1180, height: 820)
    traits = .init(traitsFrom: [
      .init(horizontalSizeClass: .regular),
      .init(verticalSizeClass: .regular),
      .init(userInterfaceIdiom: .pad)
    ])
  }

  let allTraits = UITraitCollection(traitsFrom: [
    traits,
    additionalTraits,
    .init(preferredContentSizeCategory: contentSizeCategory)
  ])
  parent.setOverrideTraitCollection(allTraits, forChild: child)

  child.view.translatesAutoresizingMaskIntoConstraints = false
  parent.view.addSubview(child.view)

  parent.view.frame.size = parentSize
  parent.preferredContentSize = parentSize
  parent.view.backgroundColor = .lightGray
  child.view.backgroundColor = .white

  parent.view.translatesAutoresizingMaskIntoConstraints = false
  NSLayoutConstraint.activate([
    child.view.leadingAnchor.constraint(equalTo: parent.view.leadingAnchor),
    child.view.trailingAnchor.constraint(equalTo: parent.view.trailingAnchor),
    child.view.bottomAnchor.constraint(lessThanOrEqualTo: parent.view.bottomAnchor),
    child.view.topAnchor.constraint(equalTo: parent.view.topAnchor)
  ])

  return parent
}
