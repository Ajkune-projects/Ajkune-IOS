import UIKit
class TDAppCoordinator: TDCoordinator {
    
    // MARK: - Properties
    let window: UIWindow
    var loginCoordinator: LoginCoordinator?
    var initialScreenCoordinator: TDInitialScreenCoordinator?
    var tabCoordinator: TabBarCoordinator?
    var splashCoordinator: TDSplashCoordintaor?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        initializeSplash()
    }
    
    private func initializeLogin()
    {
        loginCoordinator = LoginCoordinator(viewModel: LoginViewModel())
        loginCoordinator?.coordinatorDelegate = self
        loginCoordinator?.start()
        Account.shared.delegate = self
        if let vc = loginCoordinator?.viewController{
            let nav = BaseNavigationController(rootViewController: vc)
            nav.navigationBar.isHidden = true
            window.rootViewController = nav
        }
    }
    func initializeInitialScreen()
    {
        initialScreenCoordinator = TDInitialScreenCoordinator(viewModel: TDInitialScreenViewModel())
        initialScreenCoordinator?.coordinatorDelegate = self
        initialScreenCoordinator?.start()
        Account.shared.delegate = self
        if let vc = initialScreenCoordinator?.viewController{
            let nav = BaseNavigationController(rootViewController: vc)
            nav.navigationBar.isHidden = true
            window.rootViewController = nav
        }
    }
    func initializeMainApp(){
        let tabBarController = MainTabBarContainer.instantiate(.tabbar)

        let nav =  UINavigationController(rootViewController: tabBarController)
        UIApplication.shared.windows.first?.rootViewController = nav
        
        tabCoordinator = TabBarCoordinator(tabBarController:tabBarController, appLayout: MainAppLayout())
        tabCoordinator?.start()
    }
    private func initializeSplash()
    {
        splashCoordinator = TDSplashCoordintaor()
        splashCoordinator?.coordinatorDelegate = self
        splashCoordinator?.start()
        Account.shared.delegate = self
        if let vc = splashCoordinator?.viewController{
            let nav = BaseNavigationController(rootViewController: vc)
            nav.navigationBar.isHidden = true
            window.rootViewController = nav
        }
    }

}

extension TDAppCoordinator: LoginCoordinatorDelegate{
    func loginSuccessful() {
        self.loginCoordinator = nil
        self.initializeMainApp()
    }
}

extension TDAppCoordinator: TDInitialScreenCoordinatorDelegate{
    func initializeLoginScreen() {
        self.initialScreenCoordinator = nil
        self.initializeLogin()
    }
    func goToHomeTab() {
        self.loginCoordinator = nil
        self.initializeMainApp()
    }


}

extension TDAppCoordinator: AccountProtocol{
    func initLogin() {
        self.initializeLogin()
    }
    func initMainScreen() {
        self.initializeMainApp()
    }
    func userLogout() {
        loginCoordinator = LoginCoordinator(viewModel: LoginViewModel())
        loginCoordinator?.coordinatorDelegate = self
        loginCoordinator?.start()
        if let vc = loginCoordinator?.viewController{
            UIApplication.shared.windows.first?.rootViewController = BaseNavigationController(rootViewController: vc)
        }
    }
}
extension TDAppCoordinator: TDSplashCoordinatorDelegate {
    func splashShownSuccessful() {
        self.splashCoordinator = nil
        self.initializeInitialScreen()
    }
    func goToMain() {
        self.splashCoordinator = nil
        self.initializeMainApp()
    }
}
