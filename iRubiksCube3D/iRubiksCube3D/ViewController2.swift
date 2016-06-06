///
/// ETML
/// Auteur : Jérémy Perriraz
/// Date : 30.05.2016
/// Description : Fichier qui contrôle toute la vue du Rubik's Cube,
///               c'est ici que tout ce qui concerne cette vue sera fait.
///

import UIKit
import SceneKit

///
/// Nom : ViewController2
/// Description : C'est la classe où il y aura tout le code de cette vue
///
class ViewController2 : UIViewController {
    
    @IBOutlet weak var scnRubiksCube: SCNView!

    let CAMERA_NODE = SCNNode()
    let SCENE = SCNScene()
    let ARRAYS_MOVEMENTS = [
        "RightPositive",
        "LeftNegative",
        "RightNegative",
        "LeftPositive",
        "MiddleUp",
        "MiddleDown",
        "UpNegative",
        "UpPositive",
        "MiddleRight",
        "MiddleLeft",
        "DownPositive",
        "DownNegative",
        "FrontPositive",
        "FrontNegative",
        "MiddlePositive",
        "MiddleNegative"
    ]
    let GEOMETRY_NODE : SCNNode = SCNNode()
    let BTN_RIGHT_NEGATIVE   = UIButton(type: UIButtonType.System) as UIButton
    let BTN_RIGHT_POSITIVE   = UIButton(type: UIButtonType.System) as UIButton
    let BTN_LEFT_POSITIVE   = UIButton(type: UIButtonType.System) as UIButton
    let BTN_LEFT_NEGATIVE   = UIButton(type: UIButtonType.System) as UIButton
    let BTN_MIDDLEUP   = UIButton(type: UIButtonType.System) as UIButton
    let BTN_MIDDLE_DOWN   = UIButton(type: UIButtonType.System) as UIButton
    let BTN_UP_NEGATIVE   = UIButton(type: UIButtonType.System) as UIButton
    let BTN_UP_POSITIVE   = UIButton(type: UIButtonType.System) as UIButton
    let BTN_DOWN_POSITIVE   = UIButton(type: UIButtonType.System) as UIButton
    let BTN_DOWN_NEGATIVE   = UIButton(type: UIButtonType.System) as UIButton
    let BTN_MIDDLE_RIGHT   = UIButton(type: UIButtonType.System) as UIButton
    let BTN_MIDDLE_LEFT   = UIButton(type: UIButtonType.System) as UIButton
    let BTN_FRONT_POSITIVE   = UIButton(type: UIButtonType.System) as UIButton
    let BTN_FRONT_NEGATIVE   = UIButton(type: UIButtonType.System) as UIButton
    let BTN_FRONT_RIGHT   = UIButton(type: UIButtonType.System) as UIButton
    let BTN_FRONT_LEFT   = UIButton(type: UIButtonType.System) as UIButton
    let BTN_FRONT_UP   = UIButton(type: UIButtonType.System) as UIButton
    let BTN_FRONT_DOWN   = UIButton(type: UIButtonType.System) as UIButton
    let BTN_FRONT_MIDDLE_NEGATIVE   = UIButton(type: UIButtonType.System) as UIButton
    let BTN_FRONT_MIDDLE_POSITIVE = UIButton(type: UIButtonType.System) as UIButton
    let BTN_BACK_TO_MENU = UIButton(type: UIButtonType.System) as UIButton
    
    var currentAngle: Float = 0.0
    var cubelets : [SCNNode] = []
    
    ///
    /// Nom : viewDidAppear
    /// Description : C'est la fonction qui permet de faire apparaître et d'animer les objets graphiques.
    /// Paramètre : animated : Bool
    ///
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        addCamera()
        scnRubiksCube.scene!.rootNode.addChildNode(GEOMETRY_NODE)
        
