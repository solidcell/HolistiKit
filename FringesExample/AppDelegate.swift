import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let _window = UIWindow(frame: UIScreen.main.bounds)
        window = _window

        let dashboardNavigationControllerFactory = DashboardNavigationControllingFactory()
        let dashboardViewControllerFactory = DashboardViewControllingFactory()
        let timerViewControllerFactory = TimerViewControllerFactory()
        let dateViewControllerFactory = DateViewControllerFactory()
        let dateProvider = DateProvider()
        let timeZoneProvider = TimeZoneProvider()
        let errorLogger = ErrorLogger()
        let appCoordinator = AppCoordinator(dashboardNavigationControllerFactory: dashboardNavigationControllerFactory,
                                            dashboardViewControllerFactory: dashboardViewControllerFactory,
                                            timerViewControllerFactory: timerViewControllerFactory,
                                            dateViewControllerFactory: dateViewControllerFactory,
                                            dateProvider: dateProvider,
                                            timeZoneProvider: timeZoneProvider,
                                            errorLogger: errorLogger)
        appCoordinator.didFinishLaunching(withWindow: _window)
        
        _window.makeKeyAndVisible()
        return true
    }
}
