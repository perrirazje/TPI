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

    @IBOutlet weak var btnPlayGame: UIButton!
    @IBOutlet weak var btnExitGame: UIButton!
<<<<<<< HEAD
    @IBOutlet weak var imgRubiksCube: UIImageView!
=======
>>>>>>> origin/master

    ///
    /// Nom : touchPlayButton
    /// Description : C'est la fonction qui se lance quand on touche le bouton PlayGame
    /// Paramètre : animated : Bool
    ///
    @IBAction func touchPlayButton(sender: AnyObject) {
        performSegueWithIdentifier("ToSecond", sender: nil)
    }
    
    ///
    /// Nom : touchExitButton
    /// Description : C'est la fonction qui se lance quand on touche le bouton ExitGame
    /// Paramètre : animated : Bool
    ///
    @IBAction func touchExitButton(sender: AnyObject) {
        exit(0)
    }
}

