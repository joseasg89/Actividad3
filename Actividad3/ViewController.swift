//
//  ViewController.swift
//  Actividad3
//
//  Created by usuario on 1/8/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTotalCuenta: UILabel!
    @IBOutlet weak var txtTotalCuenta: UITextField!
    @IBAction func txtTotalCuentaChang(_ sender: Any) {
        if txtTotalCuenta.text?.isEmpty == true{
            lblTotalCuenta.text = "El campo es Obligatorio"
            validador = false
        }else{
            let isnumber: Bool = isNum(string: txtTotalCuenta.text!)
            if txtTotalCuenta.text!.count > 10{
                lblTotalCuenta.text = "El limete es de 10 digitos"
                validador = false
            }else if !isnumber{
                if txtTotalCuenta.text! != ""{
                    lblTotalCuenta.text = "El campo debe ser numerico"
                    validador = false
                }
            }else{
                lblTotalCuenta.text = ""
            }
        }
    }
    @IBOutlet weak var lblPorcPropop: UILabel!
    @IBOutlet weak var txtPorcPropop: UITextField!
    @IBAction func txtPorcPorpopChang(_ sender: Any) {
        if txtPorcPropop.text?.isEmpty == true{
            lblPorcPropop.text = "El campo es Obligatorio"
            validador = false
        }else{
            let isnumber: Bool = isNumSmall(string:
                txtPorcPropop.text!)
            if !isnumber{
                if txtPorcPropop.text!.count > 2{
                    lblPorcPropop.text = "El limete es de 2 digitos"
                    validador = false
                }else if txtPorcPropop.text! != ""{
                    lblPorcPropop.text = "El campo debe ser numerico"
                    validador = false
                }
            }else{
                let propina: Int? = Int(txtPorcPropop.text!)
                if propina! > 30{
                    lblPorcPropop.text = "El limete es de 30%"
                    validador = false
                }else{
                    lblPorcPropop.text = ""
                }
            }
        }
    }
    @IBOutlet weak var lblDesgloce: UILabel!
    @IBOutlet weak var txvDesgloce: UITextView!
    @IBOutlet weak var lblbtnError: UILabel!
    @IBAction func btnCalculaTotal(_ sender: Any) {
        validador = true
        txtTotalCuentaChang(txtTotalCuenta)
        txtPorcPorpopChang(txtPorcPropop)
        if validador == true{
            let cuenta: Float? = Float(txtTotalCuenta.text!)
            let propina:  Float? = Float(txtPorcPropop.text!)
            
            let totalPropina = cuenta! * (0.01 * propina!)
            let totalPagar: Float? = totalPropina + cuenta!
            txvDesgloce.text = "Cuenta:           \(cuenta!)\nPropina:          \(propina!)%\nTotal Propina: \(totalPropina)\nTotal a Pagar: \(totalPagar!)"
            lblbtnError.text = ""
            lblDesgloce.isHidden = false
            txvDesgloce.isHidden = false
        }else{
            lblDesgloce.isHidden = true
            txvDesgloce.isHidden = true
            lblbtnError.text = "Falta validar informacion"
        }
    }
    var validador : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

func isNum(string: String) -> Bool {
    let telReg = "[0-9]{1,10}"
    let telTest = NSPredicate(format:"SELF MATCHES %@", telReg)
    let result = telTest.evaluate(with: string)
    return result
}
func isNumSmall(string: String) -> Bool {
    let telReg = "[0-9]{1,2}"
    let telTest = NSPredicate(format:"SELF MATCHES %@", telReg)
    let result = telTest.evaluate(with: string)
    return result
}
