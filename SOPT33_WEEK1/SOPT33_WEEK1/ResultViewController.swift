//
//  ResultViewController.swift
//  SOPT33_WEEK1
//
//  Created by Gahyun Kim on 2023/10/08.
//


import UIKit

class ResultViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var selectInfo: UILabel!
    @IBOutlet weak var pickerInfo: UIPickerView!
    
    var loginDataCompletion: (([String]) -> Void)? //스트링 타입의 배열을 매개변수로 전달 할거고, 리턴타입은 void다!
                              
    var delegate: GetDataProtocol?
    
    var email: String = ""
    var password: String = ""

    private let maxselect = 2
    private let pickerViewcount = 1   //피커뷰 열 1개
    var pickerinfo = ["email", "password"]  //피커뷰 목록
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emptyCheck()
        setStyle()
    }
    
    func setStyle() {
        selectInfo.font = .systemFont(ofSize: 20, weight: .semibold)
        selectInfo.textColor = .brown
    }
    
    
    private func emptyCheck() {
        if email == "" || password == "" {
            let alertController = UIAlertController(title: "ERROR", message: "이메일 또는 비밀번호를 입력하세요.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerinfo.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerViewcount
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerinfo[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {
            selectInfo.text = "email : \(email)"
        }
        else {
            selectInfo.text = "password : \(password)"
        }
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
    

}




