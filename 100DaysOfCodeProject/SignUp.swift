//
//  SignUp.swift
//  100DaysOfCodeProject
//
//  Created by Malik Hawkins on 5/27/20.
//  Copyright © 2020 Malik Hawkins. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignUp: View {
    
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var alertMessage = "Something went wrong"
    @State private var showAlert = false
    
    var alert: Alert {
        Alert(title: Text("Invalid Input"), message: Text(alertMessage), dismissButton: .default(Text("Dismiss")))
    }
    
    
    
    var body: some View {
        GeometryReader{ geo in
            VStack(alignment: .leading, spacing:50){
                VStack(alignment:.leading){
                    Text("Hello!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                }.padding(.top,100).padding(.leading,40)
                VStack(alignment: .trailing){
                    TextField("Enter Email", text: self.$email)
                        .padding(.all)
                        .frame(height:50)
                        .background(Color.init(white: 0.95))
                        .cornerRadius(6)
                        .font(.system(size: 13, weight:.bold))
                    TextField("Enter Username", text: self.$username)
                        .padding(.all)
                        .frame(height:50)
                        .background(Color.init(white: 0.95))
                        .cornerRadius(6)
                        .font(.system(size: 13, weight:.bold))
                    SecureField("Enter Password", text: self.$password)                  .padding(.all)
                        .frame(height:50)
                        .background(Color.init(white: 0.95))
                        .cornerRadius(6)
                        .font(.system(size: 13, weight:.bold)).foregroundColor(Color.primary)
                    Spacer()
                    Spacer()
                    
                }.padding(.leading,40).padding(.trailing,40)
                Button(action: {
                    
                    self.signUp()
                    
                }) {
                    Text("Next")
                        .font(.system(size: 15, weight:.bold))
                        .frame(minWidth: 0, maxWidth: .greatestFiniteMagnitude, minHeight: 50)
                        .background(Color.init(red: 14/255, green: 219/255, blue: 139/255))
                        .foregroundColor(Color.white)
                        .cornerRadius(6)
                }.padding(.horizontal)
                    .alert(isPresented: self.$showAlert, content: {self.alert})
            }
        }
        
    }   //Ending body
    
    func signUp(){
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
            // Handling errors and continuing
            if error != nil {
                self.alertMessage = error?.localizedDescription ?? ""
                self.showAlert = true
                print(error?.localizedDescription ?? "")
            } else {
                print("\(self.email) created")
                goHomeFromSignUp()
                
            }
        }
        
    }
    
    
} // Ending View

func goHomeFromSignUp(){
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: Home())
        window.makeKeyAndVisible()
    }
}



struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
