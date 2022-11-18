//
//  GalleryTableViewController.swift
//  Projecto-2
//
//  Created by Fredy asencios on 27/03/22.
//

import UIKit

class GalleryTableViewController: UITableViewController {
    
    
    @IBOutlet weak var nombreLugarLbl: UILabel!
    @IBOutlet weak var lugarImagen: UIImageView!
    
    var objLugar:Maravilla?
    var arrayPicsGallary:[[String:String]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        lugarImagen.roundedImageView()
//        print("nombreSeleccionado:",objLugar?.nombre)
        let nombreLugar = objLugar?.nombre
        nombreLugarLbl.text = nombreLugar
         let nombreImagen = objLugar?.imagen ?? ""
        lugarImagen.image = UIImage(named: nombreImagen)
    }
    override func viewWillAppear(_ animated: Bool) {
        guard  let arrayTest = UserDefaults.standard.object(forKey: "arrayGallery") as? [[String:String]] else {return}
//        arrayPicsGallary = arrayTest
        arrayPicsGallary = filtrarPorId(arrayDatos: arrayTest, id: objLugar?.id ?? "1")
        tableView.reloadData()
    }
    func filtrarPorId(arrayDatos:[[String:String]] ,id:String)->[[String:String]]{
        var arrayPicsGalleryfiltrado:[[String:String]] = []
        for item in arrayDatos{
            if item["idMaravilla"] == id {
                arrayPicsGalleryfiltrado.insert(item, at: 0)
            }
        }
        return arrayPicsGalleryfiltrado
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayPicsGallary.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellGallery", for: indexPath) as! GalleryCustomCellTableViewCell

        let objPic = arrayPicsGallary[indexPath.row]
        let nombreTitulo = objPic["titulo"]
        let fecha = objPic["fecha"]
        let descripcion = objPic["descripcion"]
        let imageName = objPic["nombrePic"] ?? "avatar"
        
        cell.nombrePicLbl.text = nombreTitulo
        cell.fechaPicLbl.text = fecha
        cell.descripPicLbl.text = descripcion
        
        cell.imagePicCell.image  = openToFile(imageName)
        return cell
    }
    func openToFile(_ name: String)->UIImage {

        guard  let imageLoaded = imgClass.loadImageFromDocumentDirectory(fileName: name) else {return UIImage()}
        return imageLoaded

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "toAddPicVC" {
            let objAddPic = segue.destination as! AddPictureViewController
            objAddPic.idMaravilla = objLugar?.id ?? "1"
        }
    }
}
