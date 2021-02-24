


let tabBarController = UITabBarController()
let vc = UIViewController()
vc.tab
tabBarController.setViewControllers([UIViewController()], animated: true)
tabBarController.tabBar.setItems([UITabBarItem(title: "Toto", image: nil, tag: 0)], animated: true)
return tabBarController



// set rendered view
let container = playgroundHelper(child: compositionFieldViewController,
                                 device: .iphone12,
                                 orientation: .portrait,
                                 contentSizeCategory: .large)

container.view.frame.size

// render view
PlaygroundPage.current.liveView = container
