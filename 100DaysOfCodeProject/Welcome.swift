//
//  Welcome.swift
//  100DaysOfCodeProject
//
//  Created by Malik Hawkins on 5/27/20.
//  Copyright © 2020 Malik Hawkins. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct Welcome: View {
    
    @State var userIsntRegistered: Bool = false
    @State var forgotPassword: Bool = false
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert = false
    @State private var alertMessage = "Something went wrong"
    
    
    var alert: Alert {
        Alert(title: Text("Invalid Input"), message: Text(alertMessage), dismissButton: .default(Text("Dismiss")))
    }
    
    var body: some View {
        GeometryReader{ geo in
            VStack(alignment: .leading, spacing:50){
                VStack(alignment:.leading){
                    Text("Welcome,")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("sign in to continue!")
                        .font(.title)
                        .foregroundColor(Color.gray)
                        .fontWeight(.semibold)
                }.padding(.top,100).padding(.leading,40)
                VStack(alignment: .trailing){
                    TextField("Enter Email", text: self.$email)
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
                    Button(action: {
                        self.forgotPassword.toggle()
                    }) {
                        Text("Forgot Password?").font(.system(size: 14)).fontWeight(.semibold)
                    }.sheet(isPresented: self.$forgotPassword){
                        ForgotPassword()
                    }
                    Spacer()
                    
                    HStack(alignment: .center) {
                        Button(action: {
                            self.userIsntRegistered.toggle()
                        }) {
                            Text("Sign Up")
                        }.sheet(isPresented: self.$userIsntRegistered){
                            SignUp()
                        }
                        
                        
                        Spacer()
                        Button(action: {
                            
                            self.signIn()
                            
                        }) {
                            Text("Next")
                                .font(.system(size: 15, weight:.bold))
                                .frame(minWidth: 0, maxWidth: 100, minHeight: 45)
                                .background(Color.init(red: 14/255, green: 219/255, blue: 139/255))
                                .foregroundColor(Color.white)
                                .cornerRadius(6)
                        }
                    }
                }.padding(.leading,40).padding(.trailing,40).alert(isPresented: self.$showAlert, content: {self.alert})
            }
        }
        
    } // Ending body
    
    func signIn(){
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            // Handling errors and continuing
            if error != nil {
                self.alertMessage = error?.localizedDescription ?? ""
                self.showAlert = true
                print(error?.localizedDescription ?? "")
            } else {
                print("\(self.email) signed in successfully")
                goHomeFromLogin()
                
            }
        }
        
    }
    
} // Ending view

func goHomeFromLogin(){
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: Home())
        window.makeKeyAndVisible()
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
