//
//  UIViewController+Ext.swift
//  NetworLayer
//
//  Created by Shamkhal on 5/12/20.
//

import UIKit
import MBProgressHUD

//MARK: VC handling
extension UIViewController {
    func getVC(id: String, storyboard: String = "Main") -> UIViewController {
        let s = UIStoryboard.init(name: storyboard, bundle: nil)
        return s.instantiateViewController(withIdentifier: id)
    }
    
    func getNav(id: String, storyboard: String = "Main") -> UINavigationController {
        let s = UIStoryboard.init(name: storyboard, bundle: nil)
        return s.instantiateViewController(withIdentifier: id) as! UINavigationController
    }
    
    func presentVC(id: String, storyboard: String = "Main", animate: Bool = true) {
        self.present(self.getVC(id: id, storyboard: storyboard), animated: animate, completion: nil)
    }
    
    func showVC(id: String) {
        self.show(self.getVC(id: id, storyboard: "Main"), sender: nil)
    }
    
    func showVCWithStoryboardId(id: String, storyboard: String = "Main") {
        self.show(self.getVC(id: id, storyboard: storyboard), sender: nil)
    }
    
    func showNavWithStoryboardId(id: String, storyboard: String = "Main") {
        self.show(self.getNav(id: id, storyboard: storyboard), sender: nil)
    }
}

//MARK: Alert handling
extension UIViewController {
    func alert(title: String, message: String, actionButton: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.setValue(alertTitleFontAndSpaceSize(message: title), forKey: "attributedTitle")
        alert.setValue(alertMessageFontAndSpaceSize(message: message), forKey: "attributedMessage")
        
        alert.addAction(UIAlertAction(title: actionButton, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func alertWithCustomSize(title: String, message: String, actionButton: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.setValue(alertTitleFontAndSpaceSize(message: title), forKey: "attributedTitle")
        alert.setValue(alertMessageFontAndSpaceSize(message: message), forKey: "attributedMessage")
        
        alert.addAction(UIAlertAction(title: actionButton, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func alertWithHandler(title: String, message: String, actionButton: String, handler:@escaping ()->Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.setValue(alertTitleFontAndSpaceSize(message: title), forKey: "attributedTitle")
        alert.setValue(alertMessageFontAndSpaceSize(message: message), forKey: "attributedMessage")
        
        alert.addAction(UIAlertAction(title: actionButton, style: .default, handler: { (action) in
            handler()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func alertWithHandlerAction(title: String, message: String, acceptButton: String, cancelButton: String, accept:@escaping ()->Void, cancel:@escaping ()->Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: acceptButton, style: .default, handler: { (action) in
            accept()
        }))
        alert.addAction(UIAlertAction(title: cancelButton, style: .default, handler: { (action) in
            cancel()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func alertTitleFontAndSpaceSize(message: String) -> NSMutableAttributedString {
        let msgAttr = NSMutableAttributedString(string: message)
        msgAttr.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "Roboto-Bold", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .medium),
                             range: NSMakeRange(0, msgAttr.length))
        
        return msgAttr
    }
    
    func alertMessageFontAndSpaceSize(message: String) -> NSMutableAttributedString {
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = 2
        paragraph.alignment = NSTextAlignment.center
        
        let msgAttr = NSMutableAttributedString(string: message)
        msgAttr.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "Roboto-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .regular),
                             range: NSMakeRange(0, msgAttr.length))
        
        msgAttr.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraph, range: NSMakeRange(0, msgAttr.length))
        
        return msgAttr
    }
}

//MARK: Progress handling
extension UIViewController {
    func showProgress() {
        MBProgressHUD.showAdded(to: view, animated: true)
    }
    
    func dismissProgress() {
        MBProgressHUD.hide(for: view, animated: true)
    }
}
