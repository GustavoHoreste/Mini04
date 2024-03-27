//
//  ItemsToFindModel.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 18/03/24.
//

import Foundation

protocol ItemsDelegate: AnyObject {
    func findedObjectAction()
}

class ItemsToFindModel {
    
    weak var delegate: ItemsDelegate?
    
    var objects: [String] = ["Armario", "Bicicleta", "Bone", "Cadeira", "Calçados", "Cama", "Camisa", "Caneca", "Caneta", "Chave de fenda", "Chuveiro", "Clipe de papel", "Cola Bastao", "Colher", "Cortina","Espatula", "Flauta", "Frigideira", "Geladeira", "Impressora", "Livro:Caderno", "Lixeira", "Martelo", "Mesa", "Mochila", "Oculos", "Papel higienico", "Parafusadeira", "Pente", "Pilha", "Porta", "Regua", "Shorts:Calca", "Sofa", "TV", "Teclado", "Tesoura", "Toalha", "Vaso sanitario", "Ventilador"]
    
    var toFindObject: String = ""
    var toFindShuffled: String = ""
    var specialObject: String = ""
    var numberOfObjects: Int = 0
    var findedObjects: [String] = []{
        didSet{
            numberOfObjects = findedObjects.count
        }
    }
    var withColors = true
    var shuffleIsOn = false
    
    init() {
        chooseObject()
    }
    
    func setColors() {
        if withColors {
            let colors: [String] = ["Azul", "Verde", "Rosa", "Roxo", "Vermelho", "Branco", "Amarelo"]
            for color in colors {
                objects.append(color)
            }
        }
    }
    
    func chooseObject() {
        if numberOfObjects < objects.count{
            let actualObject = toFindObject
            while(actualObject == toFindObject){
                toFindObject = objects.filter{!findedObjects.contains($0)}.randomElement()!
            }
            if shuffleIsOn {
                toFindShuffled = toFindObject.shuffled()
            }
        }else {
            toFindObject = "Nenhum"
        }
    }
    
    func chooseSpecialObject() {
        let item = objects.randomElement()
        
        if let item = item {
            specialObject = item
            objects.removeAll(where: {$0 == item})
        }
    }
    
    func findedObject() {
        findedObjects.append(toFindObject)
        chooseObject()
        delegate?.findedObjectAction()
    }
    
    func shufflePower() {
        shuffleIsOn = true
    }
}
