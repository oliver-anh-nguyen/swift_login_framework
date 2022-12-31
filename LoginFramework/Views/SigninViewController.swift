//
//  SigninViewController.swift
//  LoginFramework
//
//  Created by AnhNguyen on 31/12/2022.
//

import UIKit

extension UITextField {
    func setColorPlaceholder() {
        let placeholderUsername = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        self.attributedPlaceholder = placeholderUsername
    }
    
    func setColorClearButton() {
        if let clearButton = self.value(forKey: "_clearButton") as? UIButton {
            let templateImage = clearButton.imageView?.image?.withRenderingMode(.alwaysTemplate)
            clearButton.setImage(templateImage, for: .normal)
            clearButton.tintColor = .darkGray
        }
    }
}

public class SigninViewController: UIViewController {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblTextSignin: UILabel!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnSignin : UIButton!
    @IBOutlet weak var lineUsername : UIView!
    @IBOutlet weak var linePassword : UIView!
    @IBOutlet weak var imgIconUsername : UIImageView!
    @IBOutlet weak var imgIconPassword : UIImageView!
    @IBOutlet weak var heightLogo: NSLayoutConstraint!

    private var signinPresenter: SigninPresenterProtocol?
    
    public convenience init() {
        self.init(nibName: "SigninViewController", bundle: Bundle(for: SigninViewController.self))
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        observeKeyboard()
        initService()
    }
    
    private func initService() {
        if signinPresenter == nil {
            let signinModelValidator = SigninModelValidator()
            //let webservice = SigninWebService(urlString: "https://test.com")
            let mockservice = MockWebService()
            signinPresenter = SigninPresenter(formModelValidator: signinModelValidator,
                                              webservice: mockservice,
                                              delegate: self)
        }
    }
    
    private func observeKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(SigninViewController.keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SigninViewController.keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func updateUI() {
        tfUsername.setColorPlaceholder()
        tfPassword.setColorPlaceholder()
        
        tfUsername.setColorClearButton()
        tfPassword.setColorClearButton()
        
        btnSignin.layer.cornerRadius = btnSignin.frame.height / 2
        scaleUISupportAllDevices()
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    private func scaleUISupportAllDevices() {
        let screenSize: CGRect = UIScreen.main.bounds
        if screenSize.height <= 568 {
            lblTextSignin.isHidden = true
            heightLogo.constant = 150
        }
    }
    
    @IBAction func signinAction(_ sender: Any) {
        let signinFormModel = SigninFormModel(username: tfUsername.text ?? "",
                                              password: tfPassword.text ?? "")
        signinPresenter?.processUserSignin(formModel: signinFormModel)
    }
    
    func displayAlertWithMessage(message: String,
                                       viewController: UIViewController) {
        let alert = UIAlertController(title: "Attention", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}

extension SigninViewController : UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.tfUsername {
            self.tfPassword.becomeFirstResponder()
        } else {
            self.tfPassword.resignFirstResponder()
        }
        return true
    }
}

