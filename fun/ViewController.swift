//
//  ViewController.swift
//  fun
//
//  Created by Ali Ataya on 12/20/19.
//  Copyright © 2019 Ali Ataya. All rights reserved.
//

import UIKit
import SafariServices
import DropDown



class ViewController: UIViewController{
    
    //Make Status Bar White Color
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //UI ELEMENTS
    @IBOutlet weak var tutorialPics: UIImageView!
    @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var iPhonePickerLabel: UILabel!
    @IBOutlet weak var iPhone8: UIButton!
    @IBOutlet weak var iPhone8Plus: UIButton!
    @IBOutlet weak var iPhoneX: UIButton!
    @IBOutlet weak var ip7plus: UIButton!
    @IBOutlet weak var ip11: UIButton!
    @IBOutlet weak var ip6: UIButton!
    @IBOutlet weak var nextArrow: UIButton!
    @IBOutlet weak var prevArrow: UIButton!
    @IBOutlet weak var aboutPage: UIButton!
    @IBOutlet weak var moreHelpButton: UIButton!
    
    
    //Instaniate button class
    var b = Button()
    
    //DropDown Methods
    let d = DropDown()
    
    //Beginning Code
    override func viewDidLoad() {
        super.viewDidLoad()
        //Animate Beginning Sequence
        b.textAnimation(welcome, "Welcome")
        b.timer(welcome, "Pick an \n iPhone \n to Fix", 1.0)
        
        // Do any additional setup after loading the view.
        startMethod(4)
    }
    
    func dropMenu() {
        d.anchorView = moreHelpButton
        d.dataSource = ["Youtube", "iFixIt"]
        DropDown.appearance().selectionBackgroundColor = UIColor.lightGray
        
        // Action triggered on selection
        d.selectionAction = { [unowned self] (index: Int, item: String) in
            switch index {
            case 0:
                self.webLoader(URL(string: "https://www.youtube.com/watch?v=2B1ZxR9xpwQ&t=211s")!)
            case 1:
                self.webLoader(URL(string: "https://www.ifixit.com/Guide/iPhone+8+Screen+Replacement/98255")!)
            default: break
            }
        }
        
        d.show()
    }
    
    
    func startMethod(_ ti: Float) {
        //Reset position
        b.position = 0
        //Reset iPhone Picker Label
        iPhonePickerLabel.text = "iPhone Fix"
        //Hides on Screen Elements
        hider()
        //Display buttons after X seconds
        b.t = Timer.scheduledTimer(withTimeInterval: TimeInterval(ti),  repeats: false, block: { timer in
                self.showButtons()
                       })
    }
    
    
        
        
//Hides all buttons and respective UI elements
    func hider() {
        iphoneButtonHider()
        labelHider()
    }
    
    func iphoneButtonHider() {
        iPhone8.isHidden = true
        ip6.isHidden = true
        iPhoneX.isHidden = true
        iPhone8Plus.isHidden = true
        ip11.isHidden = true
        ip7plus.isHidden = true
        aboutPage.isHidden = true
        moreHelpButton.isHidden = true
        d.hide()
    }
    
    func labelHider() {
               self.iPhonePickerLabel.isHidden = true
               tutorialPics.isHidden = true
               nextArrow.isHidden = true
               prevArrow.isHidden = true
    }
    
//Shows all Buttons
    func showButtons(){
        b.iphoneButtonDisplayer(iPhone8, 0.3)
        b.iphoneButtonDisplayer(iPhone8Plus, 1.0)
        b.iphoneButtonDisplayer(iPhoneX, 0.8)
        b.iphoneButtonDisplayer(ip6, 1.3)
        b.iphoneButtonDisplayer(ip7plus,1.8)
        b.iphoneButtonDisplayer(ip11, 1.6)
        b.textAnim(iPhonePickerLabel, "iPhone Fix")
        b.iphoneButtonDisplayer(aboutPage, 0.2)
    }
    
//Arrows ------------------------------------------------------------------
    
    
    //associates an image to respective elements upon prev/next button click
    func nextButton(_ pickerLabel: String, _ nextImage: UIImage) {
           iPhonePickerLabel.text = pickerLabel
           tutorialPics.image = nextImage
            
       }
    
    //Next Arrow
    @IBAction func nextArrowAction(_ sender: Any) {
        b.position += 1
        imageDisplayer(b.pix)
      }
    
    //Previous Arrow
    @IBAction func prevArrow(_ sender: Any) {
        b.position -= 1
        imageDisplayer(b.pix)
    }
    
    
    //iphone Method Actions
    func imageDisplayer(_ img: [UIImage?]) {
        switch b.position {
        case 0:
            nextButton("iPhone 8 Great.", img[0]!)
        case 1:
            nextButton("Step 1. Remove Screws", img[1]!)
        case 2:
            nextButton("Step 2. Open Screen", img[2]!)

        case 3:
            nextButton("Step 3. Remove Screen", img[3]!)
            
        case 4:
            nextButton("Step 4. Remove Camera", img[4]!)
            
        case 5:
            nextButton("Step 5. Replace Screen", img[5]!)
            
        case 6:
            moreHelpButton.isHidden = false
            nextButton("All Done!", #imageLiteral(resourceName: "iphone8Main"))
            
            
        default:
            startMethod(0)
        }
    }
    
    
    
//Tutorials ------------------------------------------------
    
    //iphone Button Clicker Methods
    @IBAction func iphone8Action(_ sender: Any) {
        b.flag[0] = true
        tutorialPicker(0)
    }
    
    @IBAction func iphone8PlusAction(_ sender: Any) {
        b.flag[1] = true
        tutorialPicker(1)
    }
    
    //OPEN URL FOR IFIXIT
    @IBAction func iphoneXAction(_ sender: Any) {
        webLoader(URL(string: "https://www.ifixit.com/Guide/iPhone+X+Screen+Replacement/102423")!)
        
    }
    
    
    //Methods
    func tutorialPicker(_ num: Int) {
           switch num {
           case 0:
              iphone8Tutorial()
           case 1:
                iphone8PlusTut()
           default:
               break
           }
       }
    
    func iphone8Tutorial() {
          iphoneButtonHider()
          self.iPhonePickerLabel.isHidden = false
          tutorialPics.isHidden = false
          nextArrow.isHidden = false
        prevArrow.isHidden = false
        
        //Assign Global Pix Var
        b.pix = b.i8Pix
        //First View
        imageDisplayer(b.pix)
          
      }
    
    func iphone8PlusTut() {
        iphoneButtonHider()
        //label
        self.iPhonePickerLabel.isHidden = false
        tutorialPics.isHidden = false
        nextArrow.isHidden = false
        prevArrow.isHidden = false
        
        //step0
        iPhonePickerLabel.text = "iPhone 8 Plus. Nice."
        tutorialPics.image = UIImage(named: "iphone8Main")

//        //Assign Global Pix Var
//        pix = i8PlusPix
//
    }
    
    
    
//About Page ------------------------------------------------
    @IBAction func aboutPagePresenter(_ sender: Any) {
        let aboutPage = UIAlertController(title: "About", message: "princeTechn0 on gitHub \n Test Concept... \n Enjoi", preferredStyle: .alert)
        aboutPage.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(aboutPage, animated: true, completion: nil)
    }
    
    
//More HELP
    @IBAction func moreHelpPresenter(_ sender: Any) {
        dropMenu()
    }
    
    
    
    

//IN APP SAFARI ------------------------------------------------
    func webLoader(_ site: URL) {
        let svc = SFSafariViewController(url: site)
        present(svc, animated: true, completion: nil)
        
    }
    

    
    
}



