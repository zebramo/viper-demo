//
//  BaseVC.swift
//  Viper Demo
//
//  Created by Samet Gundogmus on 7.01.2019.
//  Copyright © 2019 Samet Gundogmus. All rights reserved.
//

import Foundation
import UIKit

class BaseVC: UIViewController {
    
    
    let activityView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLoadingView()
    }
    
    func showLoading(){
        activityView.startAnimating()
    }
    
    func hideLoading(){
        activityView.stopAnimating()
    }
    
    
    func initLoadingView(){
        activityView.center = self.view.center
        activityView.color = UIColor.gray
        self.view.addSubview(activityView)
    }
    
    
    func showMessageWithOkButton(title:String,message:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) in
            alertController.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
}
