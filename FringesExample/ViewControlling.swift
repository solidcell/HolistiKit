import UIKit

protocol ViewControlling {
    
    var asUIViewController: UIViewController { get }
    func present(viewController: ViewControlling)
    func push(viewController: ViewControlling, animated: Bool)
    func viewDidLoad()
    var navigationControlling: NavigationControlling? { get }
}

