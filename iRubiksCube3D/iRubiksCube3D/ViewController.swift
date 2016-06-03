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
    @IBOutlet var scn_menu: UIView!
    @IBOutlet var scn_menuRubiks: UIView!

    // Lors du clique du bouton, la vue du Rubik's cube se lance
    @IBAction func btn_gameTouch(sender: AnyObject) {

        performSegueWithIdentifier("ToSecond", sender: nil)
        
    }
    
    // lors du clique du bouton, l'application se ferme
    @IBAction func btn_exitTouch(sender: AnyObject) {
        exit(0)
    }
    

    
}

