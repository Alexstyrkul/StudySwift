import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var container: Container!
    private var appCoordinator: AppCoordinator!
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        container = Container()
        
        if ProcessInfo.processInfo.arguments.contains("UITests") {
            let domain = Bundle.main.bundleIdentifier!
            UserDefaults.standard.removePersistentDomain(forName: domain)
            UserDefaults.standard.synchronize()
            print("🧹 App launched in UITest mode — UserDefaults cleared")
        }
        
        window = UIWindow()
        appCoordinator = AppCoordinator(window: window!, container: container)
        appCoordinator.start()
        window?.makeKeyAndVisible()
        
        return true
    }
}
