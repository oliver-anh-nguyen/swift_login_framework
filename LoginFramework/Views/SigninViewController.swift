//
//  SigninViewController.swift
//  LoginFramework
//
//  Created by AnhNguyen on 31/12/2022.
//

import UIKit

extension UITextField {
    func setColorPlaceholder(color: UIColor) {
        let placeholderUsername = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: color])
        self.attributedPlaceholder = placeholderUsername
    }
    
    func setColorClearButton(color: UIColor) {
        if let clearButton = self.value(forKey: "_clearButton") as? UIButton {
            let templateImage = clearButton.imageView?.image?.withRenderingMode(.alwaysTemplate)
            clearButton.setImage(templateImage, for: .normal)
            clearButton.tintColor = color
        }
    }
}

public class SigninViewController: UIViewController {

    @IBOutlet weak var bgImage: UIImageView!
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
    @IBOutlet weak var btnForgotPassword: UIButton!
    
    private var signinPresenter: SigninPresenterProtocol?
    public var layout:Layout?
    
    public convenience init() {
        self.init(nibName: "SigninViewController", bundle: Bundle(for: SigninViewController.self))
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    
        updateUI()
        applyLayout()
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
        let primaryColor = UIColor(red: 56/255.0, green: 112/255.0, blue: 58/255.0, alpha: 1.0)
        tfUsername.setColorPlaceholder(color: primaryColor.withAlphaComponent(0.5))
        tfPassword.setColorPlaceholder(color: primaryColor.withAlphaComponent(0.5))
        
        tfUsername.setColorClearButton(color: primaryColor)
        tfPassword.setColorClearButton(color: primaryColor)
        
        btnSignin.layer.cornerRadius = btnSignin.frame.height / 2
        btnForgotPassword.setTitleColor(primaryColor, for: .normal)
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

