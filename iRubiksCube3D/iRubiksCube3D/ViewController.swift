///
/// ETML
/// Auteur : Jérémy Perriraz
/// Date : 26.05.2016
/// Description : Fichier qui contrôle toute la vue du menu principale,
///               c'est ici que tout ce qui concerne cette vue sera fait.
///

import UIKit
import SceneKit

///
/// Nom : ViewController
/// Description : C'est la classe où il y aura tout le code de cette vue
///
class ViewController: UIViewController {

    // Le nom du bouton pour jouer au jeu du menu principale du Rubik's cube qui est lié au storyboard
    @IBOutlet weak var btnPlayGame: UIButton!
    // Le nom du bouton pour quitter le jeu du menu principale du Rubik's cube qui est lié au storyboard
    @IBOutlet weak var btnExitGame: UIButton!
    // Le nom de l'image du menu principale du Rubik's cube qui est lié au storyboard
    @IBOutlet weak var imgRubiksCube: UIImageView!

    ///
    /// Nom : touchPlayButton
    /// Description : C'est la fonction qui se lance quand on touche le bouton PlayGame
    /// Paramètre : animated : Bool
    ///
    @IBAction func touchPlayButton(sender: AnyObject) {
        // Cela permet de savoir dans quelle vue il doit aller, "ToSecond" est la liaison entre les deux vues.
        performSegueWithIdentifier("ToSecond", sender: nil)
    }
    
    ///
    /// Nom : touchExitButton
    /// Description : C'est la fonction qui se lance quand on touche le bouton ExitGame
    /// Paramètre : animated : Bool
    ///
    @IBAction func touchExitButton(sender: AnyObject) {
        // Commande pour quitter une application
        exit(0)
    }
} // Fin de la classe ViewController

