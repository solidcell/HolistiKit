import UIKit

class NetworkRequestPresenter {

    private let viewControllerFactory: NetworkRequestViewControllerFactoryProtocol
    fileprivate weak var viewController: NetworkRequestViewControlling!
    fileprivate let interactor: NetworkRequestInteractor

    init(viewControllerFactory: NetworkRequestViewControllerFactoryProtocol,
         interactor: NetworkRequestInteractor) {
        self.viewControllerFactory = viewControllerFactory
        self.interactor = interactor
    }
    
    func push(on presenter: PushablePresenter) {
        let _viewController = viewControllerFactory.create(withPresenter: self)
        viewController = _viewController
        presenter.push(viewController: _viewController)
    }
}

extension NetworkRequestPresenter: NetworkRequestPresenting {

    func viewDidLoad() {
        viewController.set(title: "Network Request")
        interactor.delegate = self
    }
}

extension NetworkRequestPresenter: NetworkRequestInteractorDelegate {

    func received(data: [String : Any]) {
        viewController.set(data: data.keys.joined())
    }
}

protocol NetworkRequestPresenting {

    func viewDidLoad()
}
