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
        let Cylinder = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.blackColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    
    func Cylinder2() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.redColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    
    func Cylinder3() -> SCNGeometry {
        // 1
        let Cylinder = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.blueColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    
    func allPyra1() -> SCNNode {
        
        let PyramidNode = SCNNode(geometry: Cylinder())
        let PyramidNode2 = SCNNode(geometry: Cylinder2())
        let PyramidNode3 = SCNNode(geometry: Cylinder3())
        PyramidNode.position = SCNVector3Make(0, 0, 0)
        PyramidNode2.position = SCNVector3Make(0, 1, 0)
        PyramidNode3.position = SCNVector3Make(0, -1, 0)
        
        PyraNode1.addChildNode(PyramidNode)
        PyraNode1.addChildNode(PyramidNode2)
        PyraNode1.addChildNode(PyramidNode3)

        let PyramidNode5 = SCNNode(geometry: Cylinder())
        let PyramidNode6 = SCNNode(geometry: Cylinder2())
        let PyramidNode4 = SCNNode(geometry: Cylinder3())
        PyramidNode4.position = SCNVector3Make(1, 0, 0)
        PyramidNode5.position = SCNVector3Make(1, 1, 0)
        PyramidNode6.position = SCNVector3Make(1, -1, 0)
        
        PyraNode1.addChildNode(PyramidNode4)
        PyraNode1.addChildNode(PyramidNode5)
        PyraNode1.addChildNode(PyramidNode6)
        
        let PyramidNode9 = SCNNode(geometry: Cylinder())
        let PyramidNode7 = SCNNode(geometry: Cylinder2())
        let PyramidNode8 = SCNNode(geometry: Cylinder3())
        PyramidNode7.position = SCNVector3Make(2, 0, 0)
        PyramidNode8.position = SCNVector3Make(2, 1, 0)
        PyramidNode9.position = SCNVector3Make(2, -1, 0)
        
        PyraNode1.addChildNode(PyramidNode7)
        PyraNode1.addChildNode(PyramidNode8)
        PyraNode1.addChildNode(PyramidNode9)
        
        let PyramidNode12 = SCNNode(geometry: Cylinder())
        let PyramidNode13 = SCNNode(geometry: Cylinder2())
        let PyramidNode11 = SCNNode(geometry: Cylinder3())
        PyramidNode11.position = SCNVector3Make(0, 0, 1)
        PyramidNode12.position = SCNVector3Make(0, 1, 1)
        PyramidNode13.position = SCNVector3Make(0, -1, 1)
        
        PyraNode1.addChildNode(PyramidNode11)
        PyraNode1.addChildNode(PyramidNode12)
        PyraNode1.addChildNode(PyramidNode13)
        
        let PyramidNode16 = SCNNode(geometry: Cylinder())
        let PyramidNode14 = SCNNode(geometry: Cylinder2())
        let PyramidNode15 = SCNNode(geometry: Cylinder3())
        PyramidNode14.position = SCNVector3Make(1, 0, 1)
        PyramidNode15.position = SCNVector3Make(1, 1, 1)
        PyramidNode16.position = SCNVector3Make(1, -1, 1)
        
        PyraNode1.addChildNode(PyramidNode14)
        PyraNode1.addChildNode(PyramidNode15)
        PyraNode1.addChildNode(PyramidNode16)
        
        let PyramidNode17 = SCNNode(geometry: Cylinder())
        let PyramidNode18 = SCNNode(geometry: Cylinder2())
        let PyramidNode19 = SCNNode(geometry: Cylinder3())
        PyramidNode17.position = SCNVector3Make(2, 0, 1)
        PyramidNode18.position = SCNVector3Make(2, 1, 1)
        PyramidNode19.position = SCNVector3Make(2, -1, 1)
        
        PyraNode1.addChildNode(PyramidNode17)
        PyraNode1.addChildNode(PyramidNode18)
        PyraNode1.addChildNode(PyramidNode19)
        
        let PyramidNode21 = SCNNode(geometry: Cylinder())
        let PyramidNode22 = SCNNode(geometry: Cylinder2())
        let PyramidNode23 = SCNNode(geometry: Cylinder3())
        PyramidNode21.position = SCNVector3Make(0, 0, 2)
        PyramidNode22.position = SCNVector3Make(0, 1, 2)
        PyramidNode23.position = SCNVector3Make(0, -1, 2)
        
        PyraNode1.addChildNode(PyramidNode21)
        PyraNode1.addChildNode(PyramidNode22)
        PyraNode1.addChildNode(PyramidNode23)
        
        let PyramidNode25 = SCNNode(geometry: Cylinder())
        let PyramidNode26 = SCNNode(geometry: Cylinder2())
        let PyramidNode24 = SCNNode(geometry: Cylinder3())
        PyramidNode24.position = SCNVector3Make(1, 0, 2)
        PyramidNode25.position = SCNVector3Make(1, 1, 2)
        PyramidNode26.position = SCNVector3Make(1, -1, 2)
        
        PyraNode1.addChildNode(PyramidNode24)
        PyraNode1.addChildNode(PyramidNode25)
        PyraNode1.addChildNode(PyramidNode26)
        
        let PyramidNode29 = SCNNode(geometry: Cylinder())
        let PyramidNode27 = SCNNode(geometry: Cylinder2())
        let PyramidNode28 = SCNNode(geometry: Cylinder3())
        PyramidNode27.position = SCNVector3Make(2, 0, 2)
        PyramidNode28.position = SCNVector3Make(2, 1, 2)
        PyramidNode29.position = SCNVector3Make(2, -1, 2)
        
        PyraNode1.addChildNode(PyramidNode27)
        PyraNode1.addChildNode(PyramidNode28)
        PyraNode1.addChildNode(PyramidNode29)
        
        return PyraNode1
    }

    
}

