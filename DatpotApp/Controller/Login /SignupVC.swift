//
//  SignupVC.swift
//  DatpotApp
//
//  Created by PROJECTDUDE on 14/02/18.
//  Copyright © 2018 Datspot. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit
import TwitterKit

class SignupVC: UIViewController  , GIDSignInDelegate , GIDSignInUIDelegate {
    @IBOutlet weak var userNameTF: DesignableTextField!
    @IBOutlet weak var passwordTf: DesignableTextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  self.navigationController?.isNavigationBarHidden = true
        self.userNameTF.layer.cornerRadius = 20.0
        self.userNameTF.clipsToBounds = true
        self.passwordTf.layer.cornerRadius = 20.0
        self.passwordTf.clipsToBounds = true
        self.hideKeyboardWhenTappedAround()

        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func forgotPassAtc(_ sender: Any) {
        
        let paasword = self.storyboard?.instantiateViewController(withIdentifier: "ResetPasswordVC") as! ResetPasswordVC
        self.navigationController?.pushViewController(paasword, animated: true)
        
        
    }
    

    @IBAction func loginAtc(_ sender: Any) {
        view.endEditing(true)
        view.resignFirstResponder()
        
        if userNameTF.text?.count == 0 {
            self.showAlert("Error!", "Please enter username.", "OK")
            return
        }
        
        if passwordTf.text?.count == 0 {
            self.showAlert("Error!", "Please enter password.", "OK")
            return
        }
        let paasword = self.storyboard?.instantiateViewController(withIdentifier: "DiscoverVC") as! DiscoverVC
        self.navigationController?.pushViewController(paasword, animated: true)
        
    }
    
     @IBAction func faceBookAtc(_ sender: Any) {
        
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.loginBehavior = FBSDKLoginBehavior.native
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if (error == nil){
                if(result != nil){
                    
                    let fbloginresult : FBSDKLoginManagerLoginResult = result!
                    if (fbloginresult.grantedPermissions != nil){
                        
                        if (fbloginresult.grantedPermissions.contains("email"))
                        {
                            self.getFBUserData()
                            fbLoginManager.logOut()
                        }
                    }
                }
            }
        }
    
    }
    
    func getFBUserData()
    {
        if((FBSDKAccessToken.current()) != nil){
            
            let fbAccessToken = FBSDKAccessToken.current().tokenString
            guard let token  =  fbAccessToken else
            {
                return
            }
            print(token)
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil)
                {
                    print(result ?? "")
                }
            })
        }
    }
    
    @IBAction func RegisterAtc(_ sender: Any) {
        let paasword = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        self.navigationController?.pushViewController(paasword, animated: true)
    }
    
    @IBAction func twitterAtc(_ sender: Any) {
        
        TWTRTwitter.sharedInstance().logIn { (session, error) in
            if session != nil {
                print("signed in as \(session!.userName)");
                let client = TWTRAPIClient.withCurrentUser()
                let request = client.urlRequest(withMethod: "GET",
                                                urlString: "https://api.twitter.com/1.1/account/verify_credentials.json?include_email=true",
                                                parameters: ["include_email": "true", "skip_status": "true"],
                                                error: nil)
                client.sendTwitterRequest(request) { response, data, connectionError in
                    if (connectionError == nil) {
                        
                        do{
                            let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                            print("Json response: ", json)
                            let firstName = json["name"]
                            let lastName = json["screen_name"]
                            let email = json["email"]
                            print("First name: ",firstName)
                            print("Last name: ",lastName)
                            print("Email: ",email)
                        } catch {
                            
                        }
                        
                    }
                    else {
                        print("Error: \(connectionError)")
                    }
                }
                
                
            } else {
                NSLog("Login error: %@", error!.localizedDescription);
            }
            
        }
    }


    @IBAction func googleAtc(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!)
    {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            
            let userId = user.userID
            let idToken = user.authentication.idToken
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            print(email!)
        }
    }
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
        
    }

}
