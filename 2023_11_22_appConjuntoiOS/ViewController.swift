//
//  ViewController.swift
//  2023_11_22_appConjuntoiOS
//
//  Created by Ivanovicx Nuñez on 22/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    var setA = Set <String> ()
    var setB = Set <String> ()
    
    @IBOutlet weak var text_conjuntoA: UITextField!
    @IBOutlet weak var text_conjuntoB: UITextField!
    
    @IBOutlet weak var button_conjuntoA: UIButton!
    @IBOutlet weak var button_conjuntoB: UIButton!
    
    
    @IBOutlet weak var button_Union: UIButton!
    @IBOutlet weak var button_Interseccion: UIButton!
    @IBOutlet var button_acciones: [UIButton]!
    
    @IBOutlet weak var area_resultado: UITextView!
    
    @IBAction func text_conjuntoA(_ sender: UITextField) {
        
        if text_conjuntoA.text != "" {
            button_conjuntoA.isEnabled = true;
        } else {
            button_conjuntoA.isEnabled = false;
        }
    }
    
    @IBAction func button_conjuntoA(_ sender: UIButton) {
        
        if !text_conjuntoA.text!.isEmpty {
            let cadena : [String] = (text_conjuntoA.text!.components(separatedBy: ","))
            
            for valor in cadena {
                setA.insert(valor)
            }
            
            setA.remove("")
            
            text_conjuntoB.isEnabled = true
            text_conjuntoB.becomeFirstResponder()
        }
    }
    
    @IBAction func text_conjuntoB(_ sender: UITextField) {
        
        if text_conjuntoB.text != "" {
            button_conjuntoB.isEnabled = true
        } else {
            button_conjuntoB.isEnabled = false
        }
    }
    
    @IBAction func button_conjuntoB(_ sender: UIButton) {
        
        let cadena : [String] = text_conjuntoB.text!.components(separatedBy: ",")
        
        for valor in cadena {
            setB.insert(valor)
        }
        
        setB.remove("")
        area_resultado.isScrollEnabled = true;
        
        for button in button_acciones {
            button.isEnabled = true
        }
    }
    
    
    @IBAction func button_union(_ sender: UIButton) {
        
        let unionAB = setA.union(setB)
        
        for valor in unionAB {
            area_resultado.text += area_resultado.text + "\n - \(valor)"
        }
    }
    
    @IBAction func button_interseccion(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

