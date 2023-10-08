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
        textField.clearButtonMode = .always     //textField의 오른쪽 -> 입력 내용 한 번에 삭제
    }
    
    @IBAction func passwordTextField(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let passwordText = textField.text {
            self.passwordText = passwordText
        }
        textField.clearButtonMode = .always     //textField의 오른쪽 -> 입력 내용 한 번에 삭제
        textField.isSecureTextEntry = true  //비밀번호 숨겨서 보여주기
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        print("\(idText)\n\(passwordText)")
        sender.backgroundColor = UIColor.black  //button 배경 색
        sender.tintColor = UIColor.white    //button 글자 색
        sender.layer.masksToBounds = true   //button 둥글게
        sender.layer.cornerRadius = 8       //button 테두리 반지름 -> 클수록 둥글어짐
        
        
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
