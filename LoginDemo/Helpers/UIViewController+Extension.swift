// Created by Anatoly Qstove on 29.10.2021.

import Foundation
import UIKit

extension UIViewController {
    
    func alert(_ title: String = "Alert", message: String){
        showAlertController(title: title, message: message, addDefaultAction: true)
    }
    
    func showAlertController(title: String, message: String, actions: [UIAlertAction] = [], addDefaultAction: Bool = false) {
        let alertController = UIAlertController(title: title, message: "\(message)", preferredStyle: .alert)
        if addDefaultAction {
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(action)
        }
        for action in actions {
            alertController.addAction(action)
        }
        present(alertController, animated: true)
    }

    
    
    
}
