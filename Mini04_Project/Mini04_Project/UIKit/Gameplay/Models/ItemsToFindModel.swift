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
    
    var objects: [String] = [
        String(localized: "Armario"),
        String(localized: "Bicicleta"),
        String(localized: "Bone"),
        String(localized: "Cadeira"),
        String(localized: "Calçados"),
        String(localized: "Cama"),
        String(localized: "Camisa"),
        String(localized: "Caneca"),
        String(localized: "Caneta"),
        String(localized: "Chave de fenda"),
        String(localized: "Chuveiro"),
        String(localized: "Clipe de papel"),
        String(localized: "Cola Bastao"),
        String(localized: "Colher"),
        String(localized: "Cortina"),
        String(localized: "Espatula"),
        String(localized: "Flauta"),
        String(localized: "Frigideira"),
        String(localized: "Geladeira"),
        String(localized: "Impressora"),
        String(localized: "Livro"),
        String(localized: "Lixeira"),
        String(localized: "Martelo"),
        String(localized: "Mesa"),
        String(localized: "Mochila"),
        String(localized: "Oculos"),
        String(localized: "Papel higienico"),
        String(localized: "Parafusadeira"),
        String(localized: "Pente"),
        String(localized: "Pilha"),
        String(localized: "Porta"),
        String(localized: "Regua"),
        String(localized: "Shorts"),
        String(localized: "Sofa"),
        String(localized: "TV"),
        String(localized: "Teclado"),
        String(localized: "Tesoura"),
        String(localized: "Toalha"),
        String(localized: "Vaso sanitario"),
        String(localized: "Ventilador")
    ]
    
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
    
    func setColors() {
        if withColors {
            let colors: [String] = [
                String(localized: "Azul"),
                String(localized: "Verde"),
                String(localized: "Rosa"),
                String(localized: "Roxo"),
                String(localized: "Vermelho"),
                String(localized: "Branco"),
                String(localized: "Amarelo")
            ]
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