        for x in -1...1 {
            for y in -1...1 {
                for z in -1...1 {
                    let SCN_BOX = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.1)
                    
                    SCN_BOX.materials = [
                        changeMaterialWithColor("/Users/perrirazje/Desktop/TPI/iRubiksCube3D/Picture/red.png"),
                        changeMaterialWithColor("/Users/perrirazje/Desktop/TPI/iRubiksCube3D/Picture/green.png"),
                        changeMaterialWithColor("/Users/perrirazje/Desktop/TPI/iRubiksCube3D/Picture/orange.png"),
                        changeMaterialWithColor("/Users/perrirazje/Desktop/TPI/iRubiksCube3D/Picture/blue.png"),
                        changeMaterialWithColor("/Users/perrirazje/Desktop/TPI/iRubiksCube3D/Picture/white.png"),
                        changeMaterialWithColor("/Users/perrirazje/Desktop/TPI/iRubiksCube3D/Picture/yellow.png"),
                    ]
                
                    let SCN_NODE = SCNNode(geometry: SCN_BOX)
                    
                    SCN_NODE.position = SCNVector3(x: Float(x), y: Float(y), z: Float(z))
                    
                    /////
                    //////////node.geometry?.firstMaterial!.diffuse.contents = "/Users/perrirazje/Downloads/cube.png"
                    /////
                    
                    SCENE.rootNode.addChildNode(SCN_NODE)
                    
                    cubelets += [SCN_NODE]
                }
            }
        }
        
        runAfterDelay(0.0) {
            self.mixRubiksCube()
        }
        
        runAfterDelay(1.1) {
            self.mixRubiksCube()
        }
        
        runAfterDelay(2.2) {
            self.mixRubiksCube()
        }
        
        runAfterDelay(3.3) {
            self.mixRubiksCube()
        }
        
        runAfterDelay(4.4) {
            self.mixRubiksCube()
        }
        
        runAfterDelay(5.5) {
            self.mixRubiksCube()
        }
        
        runAfterDelay(6.6) {
            self.mixRubiksCube()
        }
        
        runAfterDelay(7.7) {
            self.mixRubiksCube()
        }
        
        runAfterDelay(8.8) {
            self.mixRubiksCube()
        }
        
        runAfterDelay(9.9) {
            self.mixRubiksCube()
        }

        scnRubiksCube.scene = SCENE
        
        scnRubiksCube.allowsCameraControl = false
        
        BTN_RIGHT_NEGATIVE.frame = CGRectMake(225, 420, 25, 25)
        BTN_RIGHT_NEGATIVE.backgroundColor = UIColor.clearColor()
        BTN_RIGHT_NEGATIVE.layer.borderWidth = 1.0
        BTN_RIGHT_NEGATIVE.layer.borderColor = UIColor.blackColor().CGColor
        BTN_RIGHT_NEGATIVE.layer.cornerRadius = 5.0
        BTN_RIGHT_NEGATIVE.setTitle("⬇️", forState: UIControlState.Normal)
        BTN_RIGHT_NEGATIVE.addTarget(self, action: "activateBtnRightNegative:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(BTN_RIGHT_NEGATIVE)

        BTN_RIGHT_POSITIVE.frame = CGRectMake(225, 140, 25, 25)
        BTN_RIGHT_POSITIVE.backgroundColor = UIColor.clearColor()
        BTN_RIGHT_POSITIVE.layer.borderWidth = 1.0
        BTN_RIGHT_POSITIVE.layer.borderColor = UIColor.blackColor().CGColor
        BTN_RIGHT_POSITIVE.layer.cornerRadius = 5.0
        BTN_RIGHT_POSITIVE.setTitle("⬆️", forState: UIControlState.Normal)
        BTN_RIGHT_POSITIVE.addTarget(self, action: "activateBtnRightPositive:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(BTN_RIGHT_POSITIVE)
        
        BTN_LEFT_POSITIVE.frame = CGRectMake(60, 420, 25, 25)
        BTN_LEFT_POSITIVE.backgroundColor = UIColor.clearColor()
        BTN_LEFT_POSITIVE.layer.borderWidth = 1.0
        BTN_LEFT_POSITIVE.layer.borderColor = UIColor.blackColor().CGColor
        BTN_LEFT_POSITIVE.layer.cornerRadius = 5.0
        BTN_LEFT_POSITIVE.setTitle("⬇️", forState: UIControlState.Normal)
        BTN_LEFT_POSITIVE.addTarget(self, action: "activateBtnLeftPositive:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(BTN_LEFT_POSITIVE)
        
        BTN_LEFT_NEGATIVE.frame = CGRectMake(60, 140, 25, 25)
        BTN_LEFT_NEGATIVE.backgroundColor = UIColor.clearColor()
        BTN_LEFT_NEGATIVE.layer.borderWidth = 1.0
        BTN_LEFT_NEGATIVE.layer.borderColor = UIColor.blackColor().CGColor
        BTN_LEFT_NEGATIVE.layer.cornerRadius = 5.0
        BTN_LEFT_NEGATIVE.setTitle("⬆️", forState: UIControlState.Normal)
        BTN_LEFT_NEGATIVE.addTarget(self, action: "activateBtnLeftNegative:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(BTN_LEFT_NEGATIVE)
        
        BTN_MIDDLEUP.frame = CGRectMake(140, 140, 25, 25)
        BTN_MIDDLEUP.backgroundColor = UIColor.clearColor()
        BTN_MIDDLEUP.layer.borderWidth = 1.0
        BTN_MIDDLEUP.layer.borderColor = UIColor.blackColor().CGColor
        BTN_MIDDLEUP.layer.cornerRadius = 5.0
        BTN_MIDDLEUP.setTitle("⬆️", forState: UIControlState.Normal)
        BTN_MIDDLEUP.addTarget(self, action: "activateBtnMiddleUp:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(BTN_MIDDLEUP)
        
        BTN_MIDDLE_DOWN.frame = CGRectMake(140, 420, 25, 25)
        BTN_MIDDLE_DOWN.backgroundColor = UIColor.clearColor()
        BTN_MIDDLE_DOWN.layer.borderWidth = 1.0
        BTN_MIDDLE_DOWN.layer.borderColor = UIColor.blackColor().CGColor
        BTN_MIDDLE_DOWN.layer.cornerRadius = 5.0
        BTN_MIDDLE_DOWN.setTitle("⬇️", forState: UIControlState.Normal)
        BTN_MIDDLE_DOWN.addTarget(self, action: "activateBtnMiddleDown:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(BTN_MIDDLE_DOWN)
        
        BTN_UP_NEGATIVE.frame = CGRectMake(285, 200, 25, 25)
        BTN_UP_NEGATIVE.backgroundColor = UIColor.clearColor()
        BTN_UP_NEGATIVE.layer.borderWidth = 1.0
        BTN_UP_NEGATIVE.layer.borderColor = UIColor.blackColor().CGColor
        BTN_UP_NEGATIVE.layer.cornerRadius = 5.0
        BTN_UP_NEGATIVE.setTitle("➡️", forState: UIControlState.Normal)
        BTN_UP_NEGATIVE.addTarget(self, action: "activateBtnUpNegative:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(BTN_UP_NEGATIVE)
        
        BTN_UP_POSITIVE.frame = CGRectMake(10, 200, 25, 25)
        BTN_UP_POSITIVE.backgroundColor = UIColor.clearColor()
        BTN_UP_POSITIVE.layer.borderWidth = 1.0
        BTN_UP_POSITIVE.layer.borderColor = UIColor.blackColor().CGColor
        BTN_UP_POSITIVE.layer.cornerRadius = 5.0
        BTN_UP_POSITIVE.setTitle("⬅️", forState: UIControlState.Normal)
        BTN_UP_POSITIVE.addTarget(self, action: "activateBtnUpPositive:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(BTN_UP_POSITIVE)
        
        BTN_DOWN_POSITIVE.frame = CGRectMake(285, 360, 25, 25)
        BTN_DOWN_POSITIVE.backgroundColor = UIColor.clearColor()
        BTN_DOWN_POSITIVE.layer.borderWidth = 1.0
        BTN_DOWN_POSITIVE.layer.borderColor = UIColor.blackColor().CGColor
        BTN_DOWN_POSITIVE.layer.cornerRadius = 5.0
        BTN_DOWN_POSITIVE.setTitle("➡️", forState: UIControlState.Normal)
        BTN_DOWN_POSITIVE.addTarget(self, action: "activateBtnDownPositive:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(BTN_DOWN_POSITIVE)
        
        BTN_DOWN_NEGATIVE.frame = CGRectMake(10, 360, 25, 25)
        BTN_DOWN_NEGATIVE.backgroundColor = UIColor.clearColor()
        BTN_DOWN_NEGATIVE.layer.borderWidth = 1.0
        BTN_DOWN_NEGATIVE.layer.borderColor = UIColor.blackColor().CGColor
        BTN_DOWN_NEGATIVE.layer.cornerRadius = 5.0
        BTN_DOWN_NEGATIVE.setTitle("⬅️", forState: UIControlState.Normal)
        BTN_DOWN_NEGATIVE.addTarget(self, action: "activateBtnDownNegative:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(BTN_DOWN_NEGATIVE)
        
        BTN_MIDDLE_RIGHT.frame = CGRectMake(285, 280, 25, 25)
        BTN_MIDDLE_RIGHT.backgroundColor = UIColor.clearColor()
        BTN_MIDDLE_RIGHT.layer.borderWidth = 1.0
        BTN_MIDDLE_RIGHT.layer.borderColor = UIColor.blackColor().CGColor
        BTN_MIDDLE_RIGHT.layer.cornerRadius = 5.0
        BTN_MIDDLE_RIGHT.setTitle("➡️", forState: UIControlState.Normal)
        BTN_MIDDLE_RIGHT.addTarget(self, action: "activateBtnMiddleRight:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(BTN_MIDDLE_RIGHT)
        
        BTN_MIDDLE_LEFT.frame = CGRectMake(10, 280, 25, 25)
        BTN_MIDDLE_LEFT.backgroundColor = UIColor.clearColor()
        BTN_MIDDLE_LEFT.layer.borderWidth = 1.0
        BTN_MIDDLE_LEFT.layer.borderColor = UIColor.blackColor().CGColor
        BTN_MIDDLE_LEFT.layer.cornerRadius = 5.0
        BTN_MIDDLE_LEFT.setTitle("⬅️", forState: UIControlState.Normal)
        BTN_MIDDLE_LEFT.addTarget(self, action: "activateBtnMiddleLeft:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(BTN_MIDDLE_LEFT)
        
        BTN_FRONT_POSITIVE.frame = CGRectMake(160, 280, 25, 25)
        BTN_FRONT_POSITIVE.backgroundColor = UIColor.clearColor()
        BTN_FRONT_POSITIVE.layer.borderWidth = 1.0
        BTN_FRONT_POSITIVE.layer.borderColor = UIColor.blackColor().CGColor
        BTN_FRONT_POSITIVE.layer.cornerRadius = 5.0
        BTN_FRONT_POSITIVE.setTitle("↩️", forState: UIControlState.Normal)
        BTN_FRONT_POSITIVE.addTarget(self, action: "activateBtnFrontPositive:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(BTN_FRONT_POSITIVE)
        
        BTN_FRONT_NEGATIVE.frame = CGRectMake(130, 280, 25, 25)
        BTN_FRONT_NEGATIVE.backgroundColor = UIColor.clearColor()
        BTN_FRONT_NEGATIVE.layer.borderWidth = 1.0
        BTN_FRONT_NEGATIVE.layer.borderColor = UIColor.blackColor().CGColor
        BTN_FRONT_NEGATIVE.layer.cornerRadius = 5.0
        BTN_FRONT_NEGATIVE.setTitle("↪️", forState: UIControlState.Normal)
        BTN_FRONT_NEGATIVE.addTarget(self, action: "activateBtnFrontNegative:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(BTN_FRONT_NEGATIVE)
        
        BTN_FRONT_LEFT.frame = CGRectMake(120, 500, 25, 25)
        BTN_FRONT_LEFT.backgroundColor = UIColor.clearColor()
        BTN_FRONT_LEFT.layer.borderWidth = 1.0
        BTN_FRONT_LEFT.layer.borderColor = UIColor.blackColor().CGColor
        BTN_FRONT_LEFT.layer.cornerRadius = 5.0
        BTN_FRONT_LEFT.setTitle("⬅️", forState: UIControlState.Normal)
        BTN_FRONT_LEFT.addTarget(self, action: "activateBtnFrontLeft:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(BTN_FRONT_LEFT)
        
        BTN_FRONT_RIGHT.frame = CGRectMake(170, 500, 25, 25)
        BTN_FRONT_RIGHT.backgroundColor = UIColor.clearColor()
        BTN_FRONT_RIGHT.layer.borderWidth = 1.0
        BTN_FRONT_RIGHT.layer.borderColor = UIColor.blackColor().CGColor
        BTN_FRONT_RIGHT.layer.cornerRadius = 5.0
        BTN_FRONT_RIGHT.setTitle("➡️", forState: UIControlState.Normal)
        BTN_FRONT_RIGHT.addTarget(self, action: "activateBtnFrontRight:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(BTN_FRONT_RIGHT)
        
        BTN_FRONT_UP.frame = CGRectMake(145, 475, 25, 25)
        BTN_FRONT_UP.backgroundColor = UIColor.clearColor()
        BTN_FRONT_UP.layer.borderWidth = 1.0
        BTN_FRONT_UP.layer.borderColor = UIColor.blackColor().CGColor
        BTN_FRONT_UP.layer.cornerRadius = 5.0
        BTN_FRONT_UP.setTitle("⬆️", forState: UIControlState.Normal)
        BTN_FRONT_UP.addTarget(self, action: "activateBtnFrontUp:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(BTN_FRONT_UP)
        
        BTN_FRONT_DOWN.frame = CGRectMake(145, 500, 25, 25)
        BTN_FRONT_DOWN.backgroundColor = UIColor.clearColor()
        BTN_FRONT_DOWN.layer.borderWidth = 1.0
        BTN_FRONT_DOWN.layer.borderColor = UIColor.blackColor().CGColor
        BTN_FRONT_DOWN.layer.cornerRadius = 5.0
        BTN_FRONT_DOWN.setTitle("⬇️", forState: UIControlState.Normal)
        BTN_FRONT_DOWN.addTarget(self, action: "activateBtnFrontDown:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(BTN_FRONT_DOWN)
        
        BTN_FRONT_MIDDLE_NEGATIVE.frame = CGRectMake(120, 100, 25, 25)
        BTN_FRONT_MIDDLE_NEGATIVE.backgroundColor = UIColor.clearColor()
        BTN_FRONT_MIDDLE_NEGATIVE.layer.borderWidth = 1.0
        BTN_FRONT_MIDDLE_NEGATIVE.layer.borderColor = UIColor.blackColor().CGColor
        BTN_FRONT_MIDDLE_NEGATIVE.layer.cornerRadius = 5.0
        BTN_FRONT_MIDDLE_NEGATIVE.setTitle("↩️", forState: UIControlState.Normal)
        BTN_FRONT_MIDDLE_NEGATIVE.addTarget(self, action: "activateBtnFrontMiddleNegative:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(BTN_FRONT_MIDDLE_NEGATIVE)
        
        BTN_FRONT_MIDDLE_POSITIVE.frame = CGRectMake(170,100, 25, 25)
        BTN_FRONT_MIDDLE_POSITIVE.backgroundColor = UIColor.clearColor()
        BTN_FRONT_MIDDLE_POSITIVE.layer.borderWidth = 1.0
        BTN_FRONT_MIDDLE_POSITIVE.layer.borderColor = UIColor.blackColor().CGColor
        BTN_FRONT_MIDDLE_POSITIVE.layer.cornerRadius = 5.0
        BTN_FRONT_MIDDLE_POSITIVE.setTitle("↪️", forState: UIControlState.Normal)
        BTN_FRONT_MIDDLE_POSITIVE.addTarget(self, action: "activateBtnFrontMiddlePositive:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(BTN_FRONT_MIDDLE_POSITIVE)
        
        BTN_BACK_TO_MENU.frame = CGRectMake(250,500, 50, 25)
        BTN_BACK_TO_MENU.backgroundColor = UIColor.clearColor()
        BTN_BACK_TO_MENU.setTitle("Retour", forState: UIControlState.Normal)
        BTN_BACK_TO_MENU.addTarget(self, action: "activateBtnBackToMenu:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(BTN_BACK_TO_MENU)
    }
    
    ///
    /// Nom : activateBtnRightNegative
    /// Description : Cette fonction lance la fonction turnRightNegative lorsque l'on clique sur le bouton RightNegative.
    /// Paramètre : sender : UIButton!
    ///
    func activateBtnRightNegative(sender:UIButton!)
    {
        turnRightNegative()
    }
    
    ///
    /// Nom : activateBtnRightPositive
    /// Description : Cette fonction lance la fonction turnRightPositive lorsque l'on clique sur le bouton RightPositive.
    /// Paramètre : sender : UIButton!
    ///
    func activateBtnRightPositive(sender:UIButton!)
    {
        turnRightPositive()
    }
    
    ///
    /// Nom : activateBtnLeftPositive
    /// Description : Cette fonction lance la fonction turnLeftPositive lorsque l'on clique sur le bouton LeftPositive.
    /// Paramètre : sender : UIButton!
    ///
    func activateBtnLeftPositive(sender:UIButton!)
    {
        turnLeftPositive()
    }
    
    ///
    /// Nom : activateBtnLeftNegative
    /// Description : Cette fonction lance la fonction turnLeftNegative lorsque l'on clique sur le bouton LeftNegative.
    /// Paramètre : sender : UIButton!
    ///
    func activateBtnLeftNegative(sender:UIButton!)
    {
        turnLeftNegative()
    }
    
    ///
    /// Nom : activateBtnMiddleUp
    /// Description : Cette fonction lance la fonction turnMiddleUp lorsque l'on clique sur le bouton MiddleUp.
    /// Paramètre : sender : UIButton!
    ///
    func activateBtnMiddleUp(sender:UIButton!)
    {
        turnMiddleUp()
    }
    
    ///
    /// Nom : activateBtnMiddleDown
    /// Description : Cette fonction lance la fonction turnMiddleDown lorsque l'on clique sur le bouton MiddleDown.
    /// Paramètre : sender : UIButton!
    ///
    func activateBtnMiddleDown(sender:UIButton!)
    {
        turnMiddleDown()
    }

    ///
    /// Nom : activateBtnUpNegative
    /// Description : Cette fonction lance la fonction turnUpNegative lorsque l'on clique sur le bouton UpNegative.
    /// Paramètre : sender : UIButton!
    ///
    func activateBtnUpNegative(sender:UIButton!)
    {
        turnUpNegative()
    }
    
    ///
    /// Nom : activateBtnUpPositive
    /// Description : Cette fonction lance la fonction turnUpPositive lorsque l'on clique sur le bouton UpPositive.
    /// Paramètre : sender : UIButton!
    ///
    func activateBtnUpPositive(sender:UIButton!)
    {
        turnUpPositive()
    }
    
    ///
    /// Nom : activateBtnDownPositive
    /// Description : Cette fonction lance la fonction turnDownPositive lorsque l'on clique sur le bouton DownPositive.
    /// Paramètre : sender : UIButton!
    ///
    func activateBtnDownPositive(sender:UIButton!)
    {
        turnDownPositive()
    }
    
    ///
    /// Nom : activateBtnDownNegative
    /// Description : Cette fonction lance la fonction turnDownNegative lorsque l'on clique sur le bouton DownDegative.
    /// Paramètre : sender : UIButton!
    ///
    func activateBtnDownNegative(sender:UIButton!)
    {
        turnDownNegative()
    }
    
    ///
    /// Nom : activateBtnMiddleRight
    /// Description : Cette fonction lance la fonction turnMiddleRight lorsque l'on clique sur le bouton MiddleRight.
    /// Paramètre : sender : UIButton!
    ///
    func activateBtnMiddleRight(sender:UIButton!)
    {
        turnMiddleRight()
    }
    
    ///
    /// Nom : activateBtnMiddleLeft
    /// Description : Cette fonction lance la fonction turnMiddleLeft lorsque l'on clique sur le bouton MiddleLeft.
    /// Paramètre : sender : UIButton!
    ///
    func activateBtnMiddleLeft(sender:UIButton!)
    {
        turnMiddleLeft()
    }
    
    ///
    /// Nom : activateBtnFrontPositive
    /// Description : Cette fonction lance la fonction turnFrontPositive lorsque l'on clique sur le bouton FrontPositive.
    /// Paramètre : sender : UIButton!
    ///
    func activateBtnFrontPositive(sender:UIButton!)
    {
        turnFrontPositive()
    }
    
    ///
    /// Nom : activateBtnFrontNegative
    /// Description : Cette fonction lance la fonction turnFrontNegative lorsque l'on clique sur le bouton FrontNegative.
    /// Paramètre : sender : UIButton!
    ///
    func activateBtnFrontNegative(sender:UIButton!)
    {
        turnFrontNegative()
    }
    
    ///
    /// Nom : activateBtnFrontLeft
    /// Description : Cette fonction lance la fonction turnFrontLeft lorsque l'on clique sur le bouton FrontLeft.
    /// Paramètre : sender : UIButton!
    ///
    func activateBtnFrontLeft(sender:UIButton!)
    {
        turnFrontLeft()
    }
    
    ///
    /// Nom : activateBtnFrontRight
    /// Description : Cette fonction lance la fonction turnFrontRight lorsque l'on clique sur le bouton FrontRight.
    /// Paramètre : sender : UIButton!
    ///
    func activateBtnFrontRight(sender:UIButton!)
    {
        turnFrontRight()
    }
    
    ///
    /// Nom : activateBtnFrontUp
    /// Description : Cette fonction lance la fonction turnFrontUp lorsque l'on clique sur le bouton FrontUp.
    /// Paramètre : sender : UIButton!
    ///
    func activateBtnFrontUp(sender:UIButton!)
    {
        turnFrontUp()
    }
    
    ///
    /// Nom : activateBtnFrontDown
    /// Description : Cette fonction lance la fonction turnFrontDown lorsque l'on clique sur le bouton FrontDown.
    /// Paramètre : sender : UIButton!
    ///
    func activateBtnFrontDown(sender:UIButton!)
    {
        turnFrontDown()
    }
    
    ///
    /// Nom : activateBtnFrontMiddleNegative
    /// Description : Cette fonction lance la fonction turnFrontMiddleNegative lorsque l'on clique sur le bouton FrontMiddleNegative.
    /// Paramètre : sender : UIButton!
    ///
    func activateBtnFrontMiddleNegative(sender:UIButton!)
    {
        turnFrontMiddleNegative()
    }
    
    ///
    /// Nom : activateBtnFrontMiddlePositive
    /// Description : Cette fonction lance la fonction turnFrontMiddlePositive lorsque l'on clique sur le bouton FrontMiddlePositive.
    /// Paramètre : sender : UIButton!
    ///
    func activateBtnFrontMiddlePositive(sender:UIButton!)
    {
        turnFrontMiddlePositive()
    }
    
    ///
    /// Nom : activateBtnBackToMenu
    /// Description : Cette fonction permet de revenir au menu lorsque l'on clique sur le bouton FrontMiddlePositive.
    /// Paramètre : sender : UIButton!
    ///
    func activateBtnBackToMenu(sender:UIButton!)
    {
        performSegueWithIdentifier("ToFirst", sender: nil)
    }
    
    ///
    /// Nom : runAfterDelay
    /// Description : Cette fonction permet de mettre un temps précis avant que ce qu'il y a dedans se passe.
    /// Paramètre : delay : NSTimeInterval, block : dispatch_block_t
    ///
    func runAfterDelay(delay : NSTimeInterval, block : dispatch_block_t) {
        let TIME = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
        dispatch_after(TIME, dispatch_get_main_queue(), block)
    }
    
    ///
    /// Nom : mixRubiksCube
    /// Description : Cette fonction permet de mélanger aléatoirement le Rubik's Cube
    ///
    func mixRubiksCube() {
        let RANDOM_NUMBER = Int(arc4random_uniform(13))

        if self.ARRAYS_MOVEMENTS[RANDOM_NUMBER] == "RightPositive" {
            self.turnRightPositive()
        }
        
        if self.ARRAYS_MOVEMENTS[RANDOM_NUMBER] == "RightNegative" {
            self.turnRightNegative()
        }
        
        if self.ARRAYS_MOVEMENTS[RANDOM_NUMBER] == "UpNegative" {
            self.turnUpNegative()
        }
        
        if self.ARRAYS_MOVEMENTS[RANDOM_NUMBER] == "UpPositive" {
            self.turnUpPositive()
        }
        
        if self.ARRAYS_MOVEMENTS[RANDOM_NUMBER] == "MiddleUp" {
            self.turnMiddleUp()
        }
        
        if self.ARRAYS_MOVEMENTS[RANDOM_NUMBER] == "MiddleDown" {
            self.turnMiddleDown()
        }
        
        if self.ARRAYS_MOVEMENTS[RANDOM_NUMBER] == "DownNegative" {
            self.turnDownNegative()
        }
        
        if self.ARRAYS_MOVEMENTS[RANDOM_NUMBER] == "DownPositive" {
            self.turnDownPositive()
        }
        
        if self.ARRAYS_MOVEMENTS[RANDOM_NUMBER] == "MiddleRight" {
            self.turnMiddleRight()
        }
        
        if self.ARRAYS_MOVEMENTS[RANDOM_NUMBER] == "MiddleLeft" {
            self.turnMiddleLeft()
        }
        
        if self.ARRAYS_MOVEMENTS[RANDOM_NUMBER] == "FrontNegative" {
            self.turnFrontNegative()
        }
        
        if self.ARRAYS_MOVEMENTS[RANDOM_NUMBER] == "FrontPositive" {
            self.turnFrontPositive()
        }
        
        if self.ARRAYS_MOVEMENTS[RANDOM_NUMBER] == "LeftPositive" {
            self.turnLeftPositive()
        }
        
        if self.ARRAYS_MOVEMENTS[RANDOM_NUMBER] == "LeftNegative" {
            self.turnLeftNegative()
        }
        
        if self.ARRAYS_MOVEMENTS[RANDOM_NUMBER] == "MiddlePositive" {
            self.turnFrontMiddlePositive()
        }
        
        if self.ARRAYS_MOVEMENTS[RANDOM_NUMBER] == "MiddleNegative" {
            self.turnFrontMiddleNegative()
        }
    }
    
    ///
    /// Nom : turnRightNegative
    /// Description : Cette fonction permet de tourner la ligne RightNegative et de cacher les boutons pendant l'animation.
    ///
    func turnRightNegative() {
        // create a temporary node for the rotation
        let ROTATE_NODE = SCNNode()
        
        BTN_RIGHT_NEGATIVE.hidden = true
        BTN_UP_NEGATIVE.hidden = true
        BTN_DOWN_NEGATIVE.hidden = true
        BTN_LEFT_NEGATIVE.hidden = true
        BTN_RIGHT_POSITIVE.hidden = true
        BTN_UP_POSITIVE.hidden = true
        BTN_DOWN_POSITIVE.hidden = true
        BTN_LEFT_POSITIVE.hidden = true
        BTN_MIDDLE_DOWN.hidden = true
        BTN_MIDDLE_RIGHT.hidden = true
        BTN_MIDDLE_LEFT.hidden = true
        BTN_MIDDLEUP.hidden = true
        BTN_FRONT_POSITIVE.hidden = true
        BTN_FRONT_NEGATIVE.hidden = true
        BTN_FRONT_LEFT.hidden = true
        BTN_FRONT_RIGHT.hidden = true
        BTN_FRONT_UP.hidden = true
        BTN_FRONT_DOWN.hidden = true
        BTN_FRONT_MIDDLE_POSITIVE.hidden = true
        BTN_FRONT_MIDDLE_NEGATIVE.hidden = true
        
        SCENE.rootNode.addChildNode(ROTATE_NODE)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let RIGHT_CUBELETS = cubelets.filter { node in
            return abs(node.position.x - 1) < 0.001
        }
        RIGHT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        ROTATE_NODE.eulerAngles.x -= Float(M_PI_2)
        
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            ROTATE_NODE.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            
            self.BTN_RIGHT_NEGATIVE.hidden = false
            self.BTN_UP_NEGATIVE.hidden = false
            self.BTN_DOWN_NEGATIVE.hidden = false
            self.BTN_LEFT_NEGATIVE.hidden = false
            self.BTN_RIGHT_POSITIVE.hidden = false
            self.BTN_UP_POSITIVE.hidden = false
            self.BTN_DOWN_POSITIVE.hidden = false
            self.BTN_LEFT_POSITIVE.hidden = false
            self.BTN_MIDDLE_DOWN.hidden = false
            self.BTN_MIDDLE_RIGHT.hidden = false
            self.BTN_MIDDLE_LEFT.hidden = false
            self.BTN_MIDDLEUP.hidden = false
            self.BTN_FRONT_POSITIVE.hidden = false
            self.BTN_FRONT_NEGATIVE.hidden = false
            self.BTN_FRONT_LEFT.hidden = false
            self.BTN_FRONT_RIGHT.hidden = false
            self.BTN_FRONT_UP.hidden = false
            self.BTN_FRONT_DOWN.hidden = false
            self.BTN_FRONT_MIDDLE_NEGATIVE.hidden = false
            self.BTN_FRONT_MIDDLE_POSITIVE.hidden = false
            
            ROTATE_NODE.removeFromParentNode()
        }
        SCNTransaction.commit()
        
        scnRubiksCube.scene = SCENE
    }

    ///
    /// Nom : turnRightPositive
    /// Description : Cette fonction permet de tourner la ligne RightPositive et de cacher les boutons pendant l'animation.
    ///
    func turnRightPositive() {
        // create a temporary node for the rotation
        let ROTATE_NODE = SCNNode()
        
        BTN_RIGHT_NEGATIVE.hidden = true
        BTN_UP_NEGATIVE.hidden = true
        BTN_DOWN_NEGATIVE.hidden = true
        BTN_LEFT_NEGATIVE.hidden = true
        BTN_RIGHT_POSITIVE.hidden = true
        BTN_UP_POSITIVE.hidden = true
        BTN_DOWN_POSITIVE.hidden = true
        BTN_LEFT_POSITIVE.hidden = true
        BTN_MIDDLE_DOWN.hidden = true
        BTN_MIDDLE_RIGHT.hidden = true
        BTN_MIDDLE_LEFT.hidden = true
        BTN_MIDDLEUP.hidden = true
        BTN_FRONT_POSITIVE.hidden = true
        BTN_FRONT_NEGATIVE.hidden = true
        BTN_FRONT_LEFT.hidden = true
        BTN_FRONT_RIGHT.hidden = true
        BTN_FRONT_UP.hidden = true
        BTN_FRONT_DOWN.hidden = true
        BTN_FRONT_MIDDLE_POSITIVE.hidden = true
        BTN_FRONT_MIDDLE_NEGATIVE.hidden = true
        
        SCENE.rootNode.addChildNode(ROTATE_NODE)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let RIGHT_CUBELETS = cubelets.filter { node in
            return abs(node.position.x - 1) < 0.001
        }
        RIGHT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        ROTATE_NODE.eulerAngles.x += Float(M_PI_2)
        
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            ROTATE_NODE.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_RIGHT_NEGATIVE.hidden = false
            self.BTN_UP_NEGATIVE.hidden = false
            self.BTN_DOWN_NEGATIVE.hidden = false
            self.BTN_LEFT_NEGATIVE.hidden = false
            self.BTN_RIGHT_POSITIVE.hidden = false
            self.BTN_UP_POSITIVE.hidden = false
            self.BTN_DOWN_POSITIVE.hidden = false
            self.BTN_LEFT_POSITIVE.hidden = false
            self.BTN_MIDDLE_DOWN.hidden = false
            self.BTN_MIDDLE_RIGHT.hidden = false
            self.BTN_MIDDLE_LEFT.hidden = false
            self.BTN_MIDDLEUP.hidden = false
            self.BTN_FRONT_POSITIVE.hidden = false
            self.BTN_FRONT_NEGATIVE.hidden = false
            self.BTN_FRONT_LEFT.hidden = false
            self.BTN_FRONT_RIGHT.hidden = false
            self.BTN_FRONT_UP.hidden = false
            self.BTN_FRONT_DOWN.hidden = false
            self.BTN_FRONT_MIDDLE_NEGATIVE.hidden = false
            self.BTN_FRONT_MIDDLE_POSITIVE.hidden = false
            
            ROTATE_NODE.removeFromParentNode()
        }
        SCNTransaction.commit()
        
        scnRubiksCube.scene = SCENE
    }
    
    ///
    /// Nom : turnLeftPositive
    /// Description : Cette fonction permet de tourner la ligne LeftPositive et de cacher les boutons pendant l'animation.
    ///
    func turnLeftPositive() {
        // create a temporary node for the rotation
        let ROTATE_NODE = SCNNode()
        
        BTN_RIGHT_NEGATIVE.hidden = true
        BTN_UP_NEGATIVE.hidden = true
        BTN_DOWN_NEGATIVE.hidden = true
        BTN_LEFT_NEGATIVE.hidden = true
        BTN_RIGHT_POSITIVE.hidden = true
        BTN_UP_POSITIVE.hidden = true
        BTN_DOWN_POSITIVE.hidden = true
        BTN_LEFT_POSITIVE.hidden = true
        BTN_MIDDLE_DOWN.hidden = true
        BTN_MIDDLE_RIGHT.hidden = true
        BTN_MIDDLE_LEFT.hidden = true
        BTN_MIDDLEUP.hidden = true
        BTN_FRONT_POSITIVE.hidden = true
        BTN_FRONT_NEGATIVE.hidden = true
        BTN_FRONT_LEFT.hidden = true
        BTN_FRONT_RIGHT.hidden = true
        BTN_FRONT_UP.hidden = true
        BTN_FRONT_DOWN.hidden = true
        BTN_FRONT_MIDDLE_POSITIVE.hidden = true
        BTN_FRONT_MIDDLE_NEGATIVE.hidden = true
        
        SCENE.rootNode.addChildNode(ROTATE_NODE)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let RIGHT_CUBELETS = cubelets.filter { node in
            return abs(node.position.x + 1) < 0.001
        }
        RIGHT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        ROTATE_NODE.eulerAngles.x -= Float(M_PI_2)
        
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            ROTATE_NODE.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_RIGHT_NEGATIVE.hidden = false
            self.BTN_UP_NEGATIVE.hidden = false
            self.BTN_DOWN_NEGATIVE.hidden = false
            self.BTN_LEFT_NEGATIVE.hidden = false
            self.BTN_RIGHT_POSITIVE.hidden = false
            self.BTN_UP_POSITIVE.hidden = false
            self.BTN_DOWN_POSITIVE.hidden = false
            self.BTN_LEFT_POSITIVE.hidden = false
            self.BTN_MIDDLE_DOWN.hidden = false
            self.BTN_MIDDLE_RIGHT.hidden = false
            self.BTN_MIDDLE_LEFT.hidden = false
            self.BTN_MIDDLEUP.hidden = false
            self.BTN_FRONT_POSITIVE.hidden = false
            self.BTN_FRONT_NEGATIVE.hidden = false
            self.BTN_FRONT_LEFT.hidden = false
            self.BTN_FRONT_RIGHT.hidden = false
            self.BTN_FRONT_UP.hidden = false
            self.BTN_FRONT_DOWN.hidden = false
            self.BTN_FRONT_MIDDLE_NEGATIVE.hidden = false
            self.BTN_FRONT_MIDDLE_POSITIVE.hidden = false
            
            ROTATE_NODE.removeFromParentNode()
        }
        SCNTransaction.commit()
        
        scnRubiksCube.scene = SCENE
    }
    
    ///
    /// Nom : turnLeftNegative
    /// Description : Cette fonction permet de tourner la ligne LeftNegative et de cacher les boutons pendant l'animation.
    ///
    func turnLeftNegative() {
        // create a temporary node for the rotation
        let ROTATE_NODE = SCNNode()
        
        BTN_RIGHT_NEGATIVE.hidden = true
        BTN_UP_NEGATIVE.hidden = true
        BTN_DOWN_NEGATIVE.hidden = true
        BTN_LEFT_NEGATIVE.hidden = true
        BTN_RIGHT_POSITIVE.hidden = true
        BTN_UP_POSITIVE.hidden = true
        BTN_DOWN_POSITIVE.hidden = true
        BTN_LEFT_POSITIVE.hidden = true
        BTN_MIDDLE_DOWN.hidden = true
        BTN_MIDDLE_RIGHT.hidden = true
        BTN_MIDDLE_LEFT.hidden = true
        BTN_MIDDLEUP.hidden = true
        BTN_FRONT_POSITIVE.hidden = true
        BTN_FRONT_NEGATIVE.hidden = true
        BTN_FRONT_LEFT.hidden = true
        BTN_FRONT_RIGHT.hidden = true
        BTN_FRONT_UP.hidden = true
        BTN_FRONT_DOWN.hidden = true
        BTN_FRONT_MIDDLE_POSITIVE.hidden = true
        BTN_FRONT_MIDDLE_NEGATIVE.hidden = true
        
        SCENE.rootNode.addChildNode(ROTATE_NODE)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let RIGHT_CUBELETS = cubelets.filter { node in
            return abs(node.position.x + 1) < 0.001
        }
        RIGHT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        ROTATE_NODE.eulerAngles.x += Float(M_PI_2)
        
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            ROTATE_NODE.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_RIGHT_NEGATIVE.hidden = false
            self.BTN_UP_NEGATIVE.hidden = false
            self.BTN_DOWN_NEGATIVE.hidden = false
            self.BTN_LEFT_NEGATIVE.hidden = false
            self.BTN_RIGHT_POSITIVE.hidden = false
            self.BTN_UP_POSITIVE.hidden = false
            self.BTN_DOWN_POSITIVE.hidden = false
            self.BTN_LEFT_POSITIVE.hidden = false
            self.BTN_MIDDLE_DOWN.hidden = false
            self.BTN_MIDDLE_RIGHT.hidden = false
            self.BTN_MIDDLE_LEFT.hidden = false
            self.BTN_MIDDLEUP.hidden = false
            self.BTN_FRONT_POSITIVE.hidden = false
            self.BTN_FRONT_NEGATIVE.hidden = false
            self.BTN_FRONT_LEFT.hidden = false
            self.BTN_FRONT_RIGHT.hidden = false
            self.BTN_FRONT_UP.hidden = false
            self.BTN_FRONT_DOWN.hidden = false
            self.BTN_FRONT_MIDDLE_NEGATIVE.hidden = false
            self.BTN_FRONT_MIDDLE_POSITIVE.hidden = false
            
            ROTATE_NODE.removeFromParentNode()
        }
        SCNTransaction.commit()
        
        scnRubiksCube.scene = SCENE
    }
    
    ///
    /// Nom : turnMiddleUp
    /// Description : Cette fonction permet de tourner la ligne MiddleUp et de cacher les boutons pendant l'animation.
    ///
    func turnMiddleUp() {
        // create a temporary node for the rotation
        let ROTATE_NODE = SCNNode()
        
        BTN_RIGHT_NEGATIVE.hidden = true
        BTN_UP_NEGATIVE.hidden = true
        BTN_DOWN_NEGATIVE.hidden = true
        BTN_LEFT_NEGATIVE.hidden = true
        BTN_RIGHT_POSITIVE.hidden = true
        BTN_UP_POSITIVE.hidden = true
        BTN_DOWN_POSITIVE.hidden = true
        BTN_LEFT_POSITIVE.hidden = true
        BTN_MIDDLE_DOWN.hidden = true
        BTN_MIDDLE_RIGHT.hidden = true
        BTN_MIDDLE_LEFT.hidden = true
        BTN_MIDDLEUP.hidden = true
        BTN_FRONT_POSITIVE.hidden = true
        BTN_FRONT_NEGATIVE.hidden = true
        BTN_FRONT_LEFT.hidden = true
        BTN_FRONT_RIGHT.hidden = true
        BTN_FRONT_UP.hidden = true
        BTN_FRONT_DOWN.hidden = true
        BTN_FRONT_MIDDLE_POSITIVE.hidden = true
        BTN_FRONT_MIDDLE_NEGATIVE.hidden = true
        
        SCENE.rootNode.addChildNode(ROTATE_NODE)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let RIGHT_CUBELETS = cubelets.filter { node in
            return abs(node.position.x) < 0.001
        }
        RIGHT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        ROTATE_NODE.eulerAngles.x += Float(M_PI_2)
        
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            ROTATE_NODE.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_RIGHT_NEGATIVE.hidden = false
            self.BTN_UP_NEGATIVE.hidden = false
            self.BTN_DOWN_NEGATIVE.hidden = false
            self.BTN_LEFT_NEGATIVE.hidden = false
            self.BTN_RIGHT_POSITIVE.hidden = false
            self.BTN_UP_POSITIVE.hidden = false
            self.BTN_DOWN_POSITIVE.hidden = false
            self.BTN_LEFT_POSITIVE.hidden = false
            self.BTN_MIDDLE_DOWN.hidden = false
            self.BTN_MIDDLE_RIGHT.hidden = false
            self.BTN_MIDDLE_LEFT.hidden = false
            self.BTN_MIDDLEUP.hidden = false
            self.BTN_FRONT_POSITIVE.hidden = false
            self.BTN_FRONT_NEGATIVE.hidden = false
            self.BTN_FRONT_LEFT.hidden = false
            self.BTN_FRONT_RIGHT.hidden = false
            self.BTN_FRONT_UP.hidden = false
            self.BTN_FRONT_DOWN.hidden = false
            self.BTN_FRONT_MIDDLE_NEGATIVE.hidden = false
            self.BTN_FRONT_MIDDLE_POSITIVE.hidden = false
            
            ROTATE_NODE.removeFromParentNode()
        }
        SCNTransaction.commit()
        
        scnRubiksCube.scene = SCENE
    }
    
    ///
    /// Nom : turnMiddleDown
    /// Description : Cette fonction permet de tourner la ligne MiddleDown et de cacher les boutons pendant l'animation.
    ///
    func turnMiddleDown() {
        // create a temporary node for the rotation
        let ROTATE_NODE = SCNNode()
        
        BTN_RIGHT_NEGATIVE.hidden = true
        BTN_UP_NEGATIVE.hidden = true
        BTN_DOWN_NEGATIVE.hidden = true
        BTN_LEFT_NEGATIVE.hidden = true
        BTN_RIGHT_POSITIVE.hidden = true
        BTN_UP_POSITIVE.hidden = true
        BTN_DOWN_POSITIVE.hidden = true
        BTN_LEFT_POSITIVE.hidden = true
        BTN_MIDDLE_DOWN.hidden = true
        BTN_MIDDLE_RIGHT.hidden = true
        BTN_MIDDLE_LEFT.hidden = true
        BTN_MIDDLEUP.hidden = true
        BTN_FRONT_POSITIVE.hidden = true
        BTN_FRONT_NEGATIVE.hidden = true
        BTN_FRONT_LEFT.hidden = true
        BTN_FRONT_RIGHT.hidden = true
        BTN_FRONT_UP.hidden = true
        BTN_FRONT_DOWN.hidden = true
        BTN_FRONT_MIDDLE_POSITIVE.hidden = true
        BTN_FRONT_MIDDLE_NEGATIVE.hidden = true
        
        SCENE.rootNode.addChildNode(ROTATE_NODE)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let RIGHT_CUBELETS = cubelets.filter { node in
            return abs(node.position.x) < 0.001
        }
        RIGHT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        ROTATE_NODE.eulerAngles.x -= Float(M_PI_2)
        
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            ROTATE_NODE.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_RIGHT_NEGATIVE.hidden = false
            self.BTN_UP_NEGATIVE.hidden = false
            self.BTN_DOWN_NEGATIVE.hidden = false
            self.BTN_LEFT_NEGATIVE.hidden = false
            self.BTN_RIGHT_POSITIVE.hidden = false
            self.BTN_UP_POSITIVE.hidden = false
            self.BTN_DOWN_POSITIVE.hidden = false
            self.BTN_LEFT_POSITIVE.hidden = false
            self.BTN_MIDDLE_DOWN.hidden = false
            self.BTN_MIDDLE_RIGHT.hidden = false
            self.BTN_MIDDLE_LEFT.hidden = false
            self.BTN_MIDDLEUP.hidden = false
            self.BTN_FRONT_POSITIVE.hidden = false
            self.BTN_FRONT_NEGATIVE.hidden = false
            self.BTN_FRONT_LEFT.hidden = false
            self.BTN_FRONT_RIGHT.hidden = false
            self.BTN_FRONT_UP.hidden = false
            self.BTN_FRONT_DOWN.hidden = false
            self.BTN_FRONT_MIDDLE_NEGATIVE.hidden = false
            self.BTN_FRONT_MIDDLE_POSITIVE.hidden = false
            
            ROTATE_NODE.removeFromParentNode()
        }
        SCNTransaction.commit()
        
        scnRubiksCube.scene = SCENE
    }
    
    ///
    /// Nom : turnUpNegative
    /// Description : Cette fonction permet de tourner la ligne UpNegative et de cacher les boutons pendant l'animation.
    ///
    func turnUpNegative() {
        // create a temporary node for the rotation
        let ROTATE_NODE = SCNNode()
        
        BTN_RIGHT_NEGATIVE.hidden = true
        BTN_UP_NEGATIVE.hidden = true
        BTN_DOWN_NEGATIVE.hidden = true
        BTN_LEFT_NEGATIVE.hidden = true
        BTN_RIGHT_POSITIVE.hidden = true
        BTN_UP_POSITIVE.hidden = true
        BTN_DOWN_POSITIVE.hidden = true
        BTN_LEFT_POSITIVE.hidden = true
        BTN_MIDDLE_DOWN.hidden = true
        BTN_MIDDLE_RIGHT.hidden = true
        BTN_MIDDLE_LEFT.hidden = true
        BTN_MIDDLEUP.hidden = true
        BTN_FRONT_POSITIVE.hidden = true
        BTN_FRONT_NEGATIVE.hidden = true
        BTN_FRONT_LEFT.hidden = true
        BTN_FRONT_RIGHT.hidden = true
        BTN_FRONT_UP.hidden = true
        BTN_FRONT_DOWN.hidden = true
        BTN_FRONT_MIDDLE_POSITIVE.hidden = true
        BTN_FRONT_MIDDLE_NEGATIVE.hidden = true
        
        SCENE.rootNode.addChildNode(ROTATE_NODE)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let RIGHT_CUBELETS = cubelets.filter { node in
            return abs(node.position.y - 1) < 0.001
        }
        RIGHT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        ROTATE_NODE.eulerAngles.y -= Float(M_PI_2)
        
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            ROTATE_NODE.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_RIGHT_NEGATIVE.hidden = false
            self.BTN_UP_NEGATIVE.hidden = false
            self.BTN_DOWN_NEGATIVE.hidden = false
            self.BTN_LEFT_NEGATIVE.hidden = false
            self.BTN_RIGHT_POSITIVE.hidden = false
            self.BTN_UP_POSITIVE.hidden = false
            self.BTN_DOWN_POSITIVE.hidden = false
            self.BTN_LEFT_POSITIVE.hidden = false
            self.BTN_MIDDLE_DOWN.hidden = false
            self.BTN_MIDDLE_RIGHT.hidden = false
            self.BTN_MIDDLE_LEFT.hidden = false
            self.BTN_MIDDLEUP.hidden = false
            self.BTN_FRONT_POSITIVE.hidden = false
            self.BTN_FRONT_NEGATIVE.hidden = false
            self.BTN_FRONT_LEFT.hidden = false
            self.BTN_FRONT_RIGHT.hidden = false
            self.BTN_FRONT_UP.hidden = false
            self.BTN_FRONT_DOWN.hidden = false
            self.BTN_FRONT_MIDDLE_NEGATIVE.hidden = false
            self.BTN_FRONT_MIDDLE_POSITIVE.hidden = false
            
            ROTATE_NODE.removeFromParentNode()
        }
        SCNTransaction.commit()
        
        scnRubiksCube.scene = SCENE
    }
    
    ///
    /// Nom : turnUpPositive
    /// Description : Cette fonction permet de tourner la ligne UpPositive et de cacher les boutons pendant l'animation.
    ///
    func turnUpPositive() {
        // create a temporary node for the rotation
        let ROTATE_NODE = SCNNode()
        
        BTN_RIGHT_NEGATIVE.hidden = true
        BTN_UP_NEGATIVE.hidden = true
        BTN_DOWN_NEGATIVE.hidden = true
        BTN_LEFT_NEGATIVE.hidden = true
        BTN_RIGHT_POSITIVE.hidden = true
        BTN_UP_POSITIVE.hidden = true
        BTN_DOWN_POSITIVE.hidden = true
        BTN_LEFT_POSITIVE.hidden = true
        BTN_MIDDLE_DOWN.hidden = true
        BTN_MIDDLE_RIGHT.hidden = true
        BTN_MIDDLE_LEFT.hidden = true
        BTN_MIDDLEUP.hidden = true
        BTN_FRONT_POSITIVE.hidden = true
        BTN_FRONT_NEGATIVE.hidden = true
        BTN_FRONT_LEFT.hidden = true
        BTN_FRONT_RIGHT.hidden = true
        BTN_FRONT_UP.hidden = true
        BTN_FRONT_DOWN.hidden = true
        BTN_FRONT_MIDDLE_POSITIVE.hidden = true
        BTN_FRONT_MIDDLE_NEGATIVE.hidden = true
        
        SCENE.rootNode.addChildNode(ROTATE_NODE)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let RIGHT_CUBELETS = cubelets.filter { node in
            return abs(node.position.y - 1) < 0.001
        }
        RIGHT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        ROTATE_NODE.eulerAngles.y += Float(M_PI_2)
        
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            ROTATE_NODE.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_RIGHT_NEGATIVE.hidden = false
            self.BTN_UP_NEGATIVE.hidden = false
            self.BTN_DOWN_NEGATIVE.hidden = false
            self.BTN_LEFT_NEGATIVE.hidden = false
            self.BTN_RIGHT_POSITIVE.hidden = false
            self.BTN_UP_POSITIVE.hidden = false
            self.BTN_DOWN_POSITIVE.hidden = false
            self.BTN_LEFT_POSITIVE.hidden = false
            self.BTN_MIDDLE_DOWN.hidden = false
            self.BTN_MIDDLE_RIGHT.hidden = false
            self.BTN_MIDDLE_LEFT.hidden = false
            self.BTN_MIDDLEUP.hidden = false
            self.BTN_FRONT_POSITIVE.hidden = false
            self.BTN_FRONT_NEGATIVE.hidden = false
            self.BTN_FRONT_LEFT.hidden = false
            self.BTN_FRONT_RIGHT.hidden = false
            self.BTN_FRONT_UP.hidden = false
            self.BTN_FRONT_DOWN.hidden = false
            self.BTN_FRONT_MIDDLE_NEGATIVE.hidden = false
            self.BTN_FRONT_MIDDLE_POSITIVE.hidden = false
            
            ROTATE_NODE.removeFromParentNode()
        }
        SCNTransaction.commit()
        
        scnRubiksCube.scene = SCENE
    }
    
    ///
    /// Nom : turnDownPositive
    /// Description : Cette fonction permet de tourner la ligne DownPositive et de cacher les boutons pendant l'animation.
    ///
    func turnDownPositive() {
        // create a temporary node for the rotation
        let ROTATE_NODE = SCNNode()
        
        BTN_RIGHT_NEGATIVE.hidden = true
        BTN_UP_NEGATIVE.hidden = true
        BTN_DOWN_NEGATIVE.hidden = true
        BTN_LEFT_NEGATIVE.hidden = true
        BTN_RIGHT_POSITIVE.hidden = true
        BTN_UP_POSITIVE.hidden = true
        BTN_DOWN_POSITIVE.hidden = true
        BTN_LEFT_POSITIVE.hidden = true
        BTN_MIDDLE_DOWN.hidden = true
        BTN_MIDDLE_RIGHT.hidden = true
        BTN_MIDDLE_LEFT.hidden = true
        BTN_MIDDLEUP.hidden = true
        BTN_FRONT_POSITIVE.hidden = true
        BTN_FRONT_NEGATIVE.hidden = true
        BTN_FRONT_LEFT.hidden = true
        BTN_FRONT_RIGHT.hidden = true
        BTN_FRONT_UP.hidden = true
        BTN_FRONT_DOWN.hidden = true
        BTN_FRONT_MIDDLE_POSITIVE.hidden = true
        BTN_FRONT_MIDDLE_NEGATIVE.hidden = true
        
        SCENE.rootNode.addChildNode(ROTATE_NODE)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let RIGHT_CUBELETS = cubelets.filter { node in
            return abs(node.position.y + 1) < 0.001
        }
        RIGHT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        ROTATE_NODE.eulerAngles.y -= Float(M_PI_2)
        
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            ROTATE_NODE.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_RIGHT_NEGATIVE.hidden = false
            self.BTN_UP_NEGATIVE.hidden = false
            self.BTN_DOWN_NEGATIVE.hidden = false
            self.BTN_LEFT_NEGATIVE.hidden = false
            self.BTN_RIGHT_POSITIVE.hidden = false
            self.BTN_UP_POSITIVE.hidden = false
            self.BTN_DOWN_POSITIVE.hidden = false
            self.BTN_LEFT_POSITIVE.hidden = false
            self.BTN_MIDDLE_DOWN.hidden = false
            self.BTN_MIDDLE_RIGHT.hidden = false
            self.BTN_MIDDLE_LEFT.hidden = false
            self.BTN_MIDDLEUP.hidden = false
            self.BTN_FRONT_POSITIVE.hidden = false
            self.BTN_FRONT_NEGATIVE.hidden = false
            self.BTN_FRONT_LEFT.hidden = false
            self.BTN_FRONT_RIGHT.hidden = false
            self.BTN_FRONT_UP.hidden = false
            self.BTN_FRONT_DOWN.hidden = false
            self.BTN_FRONT_MIDDLE_NEGATIVE.hidden = false
            self.BTN_FRONT_MIDDLE_POSITIVE.hidden = false
            
            ROTATE_NODE.removeFromParentNode()
        }
        SCNTransaction.commit()
        
        scnRubiksCube.scene = SCENE
    }
    
    ///
    /// Nom : turnDownNegative
    /// Description : Cette fonction permet de tourner la ligne DownNegative et de cacher les boutons pendant l'animation.
    ///
    func turnDownNegative() {
        // create a temporary node for the rotation
        let ROTATE_NODE = SCNNode()
        
        BTN_RIGHT_NEGATIVE.hidden = true
        BTN_UP_NEGATIVE.hidden = true
        BTN_DOWN_NEGATIVE.hidden = true
        BTN_LEFT_NEGATIVE.hidden = true
        BTN_RIGHT_POSITIVE.hidden = true
        BTN_UP_POSITIVE.hidden = true
        BTN_DOWN_POSITIVE.hidden = true
        BTN_LEFT_POSITIVE.hidden = true
        BTN_MIDDLE_DOWN.hidden = true
        BTN_MIDDLE_RIGHT.hidden = true
        BTN_MIDDLE_LEFT.hidden = true
        BTN_MIDDLEUP.hidden = true
        BTN_FRONT_POSITIVE.hidden = true
        BTN_FRONT_NEGATIVE.hidden = true
        BTN_FRONT_LEFT.hidden = true
        BTN_FRONT_RIGHT.hidden = true
        BTN_FRONT_UP.hidden = true
        BTN_FRONT_DOWN.hidden = true
        BTN_FRONT_MIDDLE_POSITIVE.hidden = true
        BTN_FRONT_MIDDLE_NEGATIVE.hidden = true
        
        SCENE.rootNode.addChildNode(ROTATE_NODE)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let RIGHT_CUBELETS = cubelets.filter { node in
            return abs(node.position.y + 1) < 0.001
        }
        RIGHT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        ROTATE_NODE.eulerAngles.y += Float(M_PI_2)
        
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            ROTATE_NODE.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_RIGHT_NEGATIVE.hidden = false
            self.BTN_UP_NEGATIVE.hidden = false
            self.BTN_DOWN_NEGATIVE.hidden = false
            self.BTN_LEFT_NEGATIVE.hidden = false
            self.BTN_RIGHT_POSITIVE.hidden = false
            self.BTN_UP_POSITIVE.hidden = false
            self.BTN_DOWN_POSITIVE.hidden = false
            self.BTN_LEFT_POSITIVE.hidden = false
            self.BTN_MIDDLE_DOWN.hidden = false
            self.BTN_MIDDLE_RIGHT.hidden = false
            self.BTN_MIDDLE_LEFT.hidden = false
            self.BTN_MIDDLEUP.hidden = false
            self.BTN_FRONT_POSITIVE.hidden = false
            self.BTN_FRONT_NEGATIVE.hidden = false
            self.BTN_FRONT_LEFT.hidden = false
            self.BTN_FRONT_RIGHT.hidden = false
            self.BTN_FRONT_UP.hidden = false
            self.BTN_FRONT_DOWN.hidden = false
            self.BTN_FRONT_MIDDLE_NEGATIVE.hidden = false
            self.BTN_FRONT_MIDDLE_POSITIVE.hidden = false
            
            ROTATE_NODE.removeFromParentNode()
        }
        SCNTransaction.commit()
        
        scnRubiksCube.scene = SCENE
    }
    
    ///
    /// Nom : turnMiddleRight
    /// Description : Cette fonction permet de tourner la ligne MiddleRight et de cacher les boutons pendant l'animation.
    ///
    func turnMiddleRight() {
        // create a temporary node for the rotation
        let ROTATE_NODE = SCNNode()
        
        BTN_RIGHT_NEGATIVE.hidden = true
        BTN_UP_NEGATIVE.hidden = true
        BTN_DOWN_NEGATIVE.hidden = true
        BTN_LEFT_NEGATIVE.hidden = true
        BTN_RIGHT_POSITIVE.hidden = true
        BTN_UP_POSITIVE.hidden = true
        BTN_DOWN_POSITIVE.hidden = true
        BTN_LEFT_POSITIVE.hidden = true
        BTN_MIDDLE_DOWN.hidden = true
        BTN_MIDDLE_RIGHT.hidden = true
        BTN_MIDDLE_LEFT.hidden = true
        BTN_MIDDLEUP.hidden = true
        BTN_FRONT_POSITIVE.hidden = true
        BTN_FRONT_NEGATIVE.hidden = true
        BTN_FRONT_LEFT.hidden = true
        BTN_FRONT_RIGHT.hidden = true
        BTN_FRONT_UP.hidden = true
        BTN_FRONT_DOWN.hidden = true
        BTN_FRONT_MIDDLE_POSITIVE.hidden = true
        BTN_FRONT_MIDDLE_NEGATIVE.hidden = true
        
        SCENE.rootNode.addChildNode(ROTATE_NODE)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let RIGHT_CUBELETS = cubelets.filter { node in
            return abs(node.position.y) < 0.001
        }
        RIGHT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        ROTATE_NODE.eulerAngles.y -= Float(M_PI_2)
        
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            ROTATE_NODE.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_RIGHT_NEGATIVE.hidden = false
            self.BTN_UP_NEGATIVE.hidden = false
            self.BTN_DOWN_NEGATIVE.hidden = false
            self.BTN_LEFT_NEGATIVE.hidden = false
            self.BTN_RIGHT_POSITIVE.hidden = false
            self.BTN_UP_POSITIVE.hidden = false
            self.BTN_DOWN_POSITIVE.hidden = false
            self.BTN_LEFT_POSITIVE.hidden = false
            self.BTN_MIDDLE_DOWN.hidden = false
            self.BTN_MIDDLE_RIGHT.hidden = false
            self.BTN_MIDDLE_LEFT.hidden = false
            self.BTN_MIDDLEUP.hidden = false
            self.BTN_FRONT_POSITIVE.hidden = false
            self.BTN_FRONT_NEGATIVE.hidden = false
            self.BTN_FRONT_LEFT.hidden = false
            self.BTN_FRONT_RIGHT.hidden = false
            self.BTN_FRONT_UP.hidden = false
            self.BTN_FRONT_DOWN.hidden = false
            self.BTN_FRONT_MIDDLE_NEGATIVE.hidden = false
            self.BTN_FRONT_MIDDLE_POSITIVE.hidden = false
            
            ROTATE_NODE.removeFromParentNode()
        }
        SCNTransaction.commit()
        
        scnRubiksCube.scene = SCENE
    }
    
    ///
    /// Nom : turnMiddleLeft
    /// Description : Cette fonction permet de tourner la ligne MiddleLeft et de cacher les boutons pendant l'animation.
    ///
    func turnMiddleLeft() {
        // create a temporary node for the rotation
        let ROTATE_NODE = SCNNode()
        
        BTN_RIGHT_NEGATIVE.hidden = true
        BTN_UP_NEGATIVE.hidden = true
        BTN_DOWN_NEGATIVE.hidden = true
        BTN_LEFT_NEGATIVE.hidden = true
        BTN_RIGHT_POSITIVE.hidden = true
        BTN_UP_POSITIVE.hidden = true
        BTN_DOWN_POSITIVE.hidden = true
        BTN_LEFT_POSITIVE.hidden = true
        BTN_MIDDLE_DOWN.hidden = true
        BTN_MIDDLE_RIGHT.hidden = true
        BTN_MIDDLE_LEFT.hidden = true
        BTN_MIDDLEUP.hidden = true
        BTN_FRONT_POSITIVE.hidden = true
        BTN_FRONT_NEGATIVE.hidden = true
        BTN_FRONT_LEFT.hidden = true
        BTN_FRONT_RIGHT.hidden = true
        BTN_FRONT_UP.hidden = true
        BTN_FRONT_DOWN.hidden = true
        BTN_FRONT_MIDDLE_POSITIVE.hidden = true
        BTN_FRONT_MIDDLE_NEGATIVE.hidden = true
        
        SCENE.rootNode.addChildNode(ROTATE_NODE)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let RIGHT_CUBELETS = cubelets.filter { node in
            return abs(node.position.y) < 0.001
        }
        RIGHT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
 
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)

        ROTATE_NODE.eulerAngles.y += Float(M_PI_2)
        
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            ROTATE_NODE.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                
                self.SCENE.rootNode.addChildNode(cubelet)

            }
            self.BTN_RIGHT_NEGATIVE.hidden = false
            self.BTN_UP_NEGATIVE.hidden = false
            self.BTN_DOWN_NEGATIVE.hidden = false
            self.BTN_LEFT_NEGATIVE.hidden = false
            self.BTN_RIGHT_POSITIVE.hidden = false
            self.BTN_UP_POSITIVE.hidden = false
            self.BTN_DOWN_POSITIVE.hidden = false
            self.BTN_LEFT_POSITIVE.hidden = false
            self.BTN_MIDDLE_DOWN.hidden = false
            self.BTN_MIDDLE_RIGHT.hidden = false
            self.BTN_MIDDLE_LEFT.hidden = false
            self.BTN_MIDDLEUP.hidden = false
            self.BTN_FRONT_POSITIVE.hidden = false
            self.BTN_FRONT_NEGATIVE.hidden = false
            self.BTN_FRONT_LEFT.hidden = false
            self.BTN_FRONT_RIGHT.hidden = false
            self.BTN_FRONT_UP.hidden = false
            self.BTN_FRONT_DOWN.hidden = false
            self.BTN_FRONT_MIDDLE_NEGATIVE.hidden = false
            self.BTN_FRONT_MIDDLE_POSITIVE.hidden = false
            
            ROTATE_NODE.removeFromParentNode()
        }
        SCNTransaction.commit()

        scnRubiksCube.scene = SCENE
        }
    
    ///
    /// Nom : turnFrontPositive
    /// Description : Cette fonction permet de tourner la ligne FrontPositive et de cacher les boutons pendant l'animation.
    ///
    func turnFrontPositive() {
        // create a temporary node for the rotation
        let ROTATE_NODE = SCNNode()
        
        BTN_RIGHT_NEGATIVE.hidden = true
        BTN_UP_NEGATIVE.hidden = true
        BTN_DOWN_NEGATIVE.hidden = true
        BTN_LEFT_NEGATIVE.hidden = true
        BTN_RIGHT_POSITIVE.hidden = true
        BTN_UP_POSITIVE.hidden = true
        BTN_DOWN_POSITIVE.hidden = true
        BTN_LEFT_POSITIVE.hidden = true
        BTN_MIDDLE_DOWN.hidden = true
        BTN_MIDDLE_RIGHT.hidden = true
        BTN_MIDDLE_LEFT.hidden = true
        BTN_MIDDLEUP.hidden = true
        BTN_FRONT_POSITIVE.hidden = true
        BTN_FRONT_NEGATIVE.hidden = true
        BTN_FRONT_LEFT.hidden = true
        BTN_FRONT_RIGHT.hidden = true
        BTN_FRONT_UP.hidden = true
        BTN_FRONT_DOWN.hidden = true
        BTN_FRONT_MIDDLE_POSITIVE.hidden = true
        BTN_FRONT_MIDDLE_NEGATIVE.hidden = true
        
        SCENE.rootNode.addChildNode(ROTATE_NODE)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let RIGHT_CUBELETS = cubelets.filter { node in
            return abs(node.position.z - 1) < 0.001
        }
        RIGHT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
    
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        ROTATE_NODE.eulerAngles.z -= Float(M_PI_2)
        
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            ROTATE_NODE.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_RIGHT_NEGATIVE.hidden = false
            self.BTN_UP_NEGATIVE.hidden = false
            self.BTN_DOWN_NEGATIVE.hidden = false
            self.BTN_LEFT_NEGATIVE.hidden = false
            self.BTN_RIGHT_POSITIVE.hidden = false
            self.BTN_UP_POSITIVE.hidden = false
            self.BTN_DOWN_POSITIVE.hidden = false
            self.BTN_LEFT_POSITIVE.hidden = false
            self.BTN_MIDDLE_DOWN.hidden = false
            self.BTN_MIDDLE_RIGHT.hidden = false
            self.BTN_MIDDLE_LEFT.hidden = false
            self.BTN_MIDDLEUP.hidden = false
            self.BTN_FRONT_POSITIVE.hidden = false
            self.BTN_FRONT_NEGATIVE.hidden = false
            self.BTN_FRONT_LEFT.hidden = false
            self.BTN_FRONT_RIGHT.hidden = false
            self.BTN_FRONT_UP.hidden = false
            self.BTN_FRONT_DOWN.hidden = false
            self.BTN_FRONT_MIDDLE_NEGATIVE.hidden = false
            self.BTN_FRONT_MIDDLE_POSITIVE.hidden = false
            
            ROTATE_NODE.removeFromParentNode()
        }
        SCNTransaction.commit()
        
        scnRubiksCube.scene = SCENE
    }
    
    ///
    /// Nom : turnFrontNegative
    /// Description : Cette fonction permet de tourner la ligne FrontNegative et de cacher les boutons pendant l'animation.
    ///
    func turnFrontNegative() {
        // create a temporary node for the rotation
        let ROTATE_NODE = SCNNode()
        
        BTN_RIGHT_NEGATIVE.hidden = true
        BTN_UP_NEGATIVE.hidden = true
        BTN_DOWN_NEGATIVE.hidden = true
        BTN_LEFT_NEGATIVE.hidden = true
        BTN_RIGHT_POSITIVE.hidden = true
        BTN_UP_POSITIVE.hidden = true
        BTN_DOWN_POSITIVE.hidden = true
        BTN_LEFT_POSITIVE.hidden = true
        BTN_MIDDLE_DOWN.hidden = true
        BTN_MIDDLE_RIGHT.hidden = true
        BTN_MIDDLE_LEFT.hidden = true
        BTN_MIDDLEUP.hidden = true
        BTN_FRONT_POSITIVE.hidden = true
        BTN_FRONT_NEGATIVE.hidden = true
        BTN_FRONT_LEFT.hidden = true
        BTN_FRONT_RIGHT.hidden = true
        BTN_FRONT_UP.hidden = true
        BTN_FRONT_DOWN.hidden = true
        BTN_FRONT_MIDDLE_POSITIVE.hidden = true
        BTN_FRONT_MIDDLE_NEGATIVE.hidden = true
        
        SCENE.rootNode.addChildNode(ROTATE_NODE)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let RIGHT_CUBELETS = cubelets.filter { node in
            return abs(node.position.z - 1) < 0.001
        }
        RIGHT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        ROTATE_NODE.eulerAngles.z += Float(M_PI_2)
        
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            ROTATE_NODE.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_RIGHT_NEGATIVE.hidden = false
            self.BTN_UP_NEGATIVE.hidden = false
            self.BTN_DOWN_NEGATIVE.hidden = false
            self.BTN_LEFT_NEGATIVE.hidden = false
            self.BTN_RIGHT_POSITIVE.hidden = false
            self.BTN_UP_POSITIVE.hidden = false
            self.BTN_DOWN_POSITIVE.hidden = false
            self.BTN_LEFT_POSITIVE.hidden = false
            self.BTN_MIDDLE_DOWN.hidden = false
            self.BTN_MIDDLE_RIGHT.hidden = false
            self.BTN_MIDDLE_LEFT.hidden = false
            self.BTN_MIDDLEUP.hidden = false
            self.BTN_FRONT_POSITIVE.hidden = false
            self.BTN_FRONT_NEGATIVE.hidden = false
            self.BTN_FRONT_LEFT.hidden = false
            self.BTN_FRONT_RIGHT.hidden = false
            self.BTN_FRONT_UP.hidden = false
            self.BTN_FRONT_DOWN.hidden = false
            self.BTN_FRONT_MIDDLE_NEGATIVE.hidden = false
            self.BTN_FRONT_MIDDLE_POSITIVE.hidden = false
            
            ROTATE_NODE.removeFromParentNode()
        }
        SCNTransaction.commit()
        
        scnRubiksCube.scene = SCENE
    }
    
    ///
    /// Nom : turnFrontLeft
    /// Description : Cette fonction permet de tourner la ligne FrontLeft et de cacher les boutons pendant l'animation.
    ///
    func turnFrontLeft() {
        // create a temporary node for the rotation
        let ROTATE_NODE = SCNNode()
        
        BTN_RIGHT_NEGATIVE.hidden = true
        BTN_UP_NEGATIVE.hidden = true
        BTN_DOWN_NEGATIVE.hidden = true
        BTN_LEFT_NEGATIVE.hidden = true
        BTN_RIGHT_POSITIVE.hidden = true
        BTN_UP_POSITIVE.hidden = true
        BTN_DOWN_POSITIVE.hidden = true
        BTN_LEFT_POSITIVE.hidden = true
        BTN_MIDDLE_DOWN.hidden = true
        BTN_MIDDLE_RIGHT.hidden = true
        BTN_MIDDLE_LEFT.hidden = true
        BTN_MIDDLEUP.hidden = true
        BTN_FRONT_POSITIVE.hidden = true
        BTN_FRONT_NEGATIVE.hidden = true
        BTN_FRONT_LEFT.hidden = true
        BTN_FRONT_RIGHT.hidden = true
        BTN_FRONT_UP.hidden = true
        BTN_FRONT_DOWN.hidden = true
        BTN_FRONT_MIDDLE_POSITIVE.hidden = true
        BTN_FRONT_MIDDLE_NEGATIVE.hidden = true
        
        SCENE.rootNode.addChildNode(ROTATE_NODE)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let RIGHT_CUBELETS = cubelets.filter { node in
            return abs(node.position.y - 1) < 0.001
        }
        RIGHT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        let LEFT_CUBELETS = cubelets.filter { node in
            return abs(node.position.y + 1) < 0.001
        }
        LEFT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        let MIDDLE_CUBELETS = cubelets.filter { node in
            return abs(node.position.y) < 0.001
        }
        MIDDLE_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        ROTATE_NODE.eulerAngles.y += Float(M_PI_2)
        
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            ROTATE_NODE.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_RIGHT_NEGATIVE.hidden = false
            self.BTN_UP_NEGATIVE.hidden = false
            self.BTN_DOWN_NEGATIVE.hidden = false
            self.BTN_LEFT_NEGATIVE.hidden = false
            self.BTN_RIGHT_POSITIVE.hidden = false
            self.BTN_UP_POSITIVE.hidden = false
            self.BTN_DOWN_POSITIVE.hidden = false
            self.BTN_LEFT_POSITIVE.hidden = false
            self.BTN_MIDDLE_DOWN.hidden = false
            self.BTN_MIDDLE_RIGHT.hidden = false
            self.BTN_MIDDLE_LEFT.hidden = false
            self.BTN_MIDDLEUP.hidden = false
            self.BTN_FRONT_POSITIVE.hidden = false
            self.BTN_FRONT_NEGATIVE.hidden = false
            self.BTN_FRONT_LEFT.hidden = false
            self.BTN_FRONT_RIGHT.hidden = false
            self.BTN_FRONT_UP.hidden = false
            self.BTN_FRONT_DOWN.hidden = false
            self.BTN_FRONT_MIDDLE_NEGATIVE.hidden = false
            self.BTN_FRONT_MIDDLE_POSITIVE.hidden = false
            
            ROTATE_NODE.removeFromParentNode()
        }
        SCNTransaction.commit()
        
        scnRubiksCube.scene = SCENE
    }
    
    ///
    /// Nom : turnFrontRight
    /// Description : Cette fonction permet de tourner la ligne FrontRight et de cacher les boutons pendant l'animation.
    ///
    func turnFrontRight() {
        // create a temporary node for the rotation
        let ROTATE_NODE = SCNNode()
        
        BTN_RIGHT_NEGATIVE.hidden = true
        BTN_UP_NEGATIVE.hidden = true
        BTN_DOWN_NEGATIVE.hidden = true
        BTN_LEFT_NEGATIVE.hidden = true
        BTN_RIGHT_POSITIVE.hidden = true
        BTN_UP_POSITIVE.hidden = true
        BTN_DOWN_POSITIVE.hidden = true
        BTN_LEFT_POSITIVE.hidden = true
        BTN_MIDDLE_DOWN.hidden = true
        BTN_MIDDLE_RIGHT.hidden = true
        BTN_MIDDLE_LEFT.hidden = true
        BTN_MIDDLEUP.hidden = true
        BTN_FRONT_POSITIVE.hidden = true
        BTN_FRONT_NEGATIVE.hidden = true
        BTN_FRONT_LEFT.hidden = true
        BTN_FRONT_RIGHT.hidden = true
        BTN_FRONT_UP.hidden = true
        BTN_FRONT_DOWN.hidden = true
        BTN_FRONT_MIDDLE_POSITIVE.hidden = true
        BTN_FRONT_MIDDLE_NEGATIVE.hidden = true
        
        SCENE.rootNode.addChildNode(ROTATE_NODE)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let RIGHT_CUBELETS = cubelets.filter { node in
            return abs(node.position.y - 1) < 0.001
        }
        RIGHT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        let LEFT_CUBELETS = cubelets.filter { node in
            return abs(node.position.y + 1) < 0.001
        }
        LEFT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        let MIDDLE_CUBELETS = cubelets.filter { node in
            return abs(node.position.y) < 0.001
        }
        MIDDLE_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        ROTATE_NODE.eulerAngles.y -= Float(M_PI_2)
        
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            ROTATE_NODE.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_RIGHT_NEGATIVE.hidden = false
            self.BTN_UP_NEGATIVE.hidden = false
            self.BTN_DOWN_NEGATIVE.hidden = false
            self.BTN_LEFT_NEGATIVE.hidden = false
            self.BTN_RIGHT_POSITIVE.hidden = false
            self.BTN_UP_POSITIVE.hidden = false
            self.BTN_DOWN_POSITIVE.hidden = false
            self.BTN_LEFT_POSITIVE.hidden = false
            self.BTN_MIDDLE_DOWN.hidden = false
            self.BTN_MIDDLE_RIGHT.hidden = false
            self.BTN_MIDDLE_LEFT.hidden = false
            self.BTN_MIDDLEUP.hidden = false
            self.BTN_FRONT_POSITIVE.hidden = false
            self.BTN_FRONT_NEGATIVE.hidden = false
            self.BTN_FRONT_LEFT.hidden = false
            self.BTN_FRONT_RIGHT.hidden = false
            self.BTN_FRONT_UP.hidden = false
            self.BTN_FRONT_DOWN.hidden = false
            self.BTN_FRONT_MIDDLE_NEGATIVE.hidden = false
            self.BTN_FRONT_MIDDLE_POSITIVE.hidden = false
            
            ROTATE_NODE.removeFromParentNode()
        }
        SCNTransaction.commit()
        
        scnRubiksCube.scene = SCENE
    }
    
    ///
    /// Nom : turnFrontUp
    /// Description : Cette fonction permet de tourner la ligne FrontUp et de cacher les boutons pendant l'animation.
    ///
    func turnFrontUp() {
        // create a temporary node for the rotation
        let ROTATE_NODE = SCNNode()
        
        BTN_RIGHT_NEGATIVE.hidden = true
        BTN_UP_NEGATIVE.hidden = true
        BTN_DOWN_NEGATIVE.hidden = true
        BTN_LEFT_NEGATIVE.hidden = true
        BTN_RIGHT_POSITIVE.hidden = true
        BTN_UP_POSITIVE.hidden = true
        BTN_DOWN_POSITIVE.hidden = true
        BTN_LEFT_POSITIVE.hidden = true
        BTN_MIDDLE_DOWN.hidden = true
        BTN_MIDDLE_RIGHT.hidden = true
        BTN_MIDDLE_LEFT.hidden = true
        BTN_MIDDLEUP.hidden = true
        BTN_FRONT_POSITIVE.hidden = true
        BTN_FRONT_NEGATIVE.hidden = true
        BTN_FRONT_LEFT.hidden = true
        BTN_FRONT_RIGHT.hidden = true
        BTN_FRONT_UP.hidden = true
        BTN_FRONT_DOWN.hidden = true
        BTN_FRONT_MIDDLE_POSITIVE.hidden = true
        BTN_FRONT_MIDDLE_NEGATIVE.hidden = true
        
        SCENE.rootNode.addChildNode(ROTATE_NODE)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let RIGHT_CUBELETS = cubelets.filter { node in
            return abs(node.position.x - 1) < 0.001
        }
        RIGHT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        let LEFT_CUBELETS = cubelets.filter { node in
            return abs(node.position.x + 1) < 0.001
        }
        LEFT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        let MIDDLE_CUBELETS = cubelets.filter { node in
            return abs(node.position.x) < 0.001
        }
        MIDDLE_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        ROTATE_NODE.eulerAngles.x += Float(M_PI_2)
        
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            ROTATE_NODE.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_RIGHT_NEGATIVE.hidden = false
            self.BTN_UP_NEGATIVE.hidden = false
            self.BTN_DOWN_NEGATIVE.hidden = false
            self.BTN_LEFT_NEGATIVE.hidden = false
            self.BTN_RIGHT_POSITIVE.hidden = false
            self.BTN_UP_POSITIVE.hidden = false
            self.BTN_DOWN_POSITIVE.hidden = false
            self.BTN_LEFT_POSITIVE.hidden = false
            self.BTN_MIDDLE_DOWN.hidden = false
            self.BTN_MIDDLE_RIGHT.hidden = false
            self.BTN_MIDDLE_LEFT.hidden = false
            self.BTN_MIDDLEUP.hidden = false
            self.BTN_FRONT_POSITIVE.hidden = false
            self.BTN_FRONT_NEGATIVE.hidden = false
            self.BTN_FRONT_LEFT.hidden = false
            self.BTN_FRONT_RIGHT.hidden = false
            self.BTN_FRONT_UP.hidden = false
            self.BTN_FRONT_DOWN.hidden = false
            self.BTN_FRONT_MIDDLE_NEGATIVE.hidden = false
            self.BTN_FRONT_MIDDLE_POSITIVE.hidden = false
            
            ROTATE_NODE.removeFromParentNode()
        }
        SCNTransaction.commit()
        
        scnRubiksCube.scene = SCENE
    }
    
    ///
    /// Nom : turnFrontDown
    /// Description : Cette fonction permet de tourner la ligne FrontDown et de cacher les boutons pendant l'animation.
    ///
    func turnFrontDown() {
        // create a temporary node for the rotation
        let ROTATE_NODE = SCNNode()
        
        BTN_RIGHT_NEGATIVE.hidden = true
        BTN_UP_NEGATIVE.hidden = true
        BTN_DOWN_NEGATIVE.hidden = true
        BTN_LEFT_NEGATIVE.hidden = true
        BTN_RIGHT_POSITIVE.hidden = true
        BTN_UP_POSITIVE.hidden = true
        BTN_DOWN_POSITIVE.hidden = true
        BTN_LEFT_POSITIVE.hidden = true
        BTN_MIDDLE_DOWN.hidden = true
        BTN_MIDDLE_RIGHT.hidden = true
        BTN_MIDDLE_LEFT.hidden = true
        BTN_MIDDLEUP.hidden = true
        BTN_FRONT_POSITIVE.hidden = true
        BTN_FRONT_NEGATIVE.hidden = true
        BTN_FRONT_LEFT.hidden = true
        BTN_FRONT_RIGHT.hidden = true
        BTN_FRONT_UP.hidden = true
        BTN_FRONT_DOWN.hidden = true
        BTN_FRONT_MIDDLE_POSITIVE.hidden = true
        BTN_FRONT_MIDDLE_NEGATIVE.hidden = true
        
        SCENE.rootNode.addChildNode(ROTATE_NODE)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let RIGHT_CUBELETS = cubelets.filter { node in
            return abs(node.position.x - 1) < 0.001
        }
        RIGHT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        let LEFT_CUBELETS = cubelets.filter { node in
            return abs(node.position.x + 1) < 0.001
        }
        LEFT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        let MIDDLE_CUBELETS = cubelets.filter { node in
            return abs(node.position.x) < 0.001
        }
        MIDDLE_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        ROTATE_NODE.eulerAngles.x -= Float(M_PI_2)
        
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            ROTATE_NODE.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_RIGHT_NEGATIVE.hidden = false
            self.BTN_UP_NEGATIVE.hidden = false
            self.BTN_DOWN_NEGATIVE.hidden = false
            self.BTN_LEFT_NEGATIVE.hidden = false
            self.BTN_RIGHT_POSITIVE.hidden = false
            self.BTN_UP_POSITIVE.hidden = false
            self.BTN_DOWN_POSITIVE.hidden = false
            self.BTN_LEFT_POSITIVE.hidden = false
            self.BTN_MIDDLE_DOWN.hidden = false
            self.BTN_MIDDLE_RIGHT.hidden = false
            self.BTN_MIDDLE_LEFT.hidden = false
            self.BTN_MIDDLEUP.hidden = false
            self.BTN_FRONT_POSITIVE.hidden = false
            self.BTN_FRONT_NEGATIVE.hidden = false
            self.BTN_FRONT_LEFT.hidden = false
            self.BTN_FRONT_RIGHT.hidden = false
            self.BTN_FRONT_UP.hidden = false
            self.BTN_FRONT_DOWN.hidden = false
            self.BTN_FRONT_MIDDLE_NEGATIVE.hidden = false
            self.BTN_FRONT_MIDDLE_POSITIVE.hidden = false
            
            ROTATE_NODE.removeFromParentNode()
        }
        SCNTransaction.commit()
        
        scnRubiksCube.scene = SCENE
    }
    
    ///
    /// Nom : turnFrontMiddlePositive
    /// Description : Cette fonction permet de tourner la ligne FrontMiddlePositive et de cacher les boutons pendant l'animation.
    ///
    func turnFrontMiddlePositive() {
        // create a temporary node for the rotation
        let ROTATE_NODE = SCNNode()
        
        BTN_RIGHT_NEGATIVE.hidden = true
        BTN_UP_NEGATIVE.hidden = true
        BTN_DOWN_NEGATIVE.hidden = true
        BTN_LEFT_NEGATIVE.hidden = true
        BTN_RIGHT_POSITIVE.hidden = true
        BTN_UP_POSITIVE.hidden = true
        BTN_DOWN_POSITIVE.hidden = true
        BTN_LEFT_POSITIVE.hidden = true
        BTN_MIDDLE_DOWN.hidden = true
        BTN_MIDDLE_RIGHT.hidden = true
        BTN_MIDDLE_LEFT.hidden = true
        BTN_MIDDLEUP.hidden = true
        BTN_FRONT_POSITIVE.hidden = true
        BTN_FRONT_NEGATIVE.hidden = true
        BTN_FRONT_LEFT.hidden = true
        BTN_FRONT_RIGHT.hidden = true
        BTN_FRONT_UP.hidden = true
        BTN_FRONT_DOWN.hidden = true
        BTN_FRONT_MIDDLE_POSITIVE.hidden = true
        BTN_FRONT_MIDDLE_NEGATIVE.hidden = true
        
        SCENE.rootNode.addChildNode(ROTATE_NODE)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let RIGHT_CUBELETS = cubelets.filter { node in
            return abs(node.position.z) < 0.001
        }
        RIGHT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        ROTATE_NODE.eulerAngles.z += Float(M_PI_2)
        
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            ROTATE_NODE.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_RIGHT_NEGATIVE.hidden = false
            self.BTN_UP_NEGATIVE.hidden = false
            self.BTN_DOWN_NEGATIVE.hidden = false
            self.BTN_LEFT_NEGATIVE.hidden = false
            self.BTN_RIGHT_POSITIVE.hidden = false
            self.BTN_UP_POSITIVE.hidden = false
            self.BTN_DOWN_POSITIVE.hidden = false
            self.BTN_LEFT_POSITIVE.hidden = false
            self.BTN_MIDDLE_DOWN.hidden = false
            self.BTN_MIDDLE_RIGHT.hidden = false
            self.BTN_MIDDLE_LEFT.hidden = false
            self.BTN_MIDDLEUP.hidden = false
            self.BTN_FRONT_POSITIVE.hidden = false
            self.BTN_FRONT_NEGATIVE.hidden = false
            self.BTN_FRONT_LEFT.hidden = false
            self.BTN_FRONT_RIGHT.hidden = false
            self.BTN_FRONT_UP.hidden = false
            self.BTN_FRONT_DOWN.hidden = false
            self.BTN_FRONT_MIDDLE_NEGATIVE.hidden = false
            self.BTN_FRONT_MIDDLE_POSITIVE.hidden = false
            
            ROTATE_NODE.removeFromParentNode()
        }
        SCNTransaction.commit()
        
        scnRubiksCube.scene = SCENE
    }
    
    ///
    /// Nom : turnFrontMiddleNegative
    /// Description : Cette fonction permet de tourner la ligne FrontMiddleNegative et de cacher les boutons pendant l'animation.
    ///
    func turnFrontMiddleNegative() {
        // create a temporary node for the rotation
        let ROTATE_NODE = SCNNode()
        
        BTN_RIGHT_NEGATIVE.hidden = true
        BTN_UP_NEGATIVE.hidden = true
        BTN_DOWN_NEGATIVE.hidden = true
        BTN_LEFT_NEGATIVE.hidden = true
        BTN_RIGHT_POSITIVE.hidden = true
        BTN_UP_POSITIVE.hidden = true
        BTN_DOWN_POSITIVE.hidden = true
        BTN_LEFT_POSITIVE.hidden = true
        BTN_MIDDLE_DOWN.hidden = true
        BTN_MIDDLE_RIGHT.hidden = true
        BTN_MIDDLE_LEFT.hidden = true
        BTN_MIDDLEUP.hidden = true
        BTN_FRONT_POSITIVE.hidden = true
        BTN_FRONT_NEGATIVE.hidden = true
        BTN_FRONT_LEFT.hidden = true
        BTN_FRONT_RIGHT.hidden = true
        BTN_FRONT_UP.hidden = true
        BTN_FRONT_DOWN.hidden = true
        BTN_FRONT_MIDDLE_POSITIVE.hidden = true
        BTN_FRONT_MIDDLE_NEGATIVE.hidden = true
        
        SCENE.rootNode.addChildNode(ROTATE_NODE)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let RIGHT_CUBELETS = cubelets.filter { node in
            return abs(node.position.z) < 0.001
        }
        RIGHT_CUBELETS.map { ROTATE_NODE.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        ROTATE_NODE.eulerAngles.z -= Float(M_PI_2)
        
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            ROTATE_NODE.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_RIGHT_NEGATIVE.hidden = false
            self.BTN_UP_NEGATIVE.hidden = false
            self.BTN_DOWN_NEGATIVE.hidden = false
            self.BTN_LEFT_NEGATIVE.hidden = false
            self.BTN_RIGHT_POSITIVE.hidden = false
            self.BTN_UP_POSITIVE.hidden = false
            self.BTN_DOWN_POSITIVE.hidden = false
            self.BTN_LEFT_POSITIVE.hidden = false
            self.BTN_MIDDLE_DOWN.hidden = false
            self.BTN_MIDDLE_RIGHT.hidden = false
            self.BTN_MIDDLE_LEFT.hidden = false
            self.BTN_MIDDLEUP.hidden = false
            self.BTN_FRONT_POSITIVE.hidden = false
            self.BTN_FRONT_NEGATIVE.hidden = false
            self.BTN_FRONT_LEFT.hidden = false
            self.BTN_FRONT_RIGHT.hidden = false
            self.BTN_FRONT_UP.hidden = false
            self.BTN_FRONT_DOWN.hidden = false
            self.BTN_FRONT_MIDDLE_NEGATIVE.hidden = false
            self.BTN_FRONT_MIDDLE_POSITIVE.hidden = false
            
            ROTATE_NODE.removeFromParentNode()
        }
        SCNTransaction.commit()
        
        scnRubiksCube.scene = SCENE
    }
    
    ///
    /// Nom : addCamera
    /// Description : Cette fonction permet de tourner la ligne FrontNegative et de cacher les boutons pendant l'animation.
    ///
    func addCamera() {
        // 1
        let SCENE = SCNScene()
        
        CAMERA_NODE.camera = SCNCamera()
        CAMERA_NODE.position = SCNVector3Make(100, 100, 100)
        CAMERA_NODE.rotation = SCNVector4Make(0, 0, 1, CFloat( -M_PI_4 ) * 2 )
        CAMERA_NODE.eulerAngles.x = Float(-M_PI)
        CAMERA_NODE.eulerAngles.y = Float(-2 * -M_PI)
        
        SCENE.rootNode.addChildNode(CAMERA_NODE)
        
        let PAN_RECOGNIZER = UIPanGestureRecognizer(target: self, action: "panGesture:")
        
        scnRubiksCube.addGestureRecognizer(PAN_RECOGNIZER)
        
        // 3
        scnRubiksCube.scene = SCENE
    }
    
    ///
    /// Nom : panGesture
    /// Description : Cette fonction permet à l'utilisateur d'avoir une gestion des mouvements avec le tactile
    /// Paramètre : sender : UIPanGestureRecognizer
    ///
    func panGesture(sender : UIPanGestureRecognizer) {
        let TRANSLATION = sender.translationInView(sender.view!)
        
        var newAngle = (Float)(TRANSLATION.x)*(Float)(M_PI)/180.0
        
        newAngle += currentAngle
        
        GEOMETRY_NODE.transform = SCNMatrix4MakeRotation(newAngle, 0, 1, 0)
        
        if(sender.state == UIGestureRecognizerState.Ended) {
            currentAngle = newAngle
        }
    }

    ///
    /// Nom : changeMaterialWithColor
    /// Description : Cette fonction permet la gestion des couleurs des mini cubes du Rubik's cube
    /// Paramètre : color : UIColor
    /// Retour : mat
    ///
    func changeMaterialWithColor(picture : String) -> SCNMaterial {
        let MAT = SCNMaterial()
        
        MAT.diffuse.contents = picture
        return MAT
    }
}

