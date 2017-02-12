import UIKitFringes

class ExamplesRouter {

    private let examplesPresenterFactory: ExamplesPresenterFactory
    private let datePresenterFactory: DatePresenterFactory
    private let timerPresenterFactory: TimerPresenterFactory
    private let urlSessionPresenterFactory: URLSessionPresenterFactory
    private let examplesNavigationPresenterFactory: ExamplesNavigationPresenterFactory
    private let uiViewControllerPresenterFactory: UIViewControllerPresenterFactory

    init(examplesNavigationPresenterFactory: ExamplesNavigationPresenterFactory,
         examplesPresenterFactory: ExamplesPresenterFactory,
         timerPresenterFactory: TimerPresenterFactory,
         urlSessionPresenterFactory: URLSessionPresenterFactory,
         datePresenterFactory: DatePresenterFactory,
         uiViewControllerPresenterFactory: UIViewControllerPresenterFactory) {
        self.examplesNavigationPresenterFactory = examplesNavigationPresenterFactory
        self.examplesPresenterFactory = examplesPresenterFactory
        self.timerPresenterFactory = timerPresenterFactory
        self.urlSessionPresenterFactory = urlSessionPresenterFactory
        self.datePresenterFactory = datePresenterFactory
        self.uiViewControllerPresenterFactory = uiViewControllerPresenterFactory
    }
    
    func present(onWindow window: Windowing) {
        let examplesNavigationPresenter = examplesNavigationPresenterFactory.create(withRouter: self)
        examplesNavigationPresenter.present(onWindow: window)
    }

    func pushTimer(on pushingPresenter: ExamplesPresenter) {
        let pushedViewController = timerPresenterFactory.create(withRouter: self)
        pushingPresenter.pushVC(pushedViewController)
    }

    func pushURLSession(on pushingPresenter: ExamplesPresenter) {
        let pushedViewController = urlSessionPresenterFactory.create(withRouter: self)
        pushingPresenter.pushVC(pushedViewController)
    }
    
    func pushUIViewController(on pushingPresenter: ExamplesPresenter) {
        let pushedViewController = uiViewControllerPresenterFactory.create(withRouter: self)
        pushingPresenter.pushVC(pushedViewController)
    }

    func pushDate(on pushingPresenter: ExamplesPresenter) {
        let pushedViewController = datePresenterFactory.create(withRouter: self)
        pushingPresenter.pushVC(pushedViewController)
    }

    func pushExamples(on pushingPresenter: ExamplesNavigationPresenter) {
        let pushedViewController = examplesPresenterFactory.create(withRouter: self)
        pushingPresenter.pushVC(pushedViewController)
    }
    
    func presentUIViewController(on presenter: PresentingPresenter) {
        let uiViewControllerPresenter = uiViewControllerPresenterFactory.create(withRouter: self)
        presenter.present(viewController: uiViewControllerPresenter)
    }
}
