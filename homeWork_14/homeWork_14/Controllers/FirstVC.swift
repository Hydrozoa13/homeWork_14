//
//  FirstVC.swift
//  homeWork_14
//
//  Created by Евгений Лойко on 20.08.23.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    
    @IBAction func goToSecondVC(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSecondVC", sender: "Hello from FirstVC")
    }
    
    @IBAction func goToThirdVC(_ sender: UIButton) {
        let thirdVC = ThirdVC(nibName: "ThirdVC", bundle: nil)
        thirdVC.dataString = "Hello from FirstVC"
        thirdVC.navigationItem.title = "XIB VC"
        
        navigationController?.pushViewController(thirdVC, animated: true)
    }
    
    @IBAction func goToFourthWithoutSegue() {
        let storyboard = UIStoryboard(name: "SecondStoryboard", bundle: nil)
        guard let fourthVC = storyboard.instantiateViewController(withIdentifier: "FourthVC") as? FourthVC
        else { return }
        fourthVC.navigationItem.title = "FourthVC"
        fourthVC.dataString = "Hello from FirstVC"
        present(fourthVC, animated: true)
    }
    
    @IBAction func unwindToFirstVC(_ unwindSegue: UIStoryboardSegue) {
        if let fourthVC = unwindSegue.source as? FourthVC {
            labelText.text = fourthVC.dataString
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondVC",
           let secondVC = segue.destination as? SecondVC,
           let dataString = sender as? String
        {
            secondVC.dataString = dataString
            secondVC.firstVC = self
        } else if segue.identifier == "goToFourthVC",
                  let fourthVC = segue.destination as? FourthVC
        {
            fourthVC.dataString = "Hello to everybody"
        }
    }
}
