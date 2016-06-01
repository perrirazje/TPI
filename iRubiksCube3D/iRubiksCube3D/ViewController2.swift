//
//  ViewController.swift
//  iRubiksCube3D
//
//  Created by Jérémy Perriraz on 26.05.16.
//  Copyright © 2016 perrirazje. All rights reserved.
//

import UIKit
import SceneKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var scn_rubiksCube: SCNView!
    
    // MARK: Properties
    
    @IBOutlet weak var NameButton: UIButton!
    @IBOutlet weak var CancelButtomn: UIButton!
    
    // UI
    @IBOutlet weak var geometryLabel: UILabel!
    @IBOutlet weak var sceneView: SCNView!
    @IBOutlet weak var View1: SCNView!
    
    
    @IBOutlet var View4: UIView!
    
    let cameraNode = SCNNode()
    var counter = 0
    let spin = CABasicAnimation(keyPath: "rotation")
    var timer = NSTimer()
    
    let PyraNode1 = SCNNode()
    
    
    // Geometry
    var geometryNode: SCNNode = SCNNode()
    
    // Gestures
    var currentAngle: Float = 0.0
    
    var tabColor: [String] = ["orange", "orange", "orange", "orange", "orange", "orange", "orange", "orange", "orange",
                              "jaune", "jaune", "jaune", "bleu", "bleu", "bleu", "blanc", "blanc", "blanc",
                              "vert", "vert", "vert", "jaune", "jaune", "jaune", "bleu", "bleu", "bleu",
                              "blanc", "blanc", "blanc", "vert", "vert", "vert", "jaune", "jaune", "jaune",
                              "bleu", "bleu", "bleu", "blanc", "blanc", "blanc", "vert", "vert", "vert",
                              "rouge", "rouge", "rouge", "rouge", "rouge", "rouge", "rouge", "rouge", "rouge",]
    
    /*
    
    orangeColor()
    redColor()
    greenColor()
    whiteColor()
    blueColor()
    yellowColor()
    
    */
    
    

    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        sceneSetup1()
        geometryNode = allPyra1()
        scn_rubiksCube.scene!.rootNode.addChildNode(geometryNode)
        sceneSetup2()
        
        let button   = UIButton(type: UIButtonType.System) as UIButton
        button.frame = CGRectMake(10, 200, 50, 25)
        button.backgroundColor = UIColor.blackColor()
        button.setTitle("Btn", forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
    }
    
    func buttonAction(sender:UIButton!)
    {
        print("Mélanger")
        
        // Use from-to to explicitly make a full rotation around z
        spin.fromValue = NSValue(SCNVector4: SCNVector4(x: 0, y: 1, z: 0, w: 0))
        spin.toValue = NSValue(SCNVector4: SCNVector4(x: 0, y: 1, z: 0, w: Float(2 * M_PI)))
        spin.duration = 1.0
        spin.speed = 1.0
        PyraNode1.addAnimation(spin, forKey: "spin around")
        
        
    }
    
    // MARK: Scene
    func sceneSetup1() {
        // 1
        let scene = SCNScene()
        
        
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 0, 30)
        cameraNode.rotation = SCNVector4Make(0, 0, 1, CFloat( -M_PI_4 ) * 2 )
        cameraNode.eulerAngles.x = Float(-M_PI)
        cameraNode.eulerAngles.y = Float(-2 * -M_PI)
        scene.rootNode.addChildNode(cameraNode)
        //self.view.userInteractionEnabled = false
        
        
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: "panGesture:")
        scn_rubiksCube.addGestureRecognizer(panRecognizer)
        
        // 3
        scn_rubiksCube.scene = scene
        
        scn_rubiksCube.allowsCameraControl = true
        
    }
    // MARK: Scene
    func sceneSetup2() {
        // 1
        let scene = SCNScene()
        
        
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 0, 30)
        cameraNode.rotation = SCNVector4Make(0, 0, 1, CFloat( -M_PI_4 ) * 2 )
        scene.rootNode.addChildNode(cameraNode)
        //self.view.userInteractionEnabled = false
        
        
        
        
        
    }
    
    
    func panGesture(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(sender.view!)
        var newAngle = (Float)(translation.x)*(Float)(M_PI)/180.0
        newAngle += currentAngle
        
        geometryNode.transform = SCNMatrix4MakeRotation(newAngle, 0, 1, 0)
        
        if(sender.state == UIGestureRecognizerState.Ended) {
            currentAngle = newAngle
        }
    }
    
    // MARK: IBActions
    @IBAction func segmentValueChanged(sender: UISegmentedControl) {
        // 1
        geometryNode.removeFromParentNode()
        currentAngle = 0.0
        
        geometryNode = allPyra1()
        
        
        
    }
    
    // MARK: Style
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    // MARK: Transition
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        scn_rubiksCube.stop(nil)
        scn_rubiksCube.play(nil)
    }
    
    func Cylinder() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.orangeColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    
    func Cylinder2() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.orangeColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    
    func Cylinder3() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.orangeColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    func Cylinder4() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.orangeColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    func Cylinder5() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.orangeColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    func Cylinder6() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.orangeColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    func Cylinder7() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.orangeColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    func Cylinder8() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.orangeColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    func Cylinder9() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.orangeColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    func Cylinder10() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.greenColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    
    func Cylinder11() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.yellowColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    
    func Cylinder12() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.blueColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    func Cylinder13() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.greenColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    func Cylinder14() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.blackColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    func Cylinder15() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.blueColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    func Cylinder16() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.greenColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    func Cylinder17() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.whiteColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    func Cylinder18() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.blueColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    func Cylinder19() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.redColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    
    func Cylinder20() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.redColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    
    func Cylinder21() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.redColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    func Cylinder22() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.redColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    func Cylinder23() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.redColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    func Cylinder24() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.redColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    func Cylinder25() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.redColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    func Cylinder26() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.redColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    func Cylinder27() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 2.0, height: 2.0, length: 2.0, chamferRadius: 0.5)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.redColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    
    func allPyra1() -> SCNNode {

        let PyramidNode = SCNNode(geometry: Cylinder())
        let PyramidNode2 = SCNNode(geometry: Cylinder2())
        let PyramidNode3 = SCNNode(geometry: Cylinder3())
        PyramidNode.position = SCNVector3Make(0, 2, 0)
        PyramidNode2.position = SCNVector3Make(0, 0, 0)
        PyramidNode3.position = SCNVector3Make(0, -2, 0)
        
        PyraNode1.addChildNode(PyramidNode)
        PyraNode1.addChildNode(PyramidNode2)
        PyraNode1.addChildNode(PyramidNode3)

        let PyramidNode4 = SCNNode(geometry: Cylinder4())
        let PyramidNode5 = SCNNode(geometry: Cylinder5())
        let PyramidNode6 = SCNNode(geometry: Cylinder6())
        PyramidNode4.position = SCNVector3Make(-2, 2, 0)
        PyramidNode5.position = SCNVector3Make(-2, 0, 0)
        PyramidNode6.position = SCNVector3Make(-2, -2, 0)
        
        PyraNode1.addChildNode(PyramidNode4)
        PyraNode1.addChildNode(PyramidNode5)
        PyraNode1.addChildNode(PyramidNode6)
        
        let PyramidNode7 = SCNNode(geometry: Cylinder7())
        let PyramidNode8 = SCNNode(geometry: Cylinder8())
        let PyramidNode9 = SCNNode(geometry: Cylinder9())
        PyramidNode7.position = SCNVector3Make(-4, 2, 0)
        PyramidNode8.position = SCNVector3Make(-4, 0, 0)
        PyramidNode9.position = SCNVector3Make(-4, -2, 0)
        
        PyraNode1.addChildNode(PyramidNode7)
        PyraNode1.addChildNode(PyramidNode8)
        PyraNode1.addChildNode(PyramidNode9)
        
        let PyramidNode10 = SCNNode(geometry: Cylinder10())
        let PyramidNode11 = SCNNode(geometry: Cylinder11())
        let PyramidNode12 = SCNNode(geometry: Cylinder12())
        PyramidNode10.position = SCNVector3Make(0, 2, -2)
        PyramidNode11.position = SCNVector3Make(0, 0, -2)
        PyramidNode12.position = SCNVector3Make(0, -2, -2)
        
        PyraNode1.addChildNode(PyramidNode10)
        PyraNode1.addChildNode(PyramidNode11)
        PyraNode1.addChildNode(PyramidNode12)
        
        let PyramidNode13 = SCNNode(geometry: Cylinder13())
        let PyramidNode14 = SCNNode(geometry: Cylinder14())
        let PyramidNode15 = SCNNode(geometry: Cylinder15())
        PyramidNode13.position = SCNVector3Make(-2, 2, -2)
        PyramidNode14.position = SCNVector3Make(-2, 0, -2)
        PyramidNode15.position = SCNVector3Make(-2, -2, -2)
        
        PyraNode1.addChildNode(PyramidNode13)
        PyraNode1.addChildNode(PyramidNode14)
        PyraNode1.addChildNode(PyramidNode15)
        
        let PyramidNode16 = SCNNode(geometry: Cylinder16())
        let PyramidNode17 = SCNNode(geometry: Cylinder17())
        let PyramidNode18 = SCNNode(geometry: Cylinder18())
        PyramidNode16.position = SCNVector3Make(-4, 2, -2)
        PyramidNode17.position = SCNVector3Make(-4, 0, -2)
        PyramidNode18.position = SCNVector3Make(-4, -2, -2)
        
        PyraNode1.addChildNode(PyramidNode16)
        PyraNode1.addChildNode(PyramidNode17)
        PyraNode1.addChildNode(PyramidNode18)
        
        let PyramidNode19 = SCNNode(geometry: Cylinder19())
        let PyramidNode20 = SCNNode(geometry: Cylinder20())
        let PyramidNode21 = SCNNode(geometry: Cylinder21())
        PyramidNode19.position = SCNVector3Make(0, 2, -4)
        PyramidNode20.position = SCNVector3Make(0, 0, -4)
        PyramidNode21.position = SCNVector3Make(0, -2, -4)
        
        PyraNode1.addChildNode(PyramidNode19)
        PyraNode1.addChildNode(PyramidNode20)
        PyraNode1.addChildNode(PyramidNode21)
        
        let PyramidNode22 = SCNNode(geometry: Cylinder22())
        let PyramidNode23 = SCNNode(geometry: Cylinder23())
        let PyramidNode24 = SCNNode(geometry: Cylinder24())
        PyramidNode22.position = SCNVector3Make(-2, 2, -4)
        PyramidNode23.position = SCNVector3Make(-2, 0, -4)
        PyramidNode24.position = SCNVector3Make(-2, -2, -4)
        
        PyraNode1.addChildNode(PyramidNode22)
        PyraNode1.addChildNode(PyramidNode23)
        PyraNode1.addChildNode(PyramidNode24)
        
        let PyramidNode25 = SCNNode(geometry: Cylinder25())
        let PyramidNode26 = SCNNode(geometry: Cylinder26())
        let PyramidNode27 = SCNNode(geometry: Cylinder27())
        PyramidNode25.position = SCNVector3Make(-4, 2, -4)
        PyramidNode26.position = SCNVector3Make(-4, 0, -4)
        PyramidNode27.position = SCNVector3Make(-4, -2, -4)
        
        PyraNode1.addChildNode(PyramidNode25)
        PyraNode1.addChildNode(PyramidNode26)
        PyraNode1.addChildNode(PyramidNode27)
        
        return PyraNode1
    }

    
}

