//
//  FourthVC.swift
//  homeWork_14
//
//  Created by Евгений Лойко on 20.08.23.
//

import UIKit

class FourthVC: UIViewController {

    var dataString: String?
    
    weak var firstVC: FirstVC?
    
    @IBOutlet weak var labelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelText.text = dataString
    }
  
    @IBAction func backAction(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindToFirstVC", sender: nil)
    }
}
