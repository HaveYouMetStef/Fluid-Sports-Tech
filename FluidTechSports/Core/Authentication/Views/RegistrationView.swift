//
//  RegistrationView.swift
//  FluidTechSports
//
//  Created by Anmol Gulati on 5/28/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showingDisclaimerPopup = false
    @State private var agreeToDisclaimer = false
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        ZStack{
            
            //background color
            Color(red: 0 / 255, green: 74 / 255, blue: 174 / 255)
            VStack {
                // image
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 210)
                    .padding(.top, 40)
                
                //form fields
                VStack(spacing: 24) {
                    InputView(text: $fullName,
                        title: "Full Name",
                        placeholder: "Enter your name")
                    .disableAutocorrection(true)
                    
                    InputView(text: $email,
                        title: "Email Address",
                        placeholder: "name@example.com")
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                    .disableAutocorrection(true)
                    
                    ZStack(alignment: .trailing){
                        InputView(text: $confirmPassword,
                                  title: "Confirm Password",
                                  placeholder: "Confirm your password",
                                  isSecureField: true)
                        .disableAutocorrection(true)
                        
                        if !password.isEmpty && !confirmPassword.isEmpty {
                            if password == confirmPassword {
                                Image(systemName: "checkmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.systemGreen))
                            } else {
                                Image(systemName: "xmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.systemRed))
                            }
                        }
                    }

                    
                    }
                    
                    .padding(.horizontal)
                    .frame(height: 330)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.top, 10)
                
                
                HStack {
                        Image(systemName: agreeToDisclaimer ? "checkmark.square" : "square")
                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.white)
                                        .onTapGesture {
                                            agreeToDisclaimer.toggle()
                                        }

                                    Button {
                                        showingDisclaimerPopup.toggle()
                                    } label: {
                                        Text("I Agree with the App Disclaimer")
                                            .font(.system(size: 17))
                                            .foregroundColor(.white)
                                            .font(.footnote)
                                            .multilineTextAlignment(.center)
                                            .bold()
                                    }
                                }
                                .padding(.top, 10)
                                .sheet(isPresented: $showingDisclaimerPopup) {
                                    DisclaimerPopup()
                                }

                        
                    Button {
                        Task {
                            try await viewModel.createUser(withEmail: email,
                                                           password: password, fullname: fullName)
                        }
                    } label: {
                        HStack{
                            Text("SIGN UP")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                        }
                        .foregroundColor(.blue)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                    }
                    .background(Color(.white))
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1.0 : 0.7)
                    .cornerRadius(10)
                    .padding(.top, 10)
                
                Spacer()
                
                
                
                    .padding(.top, 10)
                NavigationLink {
                    ResetView()
                        .navigationBarBackButtonHidden(true)
                    
                } label: {
                    HStack(spacing: 4) {
                        Text("Forgot Password?")
                            .foregroundColor(.white)
                        Text("Click Here")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 17))
                    .padding(.bottom, 15)
                    
                }
                
                Button {
                    dismiss()
                } label : {
                    HStack(spacing: 4) {
                        Text("Already have an account?")
                            .foregroundColor(.white)
                        Text("Sign in")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 17))
                    .padding(.bottom, 60)
                }
            }
            
            .padding()
            
        }
        .edgesIgnoringSafeArea(.all) // Ignore safe area to extend the background color

    }
}

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return agreeToDisclaimer
            && !email.isEmpty
            && email.contains("@")
            && !password.isEmpty
            && password.count > 5
            && confirmPassword == password
            && !fullName.isEmpty
        
        
    }
}


struct DisclaimerPopup: View {
    @Environment(\.presentationMode) var dismiss

    var body: some View {
        // Replace this with your custom text for the Data Protection / Privacy and Security information notice
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                VStack{
                    VStack{
                        Button(action : {
                            dismiss.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "x.circle")
                                .font(.system(size: 30 ))
                                .padding(.leading, 310)
                        })
                        Text("App Disclaimer")
                            .fontWeight(.semibold)
                            .font(.system(size: 35))
                            .padding(.bottom, 5)
                    }
                    Text("Disclaimer: The Fluid Sports Tech app ('the App') is provided for informational purposes only. While we make efforts to ensure the accuracy and reliability of the information presented in the App, we make no representations or warranties of any kind, express or implied, about the completeness, accuracy, reliability, suitability, or availability with respect to the App or the information, products, services, or related graphics contained in the App for any purpose. Any reliance you place on such information is therefore strictly at your own risk.\n")
                        .font(.system(size: 15))
                    Text("The App is intended for educational and informational purposes only and should not be considered a substitute for professional advice, diagnosis, or treatment. It is important to consult with qualified healthcare professionals, including licensed sports psychologists or other mental health professionals, for personalized guidance and support tailored to your specific needs.\n")
                        .font(.system(size: 15))
                    
                    Text("The App may contain links to third-party websites or resources. These links are provided for convenience and do not imply endorsement or control over the content or practices of those websites. We have no control over the nature, content, and availability of those sites or resources and are not responsible for any damages or losses arising from or related to their use.\n")
                        .font(.system(size: 15))
                    
                    Text("Fluid Sports Tech shall not be held liable for any direct, indirect, incidental, special, or consequential damages arising out of or in any way connected with the use of the App, whether based on contract, tort, strict liability, or other legal theory, even if advised of the possibility of such damages.\n")
                        .font(.system(size: 15))
                    
                    Text("By using the Fluid Sports Tech app, you agree to indemnify and hold harmless Fluid Sports Tech and its affiliates, officers, directors, employees, and agents from any and all claims, liabilities, damages, losses, or expenses, including reasonable attorneys' fees and costs, arising out of or in any way related to your use of the App or the information contained therein.\n")
                        .font(.system(size: 15))
                }
                VStack{
                    Text("Please consult our Privacy Policy and Terms of Service for further information on the use of the App and your responsibilities.\n")
                    
                    
                    Text("This disclaimer is governed by and construed in accordance with the laws of [Jurisdiction].\n")
                    
                }
                }
            }
            
            .frame(maxHeight: .infinity)
            .padding()
            .background(
                Color(red: 0 / 255, green: 74 / 255, blue: 174 / 255)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 10)
            )
            .padding([.horizontal, .top], 7)
            .foregroundColor(.white)
    }
}


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
