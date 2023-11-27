//
//  ViewController.swift
//  2023_11_22_appConjuntoiOS
//
//  Created by Ivanovicx Nuñez on 22/11/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var operaciones : [String] = ["Unión (A U B)", "Intersección (A ∩ B)", "Diferencia 1 (A - B)", "Diferencia 2 (B - A)", "Diferencia Simétrica (A △ B)"]
    
    var setA = Set <String> ()
    var setB = Set <String> ()
    
    @IBOutlet weak var text_conjuntoA: UITextField!
    @IBOutlet weak var text_conjuntoB: UITextField!
    
    @IBOutlet weak var button_conjuntoA: UIButton!
    @IBOutlet weak var button_conjuntoB: UIButton!
    
//    @IBOutlet weak var button_Union: UIButton!
//    @IBOutlet weak var button_Interseccion: UIButton!
//    @IBOutlet var button_acciones: [UIButton]!
    
    @IBOutlet weak var area_resultado: UITextView!
    
    @IBOutlet weak var pickerView_pickerOperaciones: UIPickerView!
    
    @IBOutlet weak var imageView_diagramas: UIImageView!
    
    @IBAction func text_conjuntoA(_ sender: UITextField) {
        
        if text_conjuntoA.text != "" {
            button_conjuntoA.isEnabled = true;
        } else {
            button_conjuntoA.isEnabled = false;
        }
    }
    
    @IBAction func button_conjuntoA(_ sender: UIButton) {
        
        if !text_conjuntoA.text!.isEmpty {
            
            setA.removeAll()
            
            let cadena : [String] = (text_conjuntoA.text!.components(separatedBy: ","))
            
            for valor in cadena {
                if valor != " " {
                    setA.insert(valor)
                }
            }
            
            setA.remove("")
            
            if pickerView_pickerOperaciones.isUserInteractionEnabled {
                self.pickerView(pickerView_pickerOperaciones, didSelectRow: pickerView_pickerOperaciones.selectedRow(inComponent: 0), inComponent: 0)
            }
            
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
        
        if !text_conjuntoB.text!.isEmpty {
            
            setB.removeAll()
            
            let cadena : [String] = text_conjuntoB.text!.components(separatedBy: ",")
                    
            for valor in cadena {
                if valor != " " {
                    setB.insert(valor)
                }
            }
            
            setB.remove("")
            
            if pickerView_pickerOperaciones.isUserInteractionEnabled {
                self.pickerView(pickerView_pickerOperaciones, didSelectRow: pickerView_pickerOperaciones.selectedRow(inComponent: 0), inComponent: 0)
            } else {
                area_resultado.isScrollEnabled = true;
                pickerView_pickerOperaciones.isUserInteractionEnabled = true
                self.pickerView(pickerView_pickerOperaciones, didSelectRow: 0, inComponent: 0)
            }
        }
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return operaciones.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return operaciones[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch row {
            
        // unión
        case 0:
            let union = setA.union(setB).sorted()
            area_resultado.text = "A U B = \(union)"
            imageView_diagramas.image = UIImage(named: "A_union_B")
            break
            
        // intersección
        case 1:
            let interseccion = setA.intersection(setB).sorted()
            area_resultado.text = "A ∩ B = \(interseccion)"
            imageView_diagramas.image = UIImage(named: "A_interseccion_B")
            break
            
        // a menos b
        case 2:
            let resta = setA.subtracting(setB)
            area_resultado.text = "A - B = \(resta)"
            imageView_diagramas.image = UIImage(named: "A_menos_B")
            break
            
        // b menos a
        case 3:
            let resta = setB.subtracting(setA)
            area_resultado.text = "B - A = \(resta)"
            imageView_diagramas.image = UIImage(named: "B_menos_A")
            break
            
        // diferencia simétrica
        case 4:
            let diferenciaSim = setA.symmetricDifference(setB)
            area_resultado.text = "A △ B = \(diferenciaSim)"
            imageView_diagramas.image = UIImage(named: "A_diferenciaSimetrica_B")
            break
        
        default:
            break
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView_diagramas.backgroundColor = .white
        pickerView_pickerOperaciones.delegate = self
        pickerView_pickerOperaciones.dataSource = self
    }


}

