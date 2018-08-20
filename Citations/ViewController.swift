//
//  ViewController.swift
//  Citations
//
//  Created by Snoopy on 20/08/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var citationsLabel: UILabel!
    @IBOutlet weak var persoLabel: UILabel!
    
    var timer: Timer!
    var citations = ["Kadoc": "Elle est où la poulette?",
                     "Karadoc": "Lorsqu'on le tient par la partie sporadique, ou boulière, le fenouil est un objet redondant.",
                     "Le maître d’armes": "JE NE MANGE PAS DE GRAINES !",
                     "Arthur": "Y a pas à dire, dès qu'il y a du dessert, le repas est tout de suite plus chaleureux !",
                     "Leodagan": "Moi, j’ai appris à lire, et ben je souhaite ça à personne !",
                     "Perceval": "Dans la vie, j’avais deux ennemis : le vocabulaire et les épinards. Maintenant j’ai la botte secrète et je bouffe plus d’épinards. Merci, de rien, au revoir messieurs-dames."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        obtenirCitationAleatoire()
        background()
        timer = Timer.scheduledTimer(withTimeInterval: 6, repeats: true, block: { (t) in
            self.animation()
        })
        
    }
    
    
    func animation() {
        UIView.animate(withDuration: 1.5, animations: {
            self.persoLabel.alpha = 0
            self.citationsLabel.alpha = 0
            self.background()
        }) { (success) in
            self.obtenirCitationAleatoire()
            UIView.animate(withDuration: 1.5, animations: {
                self.persoLabel.alpha = 1
                self.citationsLabel.alpha = 1
                self.background()
            }, completion: nil)
        }
    }
    
    func obtenirCitationAleatoire() {
        let random = Int(arc4random_uniform(UInt32(self.citations.count)))
        persoLabel.text = Array(citations.keys)[random]
        citationsLabel.text = Array(citations.values)[random]
        
        
    }
    
    func background() {
        self.view.backgroundColor = UIColor(red: aleatoire(), green: aleatoire(), blue: aleatoire(), alpha: 1)
        
    }

    func aleatoire() -> CGFloat {
        return CGFloat(arc4random_uniform(180)) / 255
    }
    
    
}

