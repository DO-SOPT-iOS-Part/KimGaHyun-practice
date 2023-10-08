//
//  ViewController.swift
//  SOPT33_WEEK1
//
//  Created by Gahyun Kim on 2023/10/08.
//

import UIKit

class ViewController: UIViewController {

    private var idText: String = ""
    private var passwordText: String = ""
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func emailTextField(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let idText = textField.text {
            self.idText = idText
        }
    }
    
    @IBAction func passwordTextField(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let passwordText = textField.text {
            self.passwordText = passwordText
        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        print("\(idText)\n\(passwordText)")
        pushToResultVC()
    }
    //segue로 관리 -> 쉬움 / 복잡, 유지보수 어려워짐
    
    func pushToResultVC() {
    guard let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
        
        resultVC.email = idText
        resultVC.password = passwordText
        
        resultVC.delegate = self
        resultVC.loginDataCompletion = { data in
            print("클로저로 받아온 email : \(data[0]), 클로저로 받아온 password : \(data[1])")
        }
        
        self.navigationController?.pushViewController(resultVC, animated: true)
        //self.present(resultVC, animated: true)  //뒤로가기 버튼 눌러도 화면 전환이 안됨
    }
}

extension ViewController: GetDataProtocol {
    func getLoginData(email: String, password: String) {
        print("받아온 email : \(email), 받아온 password : \(password)")
    }
}
