//
//  UIViewController+Utility.swift
//
//  Created by subhajit halder on 23/12/16.
//

import Foundation
import UIKit
import FCAlertView
import CoreData
import SWMessages


let kAlertTintColor = UIColor(red: CGFloat(0.49), green: CGFloat(0.03), blue: CGFloat(0.31), alpha: CGFloat(1.0))

typealias AlertCompletion = (_ object: Any?,_ actionId: Int?) -> Void

extension UIViewController {
    
    
    func setNavColor() {
        guard let navView = self.view.viewWithTag(1001) else {
            return
        }
        navView.backgroundColor = UIColor.themeGreen
        navView.layoutIfNeeded()
    }
    
    
  
    @IBAction func back(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
   
    
    
    @objc(positionForBar:) func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    

    
    func showErrorAlert(title: String, message:String, handler: @escaping AlertCompletion) {
        let alert = SHAlertController(type: .error, title: title, body: message, buttonTitle: "OK")
        alert.actionPerformed { (action) in
            handler(nil, action)
        }
        self.present(alert, animated: true, completion: .none)
        
    }
    
    func showErrorAlert(title: String, message:String, buttonTitle: String, handler: @escaping AlertCompletion) {
        let alert = SHAlertController(type: .error, title: title, body: message, buttonTitle: buttonTitle)
        alert.actionPerformed { (action) in
            handler(nil, action)
        }
        self.present(alert, animated: true, completion: .none)
        
    }
    
    func showAlert(withTitle title: String?, andMessage msg: String?) {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let firstView: UIView? = alertController.view.subviews.first
        let secView: UIView? = firstView?.subviews.first
        secView?.backgroundColor = UIColor(red: CGFloat(0.996), green: CGFloat(0.996), blue: CGFloat(0.980), alpha: CGFloat(1.00))
        secView?.layer.cornerRadius = 3.0
        alertController.view.tintColor = kAlertTintColor
        let actionOk = UIAlertAction(title: "Ok", style: .cancel, handler: {(_ action: UIAlertAction) -> Void in
            alertController.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(actionOk)
        DispatchQueue.main.async(execute: {() -> Void in
            if !(self.presentedViewController is (UIAlertController)) {
                self.present(alertController, animated: true, completion: nil)
            }
        })
    }
    
    
    func showAlert(withTitle title: String?, andMessage msg: String?, handler: @escaping AlertCompletion) {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let firstView: UIView? = alertController.view.subviews.first
        let secView: UIView? = firstView?.subviews.first
        secView?.backgroundColor = UIColor(red: CGFloat(0.996), green: CGFloat(0.996), blue: CGFloat(0.980), alpha: CGFloat(1.00))
        secView?.layer.cornerRadius = 3.0
        alertController.view.tintColor = kAlertTintColor
        let actionOk = UIAlertAction(title: "Ok", style: .cancel, handler: {(_ action: UIAlertAction) -> Void in
            alertController.dismiss(animated: true, completion: nil)
            DispatchQueue.main.async(execute: {() -> Void in
                handler(nil, 0)
            })
        })
        alertController.addAction(actionOk)
        DispatchQueue.main.async(execute: {() -> Void in
            if !(self.presentedViewController is (UIAlertController)) {
                self.present(alertController, animated: true, completion: nil)
            }
        })
    }
    
    
}

extension UIViewController {
    func configureChildViewController(childController: UIViewController, onView: UIView?) {
        var holderView = self.view
        if let onView = onView {
            holderView = onView
        }
        addChildViewController(childController)
        holderView?.addSubview(childController.view)
        constrainViewEqual(holderView: holderView!, view: childController.view)
        childController.didMove(toParentViewController: self)
        childController.willMove(toParentViewController: self)
    }
    
    func removeChildViewController(childController: UIViewController) {
        childController.willMove(toParentViewController: nil)
        childController.view.removeFromSuperview()
        childController.removeFromParentViewController()
    }
    
    
    func constrainViewEqual(holderView: UIView, view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        //pin 100 points from the top of the super
        let pinTop = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal,
                                        toItem: holderView, attribute: .top, multiplier: 1.0, constant: 0)
        let pinBottom = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal,
                                           toItem: holderView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let pinLeft = NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal,
                                         toItem: holderView, attribute: .left, multiplier: 1.0, constant: 0)
        let pinRight = NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal,
                                          toItem: holderView, attribute: .right, multiplier: 1.0, constant: 0)
        
        holderView.addConstraints([pinTop, pinBottom, pinLeft, pinRight])
    }}
