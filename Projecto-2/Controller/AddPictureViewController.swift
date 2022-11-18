//
//  AddPictureViewController.swift
//  Projecto-2
//
//  Created by Fredy asencios on 27/03/22.
//

import UIKit

class AddPictureViewController: UIViewController  {
    var idMaravilla:String = ""
    var nameImage = ""
    @IBOutlet weak var imagePic: UIImageView!
    @IBOutlet weak var fechaPic: UILabel!
    @IBOutlet weak var tituloPictureTF: UITextField!
    @IBOutlet weak var descripcionTV: UITextView!
    var pickerController = UIImagePickerController()
    var arrayImagesGallary:[[String:String]] = []
    var pictureObj:[String:String] = [:]
    var titulo = ""
    var descripcion = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print(idMaravilla)
        imagePic.roundedImageView()
        diaHoyConFormato()
        pickerController.delegate = self
        // Do any additional setup after loading the view.
        guard  let arrayTest = UserDefaults.standard.object(forKey: "arrayGallery") as? [[String:String]] else {return}
        arrayImagesGallary = arrayTest
    }
    func diaHoyConFormato(){
        let diaHoy = Date()
        fechaPic.text = diaHoy.formatToString(using: .ddMMyyyy)
        
    }
    @IBAction func usandoLibreria(_ sender: Any) {
        pickerController.allowsEditing = true
        pickerController.mediaTypes = ["public.image","public.movie"]
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func grabandoObjetoPic(_ sender: Any) {
        if validateForm(){
        self.pictureObj = ["idMaravilla":self.idMaravilla,
                           "titulo":titulo,
                           "fecha":fechaPic.text!,
                           "descripcion":self.descripcion,
                           "nombrePic":self.nameImage
        ]
        
        arrayImagesGallary.insert(pictureObj, at: 0)
        UserDefaults.standard.set(arrayImagesGallary, forKey: "arrayGallery")
            self.navigationController?.popViewController(animated: true)
        }else{
            return
        }
       
    }
    var isTakePic = false
    func validateForm()->Bool{
        
        if tituloPictureTF.text == "" || descripcionTV.text == "" || isTakePic == false{
            let alert = UIAlertController(title: "alerta", message: "requiere completar los datos tomar imagen", preferredStyle: .alert)
            let btn = UIAlertAction(title: "continuar", style: .default, handler: nil)
            alert.addAction(btn)
            present(alert, animated: true, completion: nil)
            return false
        }else{
            return true
        }
    }
    
}
extension AddPictureViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        isTakePic = !isTakePic
        var newImage:UIImage
        if let posibleImage = info[.editedImage] as? UIImage{
            newImage = posibleImage
        }else if let posibleImage = info[.originalImage] as? UIImage{
            newImage = posibleImage
        }else{return}
        imagePic.contentMode = .scaleAspectFill
        imagePic.image = newImage
        //MARK:nombre imagen random
        let nameImgInt = Int.random(in: 1..<1000)
        self.nameImage = "\(nameImgInt)"
        
        imgClass.saveImageInDocumentDirectory(image: newImage, fileName: self.nameImage)
        
        dismiss(animated: true, completion: nil)
    }
    
}
extension AddPictureViewController:UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.titulo = textField.text ?? ""
        self.descripcionTV.resignFirstResponder()
        
    }
    
}
extension AddPictureViewController:UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.descripcion = textView.text
        if descripcionTV.text == "ingrese descripción" {
            descripcionTV.text = ""
        }
        descripcionTV.text = textView.text
    }
}
