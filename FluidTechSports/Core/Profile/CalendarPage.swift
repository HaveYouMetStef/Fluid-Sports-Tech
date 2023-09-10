//
//  CalendarPage.swift
//  FluidTechSports
//
//  Created by Anmol Gulati on 5/28/23.
//

import SwiftUI

struct CalendarPage: View {
    var body: some View {
        NavigationView {

                VStack {
                    HStack(){
                        Text("Fluid Sports Tech")
                            .font(.system(size: 28))
                            .fontWeight((.bold))
                            .padding()
                            .padding(.leading, 35)
                       // Spacer()
                        NavigationLink(destination: SettingsView()){
                            
                            Image(systemName: "gearshape")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .foregroundColor(.white)
                                .padding(.leading, 5)
                        }
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 67)
                    .background(.black)
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .padding(.bottom, 15)
                        
                    Text("Calendar")
                        .fontWeight(.bold)
                        .font(.system(size: 35))
                    ScrollView {
                        CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture))

                    }
                   
                    .toolbar {
                        ToolbarItemGroup(placement: .bottomBar) {
                            NavigationLink(destination: MainPageView().navigationBarHidden(true)) {
                                VStack {
                                    Image(systemName: "house")
                                        .font(.system(size: 30)) // Enlarge the house icon
                                }
                                .padding(.leading, 20)
                            }
                            NavigationLink(destination: CalendarPage().navigationBarHidden(true)) {
                                VStack {
                                    Image(systemName: "calendar")
                                        .font(.system(size: 30)) // Enlarge the calendar icon
                                }
                                .padding(.trailing, 20)
                            }

                            }
                        }
                }
            }
            .navigationBarBackButtonHidden(true)
    }
}

struct CalendarPage_Previews: PreviewProvider {
    static var previews: some View {
        CalendarPage()
    }
}
