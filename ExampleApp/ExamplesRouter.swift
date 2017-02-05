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

    func pushExamples(on presenter: PushingPresenter) {
        let examplesPresenter = examplesPresenterFactory.create(withRouter: self)
        examplesPresenter.push(on: presenter)
    }
    
    func pushDate(on presenter: PushingPresenter) {
        let datePresenter = datePresenterFactory.create(withRouter: self)
        datePresenter.push(on: presenter)
    }
    
    func pushTimer(on presenter: PushingPresenter) {
        let timerPresenter = timerPresenterFactory.create(withRouter: self)
        timerPresenter.push(on: presenter)
    }
    
    func pushURLSession(on presenter: PushingPresenter) {
        let urlSessionPresenter = urlSessionPresenterFactory.create(withRouter: self)
        urlSessionPresenter.push(on: presenter)
    }
    
    func pushUIViewController(on presenter: PushingPresenter) {
        let uiViewControllerPresenter = uiViewControllerPresenterFactory.create(withRouter: self)
        uiViewControllerPresenter.push(on: presenter)
    }
    
    func presentUIViewController(on presenter: PresentingPresenter) {
        let uiViewControllerPresenter = uiViewControllerPresenterFactory.create(withRouter: self)
        uiViewControllerPresenter.present(on: presenter)
    }
}
