//
//  Utilitie.swift
//  Mini04_Project
//
//  Created by Luca Lacerda on 15/03/24.
//

import SwiftUI

extension UIImage {
    
    //Converte a imagem para pixelBuffer
    func toCVPixelBuffer() -> CVPixelBuffer? {
        let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        var pixelBuffer : CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(self.size.width), Int(self.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
        guard (status == kCVReturnSuccess) else {
            return nil
        }
        CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: pixelData, width: Int(self.size.width), height: Int(self.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        UIGraphicsPushContext(context!)
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        UIGraphicsPopContext()
        CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        return pixelBuffer
    }
    
    //Corta a imagem e retorna a imagem cortada
    func cropCenterOfImage(viewWidth: CGFloat, viewHeight: CGFloat) -> UIImage? {
        let centerX = self.size.width / 2.0
        let centerY = self.size.height / 2.0
        let cropWidth = min(viewWidth, self.size.width)
        let cropHeight = min(viewHeight, self.size.height)
        let cropRect = CGRect(x: centerX - cropWidth / 2.0,
                              y: centerY - cropHeight / 2.0,
                              width: cropWidth,
                              height: cropHeight)
        
        guard let cutImageRef = self.cgImage?.cropping(to: cropRect) else {
            return nil
        }
        
        let croppedImage = UIImage(cgImage: cutImageRef)
        return croppedImage
    }
    
}
