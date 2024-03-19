//
//  CoreMlErrorsEnum.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 18/03/24.
//

import Foundation

//Enum para erros que podem ocorrer com o coreML
enum MLErrors: Error {
    case failToPredict
    case failToConvertImageToBuffer
}
