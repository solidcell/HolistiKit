@testable import FringesExample

class SpecAppDelegate {
    
    private(set) var window: SpecWindow!

    private(set) weak var dateProvider: SpecDateProvider!

    func applicationDidLaunch() {
        window = SpecWindow()
        
        let dashboardNavigationControllerFactory = SpecDashboardNavigationControllingFactory()
        let dashboardViewControllerFactory = SpecDashboardViewControllingFactory()
        let settingsViewControllerFactory = SpecSettingsViewControllerFactory()
        let _dateProvider = SpecDateProvider()
        dateProvider = _dateProvider
        let timeZoneProvider = SpecTimeZoneProvider()
        let appCoordinator = AppCoordinator(dashboardNavigationControllerFactory: dashboardNavigationControllerFactory,
                                            dashboardViewControllerFactory: dashboardViewControllerFactory,
                                            settingsViewControllerFactory: settingsViewControllerFactory,
                                            dateProvider: dateProvider,
                                            timeZoneProvider: timeZoneProvider)
        
        appCoordinator.didFinishLaunching(withWindow: window)
    }
}
