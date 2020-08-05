//
//  ViewController.swift
//  testProject
//
//  Created by harrison on 2020/8/3.
//  Copyright © 2020 harrison. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var SearchTf: UITextField!
    @IBOutlet weak var PerPageTf: UITextField!
    @IBOutlet weak var SendBt: UIButton!
    var search = ""
    var perpage = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        SendBt.isEnabled = false
        SearchTf.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
        PerPageTf.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
        // Do any additional setup after loading the view.
    }
    @IBAction func SendBt(_ sender: Any) {
        self.search = SearchTf.text!
        self.perpage = Int(PerPageTf.text!)!
        SearchTf.text = ""
        PerPageTf.text = ""
        let vc = storyboard?.instantiateViewController(withIdentifier: "DataResultCollectionVC") as? DataResultCollectionViewController
        vc?.perpage = self.perpage
        vc?.search = self.search
        show(vc!, sender: self)
    }


    @objc func textDidChange(_ textField:UITextField) {
        if SearchTf.text != "" && PerPageTf.text != ""  {
            SendBt.backgroundColor = UIColor.blue
            SendBt.isEnabled = true
            }else{
            SendBt.backgroundColor = UIColor.lightGray
            SendBt.isEnabled = false
        }
    }
}

