//
//  ItemsToFindModel.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 18/03/24.
//

import Foundation

class ItemsToFindModel {
    
    var objects: [String] = ["Armario", "Bicicleta", "Bone", "Cadeira", "Calçados", "Cama", "Camisa", "Caneca", "Caneta", "Chave de fenda", "Chuveiro", "Clipe de papel", "Cola Bastao", "Colher", "Espatula", "Flauta", "Frigideira", "Geladeira", "Impressora", "Livro:Caderno", "Lixeira", "Martelo", "Mesa", "Mochila", "Oculos", "Papel higienico", "Parafusadeira", "Pente", "Pilha", "Porta", "Regua", "Shorts:Calca", "Sofa", "TV", "Teclado", "Tesoura", "Toalha", "Vaso sanitario", "Ventilador"]
    
    var colors: [String] = ["blue", "green", "pink", "purple", "red", "white", "yellow"]
    
    var timeRemaining = 120
    var toFindObject: String = ""
    var numberOfObjects: Int = 0
    var showPopOver: Bool = false
    var defeatShow: Bool  = false
    var objectIsRigt: Bool = false
    var findedObjects: [String] = []{
        didSet{
            numberOfObjects = findedObjects.count
        }
    }
    
    init() {
        chooseObject()
    }
    
    func chooseObject() {
        if numberOfObjects < 10 {
            let actualObject = toFindObject
            while(actualObject == toFindObject){
                toFindObject = objects.filter{!findedObjects.contains($0)}.randomElement()!
            }
        } else {
            toFindObject = "Nenhum"
        }
    }
    
    func findedObject() {
        findedObjects.append(toFindObject)
        chooseObject()
    }
}
