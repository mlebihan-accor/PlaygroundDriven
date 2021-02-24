import UIKit
import PlaygroundSupport
import CompositionField

let bundle = Bundle(for: CompositionFieldViewController.self)
let storyboard = UIStoryboard.init(name: "Main", bundle: bundle)

let compositionFieldViewController = storyboard.instantiateInitialViewController() as! CompositionFieldViewController
// set CompositionField stack view axis, ie aligned or on top of each other
compositionFieldViewController.labelAndTextFieldAxis = .horizontal

// set rendered view
let container = playgroundHelper(child: compositionFieldViewController,
                                 device: .iphone12,
                                 orientation: .portrait,
                                 contentSizeCategory: .large)

container.view.frame.size

// render view
PlaygroundPage.current.liveView = container
