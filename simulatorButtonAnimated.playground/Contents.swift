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
let mainScene = MainScene(vc: vc)

////////Write your prototype code there

var fullDimensionRec = CGRectMake(1, vc.view.frame.size.height/2 - 30, vc.view.frame.size.width - 2, 60);
var minDimensionRec  = CGRectMake(30, vc.view.frame.size.height/2 - 22, vc.view.frame.size.width - 60, 44);
var mediumDimensionRec  = CGRectMake(20, vc.view.frame.size.height/2 - 25, vc.view.frame.size.width - 40, 50);

//button response
class ButtonHandler: NSObject {
    let scene: MainScene
    init(scene: MainScene) {
        self.scene = scene
        super.init()
    }
    func buttonPressed(sender:UIButton) {
        sender.tag = 1;
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            sender.backgroundColor = UIColor.cyanColor()
            sender.frame = minDimensionRec
            } , completion: { (finish) -> Void in
                if sender.tag == 1 {
                    UIView.animateWithDuration(0.05, animations: { () -> Void in
                        sender.frame = mediumDimensionRec
                    })
                }
        })
    }
    
    func buttonReleased(sender:UIButton) {
        sender.tag = 0;
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            sender.backgroundColor = UIColor.lightGrayColor()
             sender.frame = fullDimensionRec
        })
    }
}

//view
let handeler = ButtonHandler(scene: mainScene)

var backView = UIView(frame: CGRectMake(0,0,vc.view.frame.size.width,62))
backView.backgroundColor = UIColor.whiteColor();
backView.center = CGPointMake(vc.view.center.x, vc.view.center.y)
vc.view.addSubview(backView)

var touchButton = UIButton(frame: CGRectMake(0, 0, vc.view.frame.size.width-2, 60))
touchButton.backgroundColor = UIColor.lightGrayColor()
touchButton.addTarget(handeler, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchDown)
touchButton.addTarget(handeler, action: "buttonReleased:", forControlEvents: UIControlEvents.TouchUpInside)
touchButton.center = CGPointMake(vc.view.center.x, vc.view.center.y)
vc.view.addSubview(touchButton)

////////End of your prototype

//Run playground
let window = UIWindow(frame: UIScreen.mainScreen().bounds)
window.rootViewController = mainScene.nc
window.makeKeyAndVisible()
CFRunLoopRun()
