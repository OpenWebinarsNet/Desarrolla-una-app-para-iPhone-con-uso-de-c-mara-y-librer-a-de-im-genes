//
//  HomeViewController.swift
//  Projecto-2
//
//  Created by Fredy asencios on 25/03/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var lugarImageView: UIImageView!
    @IBOutlet weak var selectLugarSControl: UISegmentedControl!
    
    @IBOutlet weak var nombreLugarLbl: UILabel!
    @IBOutlet weak var ciudadPaisLbl: UILabel!
    @IBOutlet weak var detalleLugarTxtView: UILabel!
    @IBOutlet weak var fondoView: UIView!
    @IBOutlet weak var btnGallery: UIButton!
    var maravillaSeleccionada:Maravilla?
    var arrayMaravillas:[Maravilla] = []
      override func viewDidLoad() {
          super.viewDidLoad()
          arrayMaravillas = Maravilla.dataSource()
          fondoView.roudedView()
          btnGallery.roudedButton()
          cambiandoLugar(selectLugarSControl)
      }
    
    @IBAction func cambiandoLugar(_ sender: Any) {
        let indexLugarSelected = selectLugarSControl.selectedSegmentIndex
        let maravillaSeleccionada = seleccionarLugarCon(indexLugar:indexLugarSelected )
        self.maravillaSeleccionada = maravillaSeleccionada 
        lugarImageView.image = UIImage(named: maravillaSeleccionada.imagen)
        nombreLugarLbl.text = maravillaSeleccionada.nombre
        ciudadPaisLbl.text = maravillaSeleccionada.ciudadPais
        detalleLugarTxtView.text = maravillaSeleccionada.descripcion
    }
    func seleccionarLugarCon(indexLugar:Int)->Maravilla{
        
        return arrayMaravillas[indexLugar]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGallerry"{
            let objDestino = segue.destination as! GalleryTableViewController // castear , cast
            objDestino.objLugar = self.maravillaSeleccionada
        }
    }
    

}
