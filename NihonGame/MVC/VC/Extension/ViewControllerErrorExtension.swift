//
//  UiViewControllerErrorExtension.swift
//  NihonGame
//
//  Created by Nicolas on 13/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

/** Error enum **/
enum ErrorList : String, Error {
    case unknowError = "An unknown error as occured. \nPlease try again later."
}

/** Error protocole to handle error**/
protocol ErrorProtocole {
    func errorHandling(error: Error)
}

/** Create the Alert controller **/
extension ErrorProtocole {
    func createAlertController(error: Error) -> UIAlertController{
        guard let error = error as? ErrorList else {
            print("error casting error")
            return UIAlertController()
        }

        let alert = UIAlertController(title: "An Error as Occured", message: error.rawValue, preferredStyle: .alert)
        return alert
    }
}

/** Extension of the uiviencontroller to throw error to the user **/
extension UIViewController : ErrorProtocole {
    /** throw and error to the user
     -Parameters:
     - error: Error of ErrorList type.
     */
    func errorHandling(error: Error) {
        let alert = createAlertController(error: error)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated:true, completion: nil)
    }
}
