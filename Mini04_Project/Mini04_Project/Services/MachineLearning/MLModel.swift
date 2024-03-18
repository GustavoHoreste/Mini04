//
//  MachineLearning.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 15/03/24.
//

import Foundation
import SwiftUI
import CoreML

//Classe que faz as classificacoes do coreMl
class MlModel {
    
    //Variaveis que vao receber os modelos
    private var colorModel:Color7Classifier!
    private var objectsModel:NewHomeObjects!
    
    //MARK: - Funcoes internas para uso dos modelos
    //funcao que utiliza o modelo para classificar o objeto
    private func objectVerify(buffer:CVPixelBuffer) -> NewHomeObjectsOutput {
        do{
            self.objectsModel = try NewHomeObjects(configuration: MLModelConfiguration())
            let prediction = try objectsModel.prediction(image: buffer)
            return prediction
        }catch {
            print(error)
        }
        return NewHomeObjectsOutput(target: "", targetProbability: ["": 0.0])
    }
    
    //funcao que utiliza o modelo para classificar a cor
    private func colorVerify(image:CVPixelBuffer) -> Color7ClassifierOutput {
        do{
            self.colorModel = try Color7Classifier(configuration: MLModelConfiguration())
            let prediction = try colorModel.prediction(image: image)
            return prediction
        }catch {
            print(error)
        }
        return Color7ClassifierOutput(target: "", targetProbability: ["": 0.0])
    }
    
    //MARK: - Funcoes publicas que retornam a classificacao
    //funcao que deve ser chamada para receber a string do objeto classificado, essa recebe uma UIImage
    func verifyObject(image:UIImage) async throws -> String {
        guard let buffer = image.toCVPixelBuffer() else {throw MLErrors.failToConvertImageToBuffer}
        let prediction = objectVerify(buffer: buffer)
        if prediction.target == ""{
            throw MLErrors.failToPredict
        } else {
            return prediction.target
        }
    }
    
    //funcao que deve ser chamada para receber a string do objeto classificado, essa recebe um CVPixelBuffer
    func verifyObject(buffer:CVPixelBuffer) async throws -> String {
        let prediction = objectVerify(buffer: buffer)
        if prediction.target == ""{
            throw MLErrors.failToPredict
        } else {
            return prediction.target
        }
    }
    
    //funcao que deve ser chamada para receber a string da cor classificado, essa recebe uma UIImage
    func verifyColor(image:UIImage) async throws -> String {
        guard let croppedImage = image.cropCenterOfImage(viewWidth: 299, viewHeight: 299) else {throw MLErrors.failToConvertImageToBuffer}
        guard let buffer = croppedImage.toCVPixelBuffer() else {throw MLErrors.failToConvertImageToBuffer}
        let prediction = colorVerify(image: buffer)
        if prediction.target == ""{
            throw MLErrors.failToPredict
        } else {
            return prediction.target
        }
    }
}
