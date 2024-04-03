//
//  PreSingleViewController.swift
//  Mini04_Project
//
//  Created by André Felipe Chinen on 22/03/24.
//

import UIKit

class PreSingleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.async {
            let gameplay = SingleViewController()
            
            if let navigationController = self.navigationController {
                navigationController.pushViewController(gameplay, animated: false)
            }
        }
    }
}
