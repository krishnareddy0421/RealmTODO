//
//  AddVC.swift
//  RealmTODO
//
//  Created by vamsi krishna reddy kamjula on 11/26/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit
import RealmSwift

class AddVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var titleTxt: UITextField!
    @IBOutlet weak var timeTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        guard let title = titleTxt.text, let time = timeTxt.text, titleTxt.text != "", timeTxt.text != "" else {
            showAlert("Start Typing")
            return
        }
        
        let work = Work()
        work.workTitle = title
        work.scheduleTime = time
        
        try! realm.write {
            realm.add(work, update: true)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showAlert(_ titleTxt: String) {
        let alert = UIAlertController.init(title: titleTxt, message: "Something went wrong", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
