import XCTest
@testable import FringesExample

class FringesTest: XCTestCase {

    // retain AppCoordinator, as AppDelegate would
    var appCoordinator: AppCoordinator!

    var dashboard: SpecDashboardViewController!
    
    override func setUp() {
        super.setUp()

        let dashboardViewControllerFactory = SpecDashboardViewControllingFactory()
        let dashboardPresenter = DashboardPresenter(viewControllerFactory: dashboardViewControllerFactory)
        let dashboardRouter = DashboardRouter(dashboardPresenter: dashboardPresenter)
        let router = RootRouter(dashboardRouter: dashboardRouter)
        let appCoordinator = AppCoordinator(router: router)
        let window = UIWindow()
        appCoordinator.didFinishLaunching(withWindow: window)
        dashboard = dashboardViewControllerFactory.viewController
    }
}
