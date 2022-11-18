//
//  Maravilla.swift
//  Projecto-2
//
//  Created by Fredy asencios on 25/03/22.
//

import Foundation

struct Maravilla{
    let id:String
    let imagen:String
    let nombre:String
    let ciudadPais:String
    let descripcion:String
    
 static  func dataSource()->[Maravilla]{
        let m1 = Maravilla(id: "1",
                           imagen: "coliseoRomano",
                           nombre: "Coliseo Romano",
                           ciudadPais: "Roma - Italia",
                           descripcion: "Vista de sur a norte. A la izquierda se ve el sector Hanan de la ciudad (con la estructura piramidal de la colina del Intihuatana) y a la derecha el sector Oriente, separadas por la plaza principal. Al fondo el Cerro Huayna Picchu. La imagen está tomada desde lo alto del sector agrícola, al sur del complejo")
        let m2 = Maravilla(id: "2",
                            imagen: "mp",
                           nombre:"Macchu Picchu",
                           ciudadPais: "Cusco - Perú",
                           descripcion:"Vista de sur a norte. A la izquierda se ve el sector Hanan de la ciudad (con la estructura piramidal de la colina del Intihuatana) y a la derecha el sector Oriente, separadas por la plaza principal. Al fondo el Cerro Huayna Picchu. La imagen está tomada desde lo alto del sector agrícola, al sur del complejo."
                            )
        
        let m3 = Maravilla(
                            id:"3",
                            imagen: "tm",
                           nombre:"Tal Mahal",
                           ciudadPais: "Agra - India",
                           descripcion:"The Taj Mahal (/ˌtɑːdʒ məˈhɑːl, ˌtɑːʒ-/;[4] lit. 'Crown of the Palace', [taːdʒ ˈmɛːɦ(ə)l]),[5] is an ivory-white marble mausoleum on the right bank of the river Yamuna in the Indian city of Agra. It was commissioned in 1632 by the Mughal emperor Shah Jahan (r. 1628–1658) to house the tomb of his favourite wife, Mumtaz Mahal; it also houses the tomb of Shah Jahan himself. The tomb is the centrepiece of a 17-hectare (42-acre) complex, which includes a mosque and a guest house, and is set in formal gardens bounded on three sides by a crenellated wall."
                           )
        return [m1,m2,m3]
    }
}
