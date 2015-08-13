import UIKit

//setup

struct MainScene {
    let vc: UIViewController
    let nc: UINavigationController
    init(vc: UIViewController) {
        self.vc = vc
        self.nc = UINavigationController(rootViewController: vc)
    }
}

extension UIViewController {
    class func viewController(color: UIColor) -> UIViewController {
        let vc = UIViewController()
        vc.view = UIView(frame: UIScreen.mainScreen().bounds)
        vc.view.backgroundColor = color
        return vc
    }
}

let vc = UIViewController.viewController(UIColor.lightGrayColor())
vc.title = "myPlayground"

////////Write your prototype code there





////////End of your prototype

let mainScene = MainScene(vc: vc)

//Run playground
let window = UIWindow(frame: UIScreen.mainScreen().bounds)
window.rootViewController = mainScene.nc
window.makeKeyAndVisible()
CFRunLoopRun()