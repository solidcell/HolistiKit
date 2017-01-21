import UIKit
import UIKitFringes
@testable import FringesExample

class SpecWindow: Windowing {

    private(set) var rootViewController: SpecViewController?
    
    func set(rootViewController: ViewControlling) {
        self.rootViewController = rootViewController.asSpecViewController
        self.rootViewController!.viewLoadAndAppear()
    }

    var asUIWindow: UIWindow {
        fatalError("This should never be called in tests")
    }

    var topViewController: SpecViewController {
        return rootViewController!.topViewController
    }

    var viewControllerStack: [SpecViewController] {
        return rootViewController!.viewControllerStack
    }
}
    
