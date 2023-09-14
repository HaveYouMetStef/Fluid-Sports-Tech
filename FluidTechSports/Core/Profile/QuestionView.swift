//
//  QuestionView.swift
//  FluidTechSports
//
//  Created by Stef Castillo on 8/28/23.
//

import SwiftUI

struct QuestionView: View {
    @State private var selectedChallenges: [String] = []
    @State private var challenges = mentalChallenges
    
    //mental health areas of focus
    static let mentalChallenges = [
        "Performance Anxiety",
        "Confidence Building",
        "Goal Setting",
        "Stress Management",
        "Concentration/Focus",
        "Motivation",
        "Team Dynamics",
        "Burnout Prevention"
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                //User profile section
                HStack(alignment:.center, spacing: 20) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .padding(10)
                    
                    Text("John Doe")
                        .font(.headline)
                        .foregroundColor(.black)
                }
                .padding(.top,50)
                ZStack {
                    
                    //background color
                    Color(red: 0 / 255, green: 74 / 255, blue: 174 / 255)
                    VStack(spacing: 25) {
                        
                        //X mark button on the top right of the view
                        Button(action: {return}, label:  {
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 40, height: 40)
                                    
                                Image(systemName: "xmark")
                                    .font(.system(size:15, weight: .bold, design: .rounded))
                                    .foregroundColor(.secondary)
                            }
                            .contentShape(Circle())
                            .offset(x: 170)
                        })
                        .buttonStyle(PlainButtonStyle())
                        .accessibilityLabel(Text("Close"))
                        .padding(.top,10)
                        
                        
                        Text("What specific mental challenges or issues would you like help with? (Select all that apply)")
                            .foregroundStyle(.white)
                            .font(.subheadline.weight(.heavy))
                            .frame(maxWidth: .infinity)
        
                        
                        //challeneges sections
                        ForEach(Self.mentalChallenges, id: \.self) { challenge in
                            Button(action: {
                                if selectedChallenges.contains(challenge) {
                                    selectedChallenges.removeAll { $0 == challenge }
                                } else {
                                    selectedChallenges.append(challenge)
                                }
                                
                            }) {
                                HStack {
                                    Text(challenge)
                                        .shadow(radius: 5)
                                        .foregroundColor(.white)
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                    
                                    Image(systemName: selectedChallenges.contains(challenge) ? "checkmark.circle.fill" : "circle")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(selectedChallenges.contains(challenge) ? .green: .white)
                                        .padding(.trailing, 20)
                                    
                                }
                            }
                            
                        }
                        Spacer()
                    }
                    
                }
                .frame(maxWidth: .infinity)
                
                //MARK - Toolbar Section
                HStack {
                    NavigationLink(destination: MainPageView().navigationBarHidden(true)) {
                        VStack {
                            Image(systemName: "house")
                                .font(.system(size: 30))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(20)
                        .background(Color.white)
                    }
                    NavigationLink(destination: CalendarPage().navigationBarHidden(true)) {
                        VStack {
                            Image(systemName: "calendar")
                                .font(.system(size: 30))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(20)
                        .background(Color.white)
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
    struct QuestionView_Previews: PreviewProvider {
        static var previews: some View {
            QuestionView()
        }
    }
}
