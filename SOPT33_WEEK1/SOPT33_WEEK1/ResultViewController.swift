//
//  ResultViewController.swift
//  SOPT33_WEEK1
//
//  Created by Gahyun Kim on 2023/10/08.
//


import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    var loginDataCompletion: (([String]) -> Void)? //스트링 타입의 배열을 매개변수로 전달 할거고, 리턴타입은 void다!
                              
    var delegate: GetDataProtocol?
    
    var email: String = ""
    var password: String = ""

    private func bindText() {
        self.emailLabel.text = "email : \(email)"
        self.passwordLabel.text = "password : \(password)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindText()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
        if self.navigationController != nil     //내 navigationCotroller가 존재한다면 => 스택 안에 있음 push를 함
        {
            self.navigationController?.popViewController(animated: true)
            //뒤로가기 버튼을 누르면 화면 나가짐 -> popViewController 함수 사용 (스택 관리)
        }
        else {
            self.dismiss(animated: true)
        }
    
        delegate?.getLoginData(email: self.email, password: self.password)
        guard let loginDataCompletion else {return}
        loginDataCompletion([self.email, self.password])
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
