///
/// ETML
/// Auteur : Jérémy Perriraz
/// Date : 19.05.2016
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
    let ARRAYS_MOVEMENTS = ["DPositif", "GNegatif", "DNegatif", "GPositif", "MHaut"   , "MBas"    , "HNegatif",
                            "HPositif", "MDroite" , "MGauche" , "BPositif", "BNegatif", "FPositif", "FNegatif"]
    let GEOMETRY_NODE : SCNNode = SCNNode()
    let BTN_DNEGATIF   = UIButton(type: UIButtonType.System) as UIButton
    let btn_DPositif   = UIButton(type: UIButtonType.System) as UIButton
    let btn_GPositif   = UIButton(type: UIButtonType.System) as UIButton
    let btn_GNegatif   = UIButton(type: UIButtonType.System) as UIButton
    let btn_MHaut   = UIButton(type: UIButtonType.System) as UIButton
    let btn_MBas   = UIButton(type: UIButtonType.System) as UIButton
    let btn_HNegatif   = UIButton(type: UIButtonType.System) as UIButton
    let btn_HPositif   = UIButton(type: UIButtonType.System) as UIButton
    let btn_BPositif   = UIButton(type: UIButtonType.System) as UIButton
    let btn_BNegatif   = UIButton(type: UIButtonType.System) as UIButton
    let btn_MDroite   = UIButton(type: UIButtonType.System) as UIButton
    let btn_MGauche   = UIButton(type: UIButtonType.System) as UIButton
    let btn_FPositif   = UIButton(type: UIButtonType.System) as UIButton
    let btn_FNegatif   = UIButton(type: UIButtonType.System) as UIButton
    
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
    // create and arrange a 3x3x3 array of cubelets
    var cubelets: [SCNNode] = []
    

    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        sceneSetup1()
        //geometryNode = allPyra1()
        scnRubiksCube.scene!.rootNode.addChildNode(GEOMETRY_NODE)
        sceneSetup2()
        
        
        
        for x in -1...1 {
            for y in -1...1 {
                for z in -1...1 {
                    let box = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.1)
                    box.materials = [
                        materialWithColor(UIColor.greenColor()),
                        materialWithColor(UIColor.redColor()),
                        materialWithColor(UIColor.blueColor()),
                        materialWithColor(UIColor.orangeColor()),
                        materialWithColor(UIColor.whiteColor()),
                        materialWithColor(UIColor.yellowColor()),
                    ]
                    
                    let node = SCNNode(geometry: box)
                    node.position = SCNVector3(x: Float(x), y: Float(y), z: Float(z))
                    
                    /////
                    //////////node.geometry?.firstMaterial!.diffuse.contents = "/Users/perrirazje/Downloads/cube.png"
                    /////
                    SCENE.rootNode.addChildNode(node)
                    cubelets += [node]
                }
            }
        }
        rnd_RubiksCube()
        
        runAfterDelay(1.1) {
            self.rnd_RubiksCube()
        }
        
        runAfterDelay(2.2) {
            self.rnd_RubiksCube()
        }
        
        runAfterDelay(3.3) {
            self.rnd_RubiksCube()
        }
        
        runAfterDelay(4.4) {
            self.rnd_RubiksCube()
        }
        
        runAfterDelay(5.5) {
            self.rnd_RubiksCube()
        }
        
        runAfterDelay(6.6) {
            self.rnd_RubiksCube()
        }
        
        runAfterDelay(7.7) {
            self.rnd_RubiksCube()
        }
        
        runAfterDelay(8.8) {
            self.rnd_RubiksCube()
        }
        
        runAfterDelay(9.9) {
            self.rnd_RubiksCube()
        }
        
        scnRubiksCube.scene = SCENE
        scnRubiksCube.allowsCameraControl = true
        
        
        BTN_DNEGATIF.frame = CGRectMake(225, 420, 25, 25)
        BTN_DNEGATIF.backgroundColor = UIColor.clearColor()
        BTN_DNEGATIF.layer.borderWidth = 1.0
        BTN_DNEGATIF.layer.borderColor = UIColor.blackColor().CGColor
        BTN_DNEGATIF.layer.cornerRadius = 5.0
        BTN_DNEGATIF.setTitle("D-", forState: UIControlState.Normal)
        BTN_DNEGATIF.addTarget(self, action: "btn_DNegatif:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(BTN_DNEGATIF)
        

        btn_DPositif.frame = CGRectMake(225, 140, 25, 25)
        btn_DPositif.backgroundColor = UIColor.clearColor()
        btn_DPositif.layer.borderWidth = 1.0
        btn_DPositif.layer.borderColor = UIColor.blackColor().CGColor
        btn_DPositif.layer.cornerRadius = 5.0
        btn_DPositif.setTitle("D+", forState: UIControlState.Normal)
        btn_DPositif.addTarget(self, action: "btn_DPositif:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(btn_DPositif)
        
        
        btn_GPositif.frame = CGRectMake(60, 420, 25, 25)
        btn_GPositif.backgroundColor = UIColor.clearColor()
        btn_GPositif.layer.borderWidth = 1.0
        btn_GPositif.layer.borderColor = UIColor.blackColor().CGColor
        btn_GPositif.layer.cornerRadius = 5.0
        btn_GPositif.setTitle("G+", forState: UIControlState.Normal)
        btn_GPositif.addTarget(self, action: "btn_GPositif:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(btn_GPositif)
        
        
        btn_GNegatif.frame = CGRectMake(60, 140, 25, 25)
        btn_GNegatif.backgroundColor = UIColor.clearColor()
        btn_GNegatif.layer.borderWidth = 1.0
        btn_GNegatif.layer.borderColor = UIColor.blackColor().CGColor
        btn_GNegatif.layer.cornerRadius = 5.0
        btn_GNegatif.setTitle("G-", forState: UIControlState.Normal)
        btn_GNegatif.addTarget(self, action: "btn_GNegatif:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(btn_GNegatif)
        
        
        btn_MHaut.frame = CGRectMake(140, 140, 25, 25)
        btn_MHaut.backgroundColor = UIColor.clearColor()
        btn_MHaut.layer.borderWidth = 1.0
        btn_MHaut.layer.borderColor = UIColor.blackColor().CGColor
        btn_MHaut.layer.cornerRadius = 5.0
        btn_MHaut.setTitle("MH", forState: UIControlState.Normal)
        btn_MHaut.addTarget(self, action: "btn_MHaut:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(btn_MHaut)
        
        
        btn_MBas.frame = CGRectMake(140, 420, 25, 25)
        btn_MBas.backgroundColor = UIColor.clearColor()
        btn_MBas.layer.borderWidth = 1.0
        btn_MBas.layer.borderColor = UIColor.blackColor().CGColor
        btn_MBas.layer.cornerRadius = 5.0
        btn_MBas.setTitle("MB", forState: UIControlState.Normal)
        btn_MBas.addTarget(self, action: "btn_MBas:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(btn_MBas)
        
        
        btn_HNegatif.frame = CGRectMake(285, 200, 25, 25)
        btn_HNegatif.backgroundColor = UIColor.clearColor()
        btn_HNegatif.layer.borderWidth = 1.0
        btn_HNegatif.layer.borderColor = UIColor.blackColor().CGColor
        btn_HNegatif.layer.cornerRadius = 5.0
        btn_HNegatif.setTitle("H-", forState: UIControlState.Normal)
        btn_HNegatif.addTarget(self, action: "btn_HNegatif:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(btn_HNegatif)
        
        
        btn_HPositif.frame = CGRectMake(10, 200, 25, 25)
        btn_HPositif.backgroundColor = UIColor.clearColor()
        btn_HPositif.layer.borderWidth = 1.0
        btn_HPositif.layer.borderColor = UIColor.blackColor().CGColor
        btn_HPositif.layer.cornerRadius = 5.0
        btn_HPositif.setTitle("H+", forState: UIControlState.Normal)
        btn_HPositif.addTarget(self, action: "btn_HPositif:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(btn_HPositif)
        
        
        btn_BPositif.frame = CGRectMake(285, 360, 25, 25)
        btn_BPositif.backgroundColor = UIColor.clearColor()
        btn_BPositif.layer.borderWidth = 1.0
        btn_BPositif.layer.borderColor = UIColor.blackColor().CGColor
        btn_BPositif.layer.cornerRadius = 5.0
        btn_BPositif.setTitle("B+", forState: UIControlState.Normal)
        btn_BPositif.addTarget(self, action: "btn_BPositif:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(btn_BPositif)
        
        
        btn_BNegatif.frame = CGRectMake(10, 360, 25, 25)
        btn_BNegatif.backgroundColor = UIColor.clearColor()
        btn_BNegatif.layer.borderWidth = 1.0
        btn_BNegatif.layer.borderColor = UIColor.blackColor().CGColor
        btn_BNegatif.layer.cornerRadius = 5.0
        btn_BNegatif.setTitle("B-", forState: UIControlState.Normal)
        btn_BNegatif.addTarget(self, action: "btn_BNegatif:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(btn_BNegatif)
        
        
        btn_MDroite.frame = CGRectMake(285, 280, 25, 25)
        btn_MDroite.backgroundColor = UIColor.clearColor()
        btn_MDroite.layer.borderWidth = 1.0
        btn_MDroite.layer.borderColor = UIColor.blackColor().CGColor
        btn_MDroite.layer.cornerRadius = 5.0
        btn_MDroite.setTitle("MD", forState: UIControlState.Normal)
        btn_MDroite.addTarget(self, action: "btn_MDroite:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(btn_MDroite)
        
        
        btn_MGauche.frame = CGRectMake(10, 280, 25, 25)
        btn_MGauche.backgroundColor = UIColor.clearColor()
        btn_MGauche.layer.borderWidth = 1.0
        btn_MGauche.layer.borderColor = UIColor.blackColor().CGColor
        btn_MGauche.layer.cornerRadius = 5.0
        btn_MGauche.setTitle("MG", forState: UIControlState.Normal)
        btn_MGauche.addTarget(self, action: "btn_MGauche:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(btn_MGauche)
        
        btn_FPositif.frame = CGRectMake(160, 280, 25, 25)
        btn_FPositif.backgroundColor = UIColor.clearColor()
        btn_FPositif.layer.borderWidth = 1.0
        btn_FPositif.layer.borderColor = UIColor.blackColor().CGColor
        btn_FPositif.layer.cornerRadius = 5.0
        btn_FPositif.setTitle("F+", forState: UIControlState.Normal)
        btn_FPositif.addTarget(self, action: "btn_FPositif:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(btn_FPositif)
        
        
        btn_FNegatif.frame = CGRectMake(130, 280, 25, 25)
        btn_FNegatif.backgroundColor = UIColor.clearColor()
        btn_FNegatif.layer.borderWidth = 1.0
        btn_FNegatif.layer.borderColor = UIColor.blackColor().CGColor
        btn_FNegatif.layer.cornerRadius = 5.0
        btn_FNegatif.setTitle("F-", forState: UIControlState.Normal)
        btn_FNegatif.addTarget(self, action: "btn_FNegatif:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(btn_FNegatif)
    }
    
    func btn_DNegatif(sender:UIButton!)
    {
        DNegatif()
    }
    func btn_DPositif(sender:UIButton!)
    {
        DPositif()
    }
    func btn_GPositif(sender:UIButton!)
    {
        GPositif()
    }
    func btn_GNegatif(sender:UIButton!)
    {
        GNegatif()
    }
    func btn_MHaut(sender:UIButton!)
    {
        MHaut()
    }
    func btn_MBas(sender:UIButton!)
    {
        MBas()
    }

    func btn_HNegatif(sender:UIButton!)
    {
        HNegatif()
    }
    func btn_HPositif(sender:UIButton!)
    {
        HPositif()
    }
    func btn_BPositif(sender:UIButton!)
    {
        BPositif()
    }
    func btn_BNegatif(sender:UIButton!)
    {
        BNegatif()
    }
    func btn_MDroite(sender:UIButton!)
    {
        MDroite()
    }
    func btn_MGauche(sender:UIButton!)
    {
        MGauche()
    }
    func btn_FPositif(sender:UIButton!)
    {
        FPositif()
    }
    func btn_FNegatif(sender:UIButton!)
    {
        FNegatif()
    }
    
    func runAfterDelay(delay: NSTimeInterval, block: dispatch_block_t) {
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
        dispatch_after(time, dispatch_get_main_queue(), block)
    }
    
    func rnd_RubiksCube() {
        var Random = Int(arc4random_uniform(13))
        
        print(Random)

        if self.ARRAYS_MOVEMENTS[Random] == "DPositif" {
            self.DPositif()
        }
        if self.ARRAYS_MOVEMENTS[Random] == "DNegatif" {
            self.DNegatif()
        }
        if self.ARRAYS_MOVEMENTS[Random] == "HNegatif" {
            self.HNegatif()
        }
        if self.ARRAYS_MOVEMENTS[Random] == "HPositif" {
            self.HPositif()
        }
        if self.ARRAYS_MOVEMENTS[Random] == "MHaut" {
            self.MHaut()
        }
        if self.ARRAYS_MOVEMENTS[Random] == "MBas" {
            self.MBas()
        }
        if self.ARRAYS_MOVEMENTS[Random] == "BNegatif" {
            self.BNegatif()
        }
        if self.ARRAYS_MOVEMENTS[Random] == "BPositif" {
            self.BPositif()
        }
        if self.ARRAYS_MOVEMENTS[Random] == "MDroite" {
            self.MDroite()
        }
        if self.ARRAYS_MOVEMENTS[Random] == "MGauche" {
            self.MGauche()
        }
        if self.ARRAYS_MOVEMENTS[Random] == "FNegatif" {
            self.FNegatif()
        }
        if self.ARRAYS_MOVEMENTS[Random] == "FPositif" {
            self.FPositif()
        }
        if self.ARRAYS_MOVEMENTS[Random] == "GPositif" {
            self.GPositif()
        }
        if self.ARRAYS_MOVEMENTS[Random] == "GNegatif" {
            self.GNegatif()
        }
    }
    
    
    
    
    func DNegatif() {
        // create a temporary node for the rotation
        let rotateNode = SCNNode()
        BTN_DNEGATIF.hidden = true
        btn_HNegatif.hidden = true
        btn_BNegatif.hidden = true
        btn_GNegatif.hidden = true
        btn_DPositif.hidden = true
        btn_HPositif.hidden = true
        btn_BPositif.hidden = true
        btn_GPositif.hidden = true
        btn_MBas.hidden = true
        btn_MDroite.hidden = true
        btn_MGauche.hidden = true
        btn_MHaut.hidden = true
        btn_FPositif.hidden = true
        btn_FNegatif.hidden = true
        SCENE.rootNode.addChildNode(rotateNode)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let rightCubelets = cubelets.filter { node in
            return abs(node.position.x - 1) < 0.001
        }
        rightCubelets.map { rotateNode.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        rotateNode.eulerAngles.x += Float(M_PI_2)
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            rotateNode.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_DNEGATIF.hidden = false
            self.btn_HNegatif.hidden = false
            self.btn_BNegatif.hidden = false
            self.btn_GNegatif.hidden = false
            self.btn_DPositif.hidden = false
            self.btn_HPositif.hidden = false
            self.btn_BPositif.hidden = false
            self.btn_GPositif.hidden = false
            self.btn_MBas.hidden = false
            self.btn_MDroite.hidden = false
            self.btn_MGauche.hidden = false
            self.btn_MHaut.hidden = false
            self.btn_FPositif.hidden = false
            self.btn_FNegatif.hidden = false
            rotateNode.removeFromParentNode()
        }
        
        SCNTransaction.commit()
        scnRubiksCube.scene = SCENE
    }

    func DPositif() {
        // create a temporary node for the rotation
        let rotateNode = SCNNode()
        BTN_DNEGATIF.hidden = true
        btn_HNegatif.hidden = true
        btn_BNegatif.hidden = true
        btn_GNegatif.hidden = true
        btn_DPositif.hidden = true
        btn_HPositif.hidden = true
        btn_BPositif.hidden = true
        btn_GPositif.hidden = true
        btn_MBas.hidden = true
        btn_MDroite.hidden = true
        btn_MGauche.hidden = true
        btn_MHaut.hidden = true
        btn_FPositif.hidden = true
        btn_FNegatif.hidden = true
        SCENE.rootNode.addChildNode(rotateNode)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let rightCubelets = cubelets.filter { node in
            return abs(node.position.x - 1) < 0.001
        }
        rightCubelets.map { rotateNode.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        rotateNode.eulerAngles.x -= Float(M_PI_2)
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            rotateNode.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_DNEGATIF.hidden = false
            self.btn_HNegatif.hidden = false
            self.btn_BNegatif.hidden = false
            self.btn_GNegatif.hidden = false
            self.btn_DPositif.hidden = false
            self.btn_HPositif.hidden = false
            self.btn_BPositif.hidden = false
            self.btn_GPositif.hidden = false
            self.btn_MBas.hidden = false
            self.btn_MDroite.hidden = false
            self.btn_MGauche.hidden = false
            self.btn_MHaut.hidden = false
            self.btn_FPositif.hidden = false
            self.btn_FNegatif.hidden = false
            rotateNode.removeFromParentNode()
        }
        
        SCNTransaction.commit()
        scnRubiksCube.scene = SCENE
    }
    
    func GPositif() {
        // create a temporary node for the rotation
        let rotateNode = SCNNode()
        BTN_DNEGATIF.hidden = true
        btn_HNegatif.hidden = true
        btn_BNegatif.hidden = true
        btn_GNegatif.hidden = true
        btn_DPositif.hidden = true
        btn_HPositif.hidden = true
        btn_BPositif.hidden = true
        btn_GPositif.hidden = true
        btn_MBas.hidden = true
        btn_MDroite.hidden = true
        btn_MGauche.hidden = true
        btn_MHaut.hidden = true
        btn_FPositif.hidden = true
        btn_FNegatif.hidden = true
        SCENE.rootNode.addChildNode(rotateNode)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let rightCubelets = cubelets.filter { node in
            return abs(node.position.x + 1) < 0.001
        }
        rightCubelets.map { rotateNode.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        rotateNode.eulerAngles.x += Float(M_PI_2)
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            rotateNode.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_DNEGATIF.hidden = false
            self.btn_HNegatif.hidden = false
            self.btn_BNegatif.hidden = false
            self.btn_GNegatif.hidden = false
            self.btn_DPositif.hidden = false
            self.btn_HPositif.hidden = false
            self.btn_BPositif.hidden = false
            self.btn_GPositif.hidden = false
            self.btn_MBas.hidden = false
            self.btn_MDroite.hidden = false
            self.btn_MGauche.hidden = false
            self.btn_MHaut.hidden = false
            self.btn_FPositif.hidden = false
            self.btn_FNegatif.hidden = false
            rotateNode.removeFromParentNode()
        }
        
        SCNTransaction.commit()
        scnRubiksCube.scene = SCENE
    }
    
    func GNegatif() {
        // create a temporary node for the rotation
        let rotateNode = SCNNode()
        BTN_DNEGATIF.hidden = true
        btn_HNegatif.hidden = true
        btn_BNegatif.hidden = true
        btn_GNegatif.hidden = true
        btn_DPositif.hidden = true
        btn_HPositif.hidden = true
        btn_BPositif.hidden = true
        btn_GPositif.hidden = true
        btn_MBas.hidden = true
        btn_MDroite.hidden = true
        btn_MGauche.hidden = true
        btn_MHaut.hidden = true
        btn_FPositif.hidden = true
        btn_FNegatif.hidden = true
        SCENE.rootNode.addChildNode(rotateNode)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let rightCubelets = cubelets.filter { node in
            return abs(node.position.x + 1) < 0.001
        }
        rightCubelets.map { rotateNode.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        rotateNode.eulerAngles.x -= Float(M_PI_2)
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            rotateNode.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_DNEGATIF.hidden = false
            self.btn_HNegatif.hidden = false
            self.btn_BNegatif.hidden = false
            self.btn_GNegatif.hidden = false
            self.btn_DPositif.hidden = false
            self.btn_HPositif.hidden = false
            self.btn_BPositif.hidden = false
            self.btn_GPositif.hidden = false
            self.btn_MBas.hidden = false
            self.btn_MDroite.hidden = false
            self.btn_MGauche.hidden = false
            self.btn_MHaut.hidden = false
            self.btn_FPositif.hidden = false
            self.btn_FNegatif.hidden = false
            rotateNode.removeFromParentNode()
        }
        
        SCNTransaction.commit()
        scnRubiksCube.scene = SCENE
    }
    
    func MHaut() {
        // create a temporary node for the rotation
        let rotateNode = SCNNode()
        BTN_DNEGATIF.hidden = true
        btn_HNegatif.hidden = true
        btn_BNegatif.hidden = true
        btn_GNegatif.hidden = true
        btn_DPositif.hidden = true
        btn_HPositif.hidden = true
        btn_BPositif.hidden = true
        btn_GPositif.hidden = true
        btn_MBas.hidden = true
        btn_MDroite.hidden = true
        btn_MGauche.hidden = true
        btn_MHaut.hidden = true
        btn_FPositif.hidden = true
        btn_FNegatif.hidden = true
        SCENE.rootNode.addChildNode(rotateNode)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let rightCubelets = cubelets.filter { node in
            return abs(node.position.x) < 0.001
        }
        rightCubelets.map { rotateNode.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        rotateNode.eulerAngles.x -= Float(M_PI_2)
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            rotateNode.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_DNEGATIF.hidden = false
            self.btn_HNegatif.hidden = false
            self.btn_BNegatif.hidden = false
            self.btn_GNegatif.hidden = false
            self.btn_DPositif.hidden = false
            self.btn_HPositif.hidden = false
            self.btn_BPositif.hidden = false
            self.btn_GPositif.hidden = false
            self.btn_MBas.hidden = false
            self.btn_MDroite.hidden = false
            self.btn_MGauche.hidden = false
            self.btn_MHaut.hidden = false
            self.btn_FPositif.hidden = false
            self.btn_FNegatif.hidden = false
            rotateNode.removeFromParentNode()
        }
        
        SCNTransaction.commit()
        scnRubiksCube.scene = SCENE
    }
    
    func MBas() {
        // create a temporary node for the rotation
        let rotateNode = SCNNode()
        BTN_DNEGATIF.hidden = true
        btn_HNegatif.hidden = true
        btn_BNegatif.hidden = true
        btn_GNegatif.hidden = true
        btn_DPositif.hidden = true
        btn_HPositif.hidden = true
        btn_BPositif.hidden = true
        btn_GPositif.hidden = true
        btn_MBas.hidden = true
        btn_MDroite.hidden = true
        btn_MGauche.hidden = true
        btn_MHaut.hidden = true
        btn_FPositif.hidden = true
        btn_FNegatif.hidden = true
        SCENE.rootNode.addChildNode(rotateNode)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let rightCubelets = cubelets.filter { node in
            return abs(node.position.x) < 0.001
        }
        rightCubelets.map { rotateNode.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        rotateNode.eulerAngles.x += Float(M_PI_2)
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            rotateNode.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_DNEGATIF.hidden = false
            self.btn_HNegatif.hidden = false
            self.btn_BNegatif.hidden = false
            self.btn_GNegatif.hidden = false
            self.btn_DPositif.hidden = false
            self.btn_HPositif.hidden = false
            self.btn_BPositif.hidden = false
            self.btn_GPositif.hidden = false
            self.btn_MBas.hidden = false
            self.btn_MDroite.hidden = false
            self.btn_MGauche.hidden = false
            self.btn_MHaut.hidden = false
            self.btn_FPositif.hidden = false
            self.btn_FNegatif.hidden = false
            rotateNode.removeFromParentNode()
        }
        
        SCNTransaction.commit()
        scnRubiksCube.scene = SCENE
    }
    
    func HNegatif() {
        // create a temporary node for the rotation
        let rotateNode = SCNNode()
        BTN_DNEGATIF.hidden = true
        btn_HNegatif.hidden = true
        btn_BNegatif.hidden = true
        btn_GNegatif.hidden = true
        btn_DPositif.hidden = true
        btn_HPositif.hidden = true
        btn_BPositif.hidden = true
        btn_GPositif.hidden = true
        btn_MBas.hidden = true
        btn_MDroite.hidden = true
        btn_MGauche.hidden = true
        btn_MHaut.hidden = true
        btn_FPositif.hidden = true
        btn_FNegatif.hidden = true
        SCENE.rootNode.addChildNode(rotateNode)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let rightCubelets = cubelets.filter { node in
            return abs(node.position.y - 1) < 0.001
        }
        rightCubelets.map { rotateNode.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        rotateNode.eulerAngles.y += Float(M_PI_2)
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            rotateNode.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_DNEGATIF.hidden = false
            self.btn_HNegatif.hidden = false
            self.btn_BNegatif.hidden = false
            self.btn_GNegatif.hidden = false
            self.btn_DPositif.hidden = false
            self.btn_HPositif.hidden = false
            self.btn_BPositif.hidden = false
            self.btn_GPositif.hidden = false
            self.btn_MBas.hidden = false
            self.btn_MDroite.hidden = false
            self.btn_MGauche.hidden = false
            self.btn_MHaut.hidden = false
            self.btn_FPositif.hidden = false
            self.btn_FNegatif.hidden = false
            rotateNode.removeFromParentNode()
        }
        
        SCNTransaction.commit()
        scnRubiksCube.scene = SCENE
    }
    
    func HPositif() {
        // create a temporary node for the rotation
        let rotateNode = SCNNode()
        BTN_DNEGATIF.hidden = true
        btn_HNegatif.hidden = true
        btn_BNegatif.hidden = true
        btn_GNegatif.hidden = true
        btn_DPositif.hidden = true
        btn_HPositif.hidden = true
        btn_BPositif.hidden = true
        btn_GPositif.hidden = true
        btn_MBas.hidden = true
        btn_MDroite.hidden = true
        btn_MGauche.hidden = true
        btn_MHaut.hidden = true
        btn_FPositif.hidden = true
        btn_FNegatif.hidden = true
        SCENE.rootNode.addChildNode(rotateNode)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let rightCubelets = cubelets.filter { node in
            return abs(node.position.y - 1) < 0.001
        }
        rightCubelets.map { rotateNode.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        rotateNode.eulerAngles.y -= Float(M_PI_2)
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            rotateNode.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_DNEGATIF.hidden = false
            self.btn_HNegatif.hidden = false
            self.btn_BNegatif.hidden = false
            self.btn_GNegatif.hidden = false
            self.btn_DPositif.hidden = false
            self.btn_HPositif.hidden = false
            self.btn_BPositif.hidden = false
            self.btn_GPositif.hidden = false
            self.btn_MBas.hidden = false
            self.btn_MDroite.hidden = false
            self.btn_MGauche.hidden = false
            self.btn_MHaut.hidden = false
            self.btn_FPositif.hidden = false
            self.btn_FNegatif.hidden = false
            rotateNode.removeFromParentNode()
        }
        
        SCNTransaction.commit()
        scnRubiksCube.scene = SCENE
    }
    
    func BPositif() {
        // create a temporary node for the rotation
        let rotateNode = SCNNode()
        BTN_DNEGATIF.hidden = true
        btn_HNegatif.hidden = true
        btn_BNegatif.hidden = true
        btn_GNegatif.hidden = true
        btn_DPositif.hidden = true
        btn_HPositif.hidden = true
        btn_BPositif.hidden = true
        btn_GPositif.hidden = true
        btn_MBas.hidden = true
        btn_MDroite.hidden = true
        btn_MGauche.hidden = true
        btn_MHaut.hidden = true
        btn_FPositif.hidden = true
        btn_FNegatif.hidden = true
        SCENE.rootNode.addChildNode(rotateNode)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let rightCubelets = cubelets.filter { node in
            return abs(node.position.y + 1) < 0.001
        }
        rightCubelets.map { rotateNode.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        rotateNode.eulerAngles.y += Float(M_PI_2)
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            rotateNode.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_DNEGATIF.hidden = false
            self.btn_HNegatif.hidden = false
            self.btn_BNegatif.hidden = false
            self.btn_GNegatif.hidden = false
            self.btn_DPositif.hidden = false
            self.btn_HPositif.hidden = false
            self.btn_BPositif.hidden = false
            self.btn_GPositif.hidden = false
            self.btn_MBas.hidden = false
            self.btn_MDroite.hidden = false
            self.btn_MGauche.hidden = false
            self.btn_MHaut.hidden = false
            self.btn_FPositif.hidden = false
            self.btn_FNegatif.hidden = false
            rotateNode.removeFromParentNode()
        }
        
        SCNTransaction.commit()
        scnRubiksCube.scene = SCENE
    }
    
    func BNegatif() {
        // create a temporary node for the rotation
        let rotateNode = SCNNode()
        BTN_DNEGATIF.hidden = true
        btn_HNegatif.hidden = true
        btn_BNegatif.hidden = true
        btn_GNegatif.hidden = true
        btn_DPositif.hidden = true
        btn_HPositif.hidden = true
        btn_BPositif.hidden = true
        btn_GPositif.hidden = true
        btn_MBas.hidden = true
        btn_MDroite.hidden = true
        btn_MGauche.hidden = true
        btn_MHaut.hidden = true
        btn_FPositif.hidden = true
        btn_FNegatif.hidden = true
        SCENE.rootNode.addChildNode(rotateNode)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let rightCubelets = cubelets.filter { node in
            return abs(node.position.y + 1) < 0.001
        }
        rightCubelets.map { rotateNode.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        rotateNode.eulerAngles.y -= Float(M_PI_2)
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            rotateNode.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_DNEGATIF.hidden = false
            self.btn_HNegatif.hidden = false
            self.btn_BNegatif.hidden = false
            self.btn_GNegatif.hidden = false
            self.btn_DPositif.hidden = false
            self.btn_HPositif.hidden = false
            self.btn_BPositif.hidden = false
            self.btn_GPositif.hidden = false
            self.btn_MBas.hidden = false
            self.btn_MDroite.hidden = false
            self.btn_MGauche.hidden = false
            self.btn_MHaut.hidden = false
            self.btn_FPositif.hidden = false
            self.btn_FNegatif.hidden = false
            rotateNode.removeFromParentNode()
        }
        
        SCNTransaction.commit()
        scnRubiksCube.scene = SCENE
    }
    
    func MDroite() {
        // create a temporary node for the rotation
        let rotateNode = SCNNode()
        BTN_DNEGATIF.hidden = true
        btn_HNegatif.hidden = true
        btn_BNegatif.hidden = true
        btn_GNegatif.hidden = true
        btn_DPositif.hidden = true
        btn_HPositif.hidden = true
        btn_BPositif.hidden = true
        btn_GPositif.hidden = true
        btn_MBas.hidden = true
        btn_MDroite.hidden = true
        btn_MGauche.hidden = true
        btn_MHaut.hidden = true
        btn_FPositif.hidden = true
        btn_FNegatif.hidden = true
        SCENE.rootNode.addChildNode(rotateNode)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let rightCubelets = cubelets.filter { node in
            return abs(node.position.y) < 0.001
        }
        rightCubelets.map { rotateNode.addChildNode($0) }
        
        // animate a rotation
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        rotateNode.eulerAngles.y += Float(M_PI_2)
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            rotateNode.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                self.SCENE.rootNode.addChildNode(cubelet)
            }
            self.BTN_DNEGATIF.hidden = false
            self.btn_HNegatif.hidden = false
            self.btn_BNegatif.hidden = false
            self.btn_GNegatif.hidden = false
            self.btn_DPositif.hidden = false
            self.btn_HPositif.hidden = false
            self.btn_BPositif.hidden = false
            self.btn_GPositif.hidden = false
            self.btn_MBas.hidden = false
            self.btn_MDroite.hidden = false
            self.btn_MGauche.hidden = false
            self.btn_MHaut.hidden = false
            self.btn_FPositif.hidden = false
            self.btn_FNegatif.hidden = false
            rotateNode.removeFromParentNode()
        }
        
        SCNTransaction.commit()
        scnRubiksCube.scene = SCENE
    }
    
    func MGauche() {
        // create a temporary node for the rotation
        let rotateNode = SCNNode()
        BTN_DNEGATIF.hidden = true
        btn_HNegatif.hidden = true
        btn_BNegatif.hidden = true
        btn_GNegatif.hidden = true
        btn_DPositif.hidden = true
        btn_HPositif.hidden = true
        btn_BPositif.hidden = true
        btn_GPositif.hidden = true
        btn_MBas.hidden = true
        btn_MDroite.hidden = true
        btn_MGauche.hidden = true
        btn_MHaut.hidden = true
        btn_FPositif.hidden = true
        btn_FNegatif.hidden = true
        SCENE.rootNode.addChildNode(rotateNode)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let rightCubelets = cubelets.filter { node in
            return abs(node.position.y) < 0.001
        }
        rightCubelets.map { rotateNode.addChildNode($0)

        }
        

        
        // animate a rotation
        
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)

        rotateNode.eulerAngles.y -= Float(M_PI_2)
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            rotateNode.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                self.SCENE.rootNode.addChildNode(cubelet)

            }
            self.BTN_DNEGATIF.hidden = false
            self.btn_HNegatif.hidden = false
            self.btn_BNegatif.hidden = false
            self.btn_GNegatif.hidden = false
            self.btn_DPositif.hidden = false
            self.btn_HPositif.hidden = false
            self.btn_BPositif.hidden = false
            self.btn_GPositif.hidden = false
            self.btn_MBas.hidden = false
            self.btn_MDroite.hidden = false
            self.btn_MGauche.hidden = false
            self.btn_MHaut.hidden = false
            self.btn_FPositif.hidden = false
            self.btn_FNegatif.hidden = false
            rotateNode.removeFromParentNode()
        }
        
        SCNTransaction.commit()

        scnRubiksCube.scene = SCENE

        }
    
    func FPositif() {
        // create a temporary node for the rotation
        let rotateNode = SCNNode()
        BTN_DNEGATIF.hidden = true
        btn_HNegatif.hidden = true
        btn_BNegatif.hidden = true
        btn_GNegatif.hidden = true
        btn_DPositif.hidden = true
        btn_HPositif.hidden = true
        btn_BPositif.hidden = true
        btn_GPositif.hidden = true
        btn_MBas.hidden = true
        btn_MDroite.hidden = true
        btn_MGauche.hidden = true
        btn_MHaut.hidden = true
        btn_FPositif.hidden = true
        btn_FNegatif.hidden = true
        SCENE.rootNode.addChildNode(rotateNode)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let rightCubelets = cubelets.filter { node in
            return abs(node.position.z - 1) < 0.001
        }
        rightCubelets.map { rotateNode.addChildNode($0)
            
        }
        
        
        
        // animate a rotation
        
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        rotateNode.eulerAngles.z -= Float(M_PI_2)
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            rotateNode.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                self.SCENE.rootNode.addChildNode(cubelet)
                
            }
            self.BTN_DNEGATIF.hidden = false
            self.btn_HNegatif.hidden = false
            self.btn_BNegatif.hidden = false
            self.btn_GNegatif.hidden = false
            self.btn_DPositif.hidden = false
            self.btn_HPositif.hidden = false
            self.btn_BPositif.hidden = false
            self.btn_GPositif.hidden = false
            self.btn_MBas.hidden = false
            self.btn_MDroite.hidden = false
            self.btn_MGauche.hidden = false
            self.btn_MHaut.hidden = false
            self.btn_FPositif.hidden = false
            self.btn_FNegatif.hidden = false
            rotateNode.removeFromParentNode()
        }
        
        SCNTransaction.commit()
        
        scnRubiksCube.scene = SCENE
        
    }
    
    func FNegatif() {
        // create a temporary node for the rotation
        let rotateNode = SCNNode()
        BTN_DNEGATIF.hidden = true
        btn_HNegatif.hidden = true
        btn_BNegatif.hidden = true
        btn_GNegatif.hidden = true
        btn_DPositif.hidden = true
        btn_HPositif.hidden = true
        btn_BPositif.hidden = true
        btn_GPositif.hidden = true
        btn_MBas.hidden = true
        btn_MDroite.hidden = true
        btn_MGauche.hidden = true
        btn_MHaut.hidden = true
        btn_FPositif.hidden = true
        btn_FNegatif.hidden = true
        SCENE.rootNode.addChildNode(rotateNode)
        
        // grab the set of cubelets whose position is along the right face of the puzzle,
        // and add them to the rotation node
        let rightCubelets = cubelets.filter { node in
            return abs(node.position.z - 1) < 0.001
        }
        rightCubelets.map { rotateNode.addChildNode($0)
            
        }
        
        
        
        // animate a rotation
        
        SCNTransaction.begin()
        SCNTransaction.setAnimationDuration(1)
        
        rotateNode.eulerAngles.z += Float(M_PI_2)
        SCNTransaction.setCompletionBlock {
            // after animating, remove the cubelets from the rotation node,
            // and re-add them to the parent node with their transforms altered
            rotateNode.enumerateChildNodesUsingBlock { cubelet, _ in
                cubelet.transform = cubelet.worldTransform
                cubelet.removeFromParentNode()
                self.SCENE.rootNode.addChildNode(cubelet)
                
            }
            self.BTN_DNEGATIF.hidden = false
            self.btn_HNegatif.hidden = false
            self.btn_BNegatif.hidden = false
            self.btn_GNegatif.hidden = false
            self.btn_DPositif.hidden = false
            self.btn_HPositif.hidden = false
            self.btn_BPositif.hidden = false
            self.btn_GPositif.hidden = false
            self.btn_MBas.hidden = false
            self.btn_MDroite.hidden = false
            self.btn_MGauche.hidden = false
            self.btn_MHaut.hidden = false
            self.btn_FPositif.hidden = false
            self.btn_FNegatif.hidden = false
            rotateNode.removeFromParentNode()
        }
        
        SCNTransaction.commit()
        
        scnRubiksCube.scene = SCENE
        
    }
    
    func RubiksCube() {
        /*
        D- -> rotateNode.eulerAngles.x += Float(M_PI_2) return abs(node.position.x - 1) < 0.001
        D+ -> rotateNode.eulerAngles.x -= Float(M_PI_2) return abs(node.position.x - 1) < 0.001
        G+ -> rotateNode.eulerAngles.x += Float(M_PI_2) return abs(node.position.x + 1) < 0.001
        G- -> rotateNode.eulerAngles.x -= Float(M_PI_2) return abs(node.position.x + 1) < 0.001
        M vers le haut -> rotateNode.eulerAngles.x -= Float(M_PI_2) return abs(node.position.x) < 0.001
        M vers le bas -> rotateNode.eulerAngles.x += Float(M_PI_2) return abs(node.position.x) < 0.001
        
        H- -> rotateNode.eulerAngles.y += Float(M_PI_2) return abs(node.position.x - 1) < 0.001
        H+ -> rotateNode.eulerAngles.y -= Float(M_PI_2) return abs(node.position.x - 1) < 0.001
        B- -> rotateNode.eulerAngles.y += Float(M_PI_2) return abs(node.position.x + 1) < 0.001
        B+ -> rotateNode.eulerAngles.y -= Float(M_PI_2) return abs(node.position.x + 1) < 0.001
        M vers la droite -> rotateNode.eulerAngles.y += Float(M_PI_2) return abs(node.position.x) < 0.001
        M vers la gauche -> rotateNode.eulerAngles.y -= Float(M_PI_2) return abs(node.position.x) < 0.001
        
        F- -> rotateNode.eulerAngles.y += Float(M_PI_2) return abs(node.position.x - 1) < 0.001
        F+ -> rotateNode.eulerAngles.y -= Float(M_PI_2) return abs(node.position.x - 1) < 0.001
        D- -> rotateNode.eulerAngles.y += Float(M_PI_2) return abs(node.position.x + 1) < 0.001
        D+ -> rotateNode.eulerAngles.y -= Float(M_PI_2) return abs(node.position.x + 1) < 0.001
        MC vers la gauche -> rotateNode.eulerAngles.y += Float(M_PI_2) return abs(node.position.x) < 0.001
        MC vers la droite -> rotateNode.eulerAngles.y -= Float(M_PI_2) return abs(node.position.x) < 0.001
        
        */
        
        


    }
    
    // MARK: Scene
    func sceneSetup1() {
        // 1
        let scene = SCNScene()
        
        
        CAMERA_NODE.camera = SCNCamera()
        CAMERA_NODE.position = SCNVector3Make(0, 0, 30)
        CAMERA_NODE.rotation = SCNVector4Make(0, 0, 1, CFloat( -M_PI_4 ) * 2 )
        CAMERA_NODE.eulerAngles.x = Float(-M_PI)
        CAMERA_NODE.eulerAngles.y = Float(-2 * -M_PI)
        scene.rootNode.addChildNode(CAMERA_NODE)
        //self.view.userInteractionEnabled = false
        
        
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: "panGesture:")
        scnRubiksCube.addGestureRecognizer(panRecognizer)
        
        // 3
        scnRubiksCube.scene = scene
        
        scnRubiksCube.allowsCameraControl = true
        
    }
    // MARK: Scene
    func sceneSetup2() {
        // 1
        let scene = SCNScene()
        
        
        CAMERA_NODE.camera = SCNCamera()
        CAMERA_NODE.position = SCNVector3Make(0, 0, 30)
        CAMERA_NODE.rotation = SCNVector4Make(0, 0, 1, CFloat( -M_PI_4 ) * 2 )
        scene.rootNode.addChildNode(CAMERA_NODE)
        //self.view.userInteractionEnabled = false
        
        
        
        
        
    }
    
    
    func panGesture(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(sender.view!)
        var newAngle = (Float)(translation.x)*(Float)(M_PI)/180.0
        newAngle += currentAngle
        
        GEOMETRY_NODE.transform = SCNMatrix4MakeRotation(newAngle, 0, 1, 0)
        
        if(sender.state == UIGestureRecognizerState.Ended) {
            currentAngle = newAngle
        }
    }
    
    // MARK: IBActions
    @IBAction func segmentValueChanged(sender: UISegmentedControl) {
        // 1
        GEOMETRY_NODE.removeFromParentNode()
        currentAngle = 0.0
        
        //geometryNode = allPyra1()
        
        
        
    }
    
    // MARK: Style
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    // MARK: Transition
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        scnRubiksCube.stop(nil)
        scnRubiksCube.play(nil)
    }
    /*
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
    }*/

    // convenience for creating solid color materials
    func materialWithColor(color: UIColor) -> SCNMaterial {
        let mat = SCNMaterial()
        mat.diffuse.contents = color
        mat.specular.contents = UIColor.whiteColor()
        return mat
    }
    // create and arrange a 3x3x3 array of cubelets

    
    
}

