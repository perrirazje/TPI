//
//  ViewController.swift
//  iRubiksCube3D
//
//  Created by Jérémy Perriraz on 26.05.16.
//  Copyright © 2016 perrirazje. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    // Initialisation des boutons pour les utiliser plus loin
    @IBOutlet weak var btn_game: UIButton!
    @IBOutlet weak var btn_exit: UIButton!
    @IBOutlet weak var scn_rubiksCube: SCNView!
    @IBOutlet var scn_menu: UIView!
    @IBOutlet var scn_menuRubiks: UIView!

    // Lors du clique du bouton, la vue du Rubik's cube se lance
    @IBAction func btn_gameTouch(sender: AnyObject) {

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
        func viewDidAppear(animated: Bool) {
            super.viewDidAppear(animated)
        sceneSetup1()
        }
    }
    
    // lors du clique du bouton, l'application se ferme
    @IBAction func btn_exitTouch(sender: AnyObject) {
        exit(0)
    }
    
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
    

    
    // MARK: Scene

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
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        geometryNode = allPyra1()
        scn_rubiksCube.scene!.rootNode.addChildNode(geometryNode)
        sceneSetup2()
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
        let Cylinder = SCNCylinder(radius: 2.5, height: 5.0)
        
        // 2
        Cylinder.firstMaterial!.diffuse.contents = UIColor.darkGrayColor()
        
        // 3
        Cylinder.firstMaterial!.specular.contents = UIColor.whiteColor()
        
        // 4
        return Cylinder
    }
    
    func allPyra1() -> SCNNode {
        
        let PyramidNode = SCNNode(geometry: Cylinder())
        PyramidNode.position = SCNVector3Make(0, 10, 0)
        
        
        
        
        
        PyraNode1.addChildNode(PyramidNode)
        
        // Add texture 1
        PyramidNode.geometry?.firstMaterial!.diffuse.contents="/Users/perrirazje/Downloads/Swift.png"
        
        
        return PyraNode1
    }
    
}

