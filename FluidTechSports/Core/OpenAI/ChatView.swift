//
//  ContentView.swift
//  take2
//
//  Created by Anmol Gulati on 6/13/23.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            HStack(){
                NavigationLink(destination: MainPageView()){
                    Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.white)
                }
                Text("Fluid Sports Tech")
                    .font(.system(size: 28))
                    .fontWeight((.bold))
                    .padding()

                // Spacer()
                NavigationLink(destination: SettingsView()){
                    
                    Image(systemName: "gearshape")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.white)

                }
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 67)
            .background(.black)
            .fontWeight(.bold)
            .font(.system(size: 25))
            
            ScrollView {
                ForEach(viewModel.messages.filter({$0.role != .system}), id: \.id) { message in
                    messageView(message: message)
                }
            }
            HStack {
                TextField("Enter a message...", text: $viewModel.currentInput)
                Button {
                    viewModel.sendMessage()
                } label: {
                    Text("Send")
                }
            }
            .padding()
            

        }
        .navigationBarBackButtonHidden(true)

    }
    func messageView(message: Message) -> some View {
        HStack {
            if message.role == .user { Spacer()}
            Text(message.content)
            if message.role == .assistant { Spacer()}
        }
    }
}


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
