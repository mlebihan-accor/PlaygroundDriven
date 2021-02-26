import UIKit
import PlaygroundSupport
import Form

let vc = FormTableViewController(nibName: "FormTableViewController", bundle: Bundle(for: FormTableViewController.self))

// set rendered view
let container = playgroundHelper(child: vc,
                                 device: .iphone12,
                                 orientation: .portrait,
                                 contentSizeCategory: .large)

container.view.frame.size

// render view
PlaygroundPage.current.liveView = container
