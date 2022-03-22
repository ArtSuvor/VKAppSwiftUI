//
//  ContentView.swift
//  VKAppSwiftUI
//
//  Created by Art on 28.02.2022.
//

import SwiftUI

struct AuthorizationView: View {
    
//MARK: - State
    @State private var login: String = ""
    @State private var password: String = ""
    
//MARK: - Body
    var body: some View {
        ZStack {
            VStack(spacing: 50) {
                Text("VKApp")
                    .font(.system(size: 30, weight: .bold))
                
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Login")
                        Spacer()
                        Text("Password")
                    }
                    .frame(height: 50)

                    VStack {
                        TextField("Login", text: $login)
                        SecureField("Password", text: $password)
                    }
                    .textFieldStyle(.roundedBorder)
                }
                
                HStack(alignment: .center, spacing: 20) {
                    Button(action: loginButtonTapped, label: {
                        Image(systemName: "lock.open")
                            .symbolRenderingMode(.monochrome)
                        Text("Log in")
                    })
                        .frame(height: 30, alignment: .center)
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(colors: [Color("buttonOne"), Color("buttonTwo")], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(10)
                    
                    Button(action: regButtonTapped, label: {
                        Image(systemName: "lock")
                            .symbolRenderingMode(.monochrome)
                        Text("Register")
                    })
                        .frame(height: 30, alignment: .center)
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(colors: [Color("buttonOne"), Color("buttonTwo")], startPoint: .trailing, endPoint: .leading))
                        .cornerRadius(10)
                }
                .foregroundColor(Color.black)
                .font(.system(size: 20, weight: .semibold))
            }
            .padding(10)
            .background(Color("whiteWithAlpha"))
            .cornerRadius(10)
            .padding(.all, 10)
        }
        .padding(.top, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color.gray)
    }
    
//MARK: - Methods
    private func loginButtonTapped() {
        print("\(login) \(password)")
    }
    
    private func regButtonTapped() {
        print("\(login) \(password)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView()
    }
}
