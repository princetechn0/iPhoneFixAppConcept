//
//  Button.swift
//  fun
//
//  Created by Ali Ataya on 12/22/19.
//  Copyright © 2019 Ali Ataya. All rights reserved.
//

import Foundation
import UIKit

class Button {
    
    //Vars
    var t = Timer()
    var flag = [Bool?](repeating: nil, count: 6)
    var position:Int = 0
    var pix = [UIImage?](repeating: nil, count: 6)
    
    //Image Arrays for Respective Devices
     var i8Pix = [UIImage?] ( arrayLiteral: UIImage(named: "iphone8Main"), UIImage(named: "i81"), UIImage(named: "i82"), UIImage(named: "i83"),  UIImage(named: "i84"), UIImage(named: "i85"))
    
//Timer Method  ----------------------------------------------------
    func timer(_ label: UILabel, _ str:String, _ ti: Float ) {
        label.isHidden = false
         t = Timer.scheduledTimer(withTimeInterval: TimeInterval(ti), repeats: false, block: { timer in
                       label.textAlignment = .center
            self.textAnimation(label, str)
         })
     }
    

    
//Button Animations ----------------------------------------------------
    func iphoneButtonDisplayer( _ but: UIButton, _ ti: Float) {
        t = Timer.scheduledTimer(withTimeInterval: TimeInterval(ti), repeats: false, block: { timer in
                but.isHidden = false
                self.iphoneButtonAnimator(but, 1.0)
                 })
      }

    
    func iphoneButtonAnimator(_ but: UIButton, _ ti: Float) {
        but.alpha = 0
        UIView.animate(withDuration: TimeInterval(ti), delay: 0.0, options: .curveEaseIn, animations: {
                but.alpha = 1.0
                }, completion: {
                    finished in
                
            })
        }
    
    
//Text Animation ----------------------------------------------------
    func textAnimation(_ label: UILabel, _ text: String) {
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 3
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseOut, animations: {
               label.alpha = 0.0
               }, completion: {
                   finished in

                   if finished {
                       //Once the label is completely invisible, set the text and fade it back in
                       label.text = text

                       // Fade in
                       UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseIn, animations: {
                         label.alpha = 1.0
                           }, completion: {
                               finished in

                               if finished {
                                   //Once the label is completely invisible, set the text and fade it back in
                                     label.text = text

                                   // Fade in
                                UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseIn, animations: {
                                    label.alpha = 0.0
                                       }, completion: nil)
                               }
                       })
                   }
           })
       }
    
    func textAnim(_ label: UILabel, _ text: String) {
        label.isHidden = false
            label.alpha = 0
           UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseIn, animations: {
                  label.alpha = 1.0
                  }, completion: {
                      finished in
        
        })
    }
    
}
