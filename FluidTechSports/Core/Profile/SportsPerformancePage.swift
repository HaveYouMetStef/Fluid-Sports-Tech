//
//  SportsPerformancePage.swift
//  FluidTechSports
//
//  Created by Anmol Gulati on 5/28/23.
//

import SwiftUI

struct SportsPerformancePage: View {
    @State private var isSamplePDFButtonTapped = false
    @State private var isResumePDFButtonTapped = false
    @State private var isLecturePDFButtonTapped = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack(){
                    Text("Sports Performance")
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
                
                
                ScrollView{
                    
                    
                    VStack(alignment: .center) {
                        Text("Physical Conditioning")
                            .fontWeight(.semibold)
                            .font(.system(size: 32))
                            .foregroundColor(.white)
                            .padding()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                // Step 2: Use separate NavigationLinks for each button
                                NavigationLink(
                                    destination: PDFViewer(pdfFileName: "Sample"), // Step 3: Pass the pdfFileName
                                    isActive: $isSamplePDFButtonTapped, // Step 4: Use the appropriate state variable
                                    label: {
                                        Image("stress") // Make sure "stress" is the name of the image asset in your project
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 220, height: 250)
                                            .cornerRadius(25)
                                            .shadow(radius: 10)
                                            .padding()
                                            .padding(.top, -60)
                                            .padding(.leading, -20)
                                    }
                                )

                                NavigationLink(
                                    destination: PDFViewer(pdfFileName: "Anmol-Gulati-Resume"), // Step 3: Pass the pdfFileName
                                    isActive: $isResumePDFButtonTapped, // Step 4: Use the appropriate state variable
                                    label: {
                                        Image("resumeImage") // Make sure "stress" is the name of the image asset in your project
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 220, height: 250)
                                            .cornerRadius(25)
                                            .shadow(radius: 10)
                                            .padding()
                                            .padding(.top, -60)
                                            .padding(.leading, -20)
                                    }
                                )
                                .padding()

                                NavigationLink(
                                    destination: PDFViewer(pdfFileName: "Lecture"), // Step 3: Pass the pdfFileName
                                    isActive: $isLecturePDFButtonTapped, // Step 4: Use the appropriate state variable
                                    label: {
                                        Image("tree") // Make sure "stress" is the name of the image asset in your project
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 220, height: 250)
                                            .cornerRadius(25)
                                            .shadow(radius: 10)
                                            .padding()
                                            .padding(.top, -60)
                                            .padding(.leading, -20)
                                    }                            )
                                .padding()
                            }
                            .padding(.leading, 30)


                        }
                    }
                    .background(Color(red: 0 / 255, green: 74 / 255, blue: 174 / 255)
                        .shadow(
                            color: Color.black.opacity(0.5),
                            radius: 10,
                            x: 0, y: 10)
                    )
                    .padding(.top, 20)
                    
                    VStack(alignment: .center) {
                        Text("Topic #2")
                            .fontWeight(.semibold)
                            .font(.system(size: 32))
                            .foregroundColor(.white)
                            .padding()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                // Step 2: Use separate NavigationLinks for each button
                                NavigationLink(
                                    destination: PDFViewer(pdfFileName: "Sample"), // Step 3: Pass the pdfFileName
                                    isActive: $isSamplePDFButtonTapped, // Step 4: Use the appropriate state variable
                                    label: {
                                        Image("stress") // Make sure "stress" is the name of the image asset in your project
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 220, height: 250)
                                            .cornerRadius(25)
                                            .shadow(radius: 10)
                                            .padding()
                                            .padding(.top, -60)
                                            .padding(.leading, -20)
                                    }
                                )

                                NavigationLink(
                                    destination: PDFViewer(pdfFileName: "Anmol-Gulati-Resume"), // Step 3: Pass the pdfFileName
                                    isActive: $isResumePDFButtonTapped, // Step 4: Use the appropriate state variable
                                    label: {
                                        Image("resumeImage") // Make sure "stress" is the name of the image asset in your project
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 220, height: 250)
                                            .cornerRadius(25)
                                            .shadow(radius: 10)
                                            .padding()
                                            .padding(.top, -60)
                                            .padding(.leading, -20)
                                    }
                                )
                                .padding()

                                NavigationLink(
                                    destination: PDFViewer(pdfFileName: "Lecture"), // Step 3: Pass the pdfFileName
                                    isActive: $isLecturePDFButtonTapped, // Step 4: Use the appropriate state variable
                                    label: {
                                        Image("tree") // Make sure "stress" is the name of the image asset in your project
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 220, height: 250)
                                            .cornerRadius(25)
                                            .shadow(radius: 10)
                                            .padding()
                                            .padding(.top, -60)
                                            .padding(.leading, -20)
                                    }                            )
                                .padding()
                            }
                            .padding(.leading, 30)


                        }
                    }

                    .background(Color(red: 0 / 255, green: 74 / 255, blue: 174 / 255)

                        .shadow(
                            color: Color.black.opacity(0.5),
                            radius: 10,
                            x: 0, y: 10)
                    )
                    .padding(.top, 15)
                  //  .padding(.horizontal,7)
                    
                    VStack(alignment: .center) {
                        Text("Topic #3")
                            .fontWeight(.semibold)
                            .font(.system(size: 32))
                            .foregroundColor(.white)
                            .padding()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                // Step 2: Use separate NavigationLinks for each button
                                NavigationLink(
                                    destination: PDFViewer(pdfFileName: "Sample"), // Step 3: Pass the pdfFileName
                                    isActive: $isSamplePDFButtonTapped, // Step 4: Use the appropriate state variable
                                    label: {
                                        Image("stress") // Make sure "stress" is the name of the image asset in your project
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 220, height: 250)
                                            .cornerRadius(25)
                                            .shadow(radius: 10)
                                            .padding()
                                            .padding(.top, -60)
                                            .padding(.leading, -20)
                                    }
                                )

                                NavigationLink(
                                    destination: PDFViewer(pdfFileName: "Anmol-Gulati-Resume"), // Step 3: Pass the pdfFileName
                                    isActive: $isResumePDFButtonTapped, // Step 4: Use the appropriate state variable
                                    label: {
                                        Image("resumeImage") // Make sure "stress" is the name of the image asset in your project
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 220, height: 250)
                                            .cornerRadius(25)
                                            .shadow(radius: 10)
                                            .padding()
                                            .padding(.top, -60)
                                            .padding(.leading, -20)
                                    }
                                )
                                .padding()

                                NavigationLink(
                                    destination: PDFViewer(pdfFileName: "Lecture"), // Step 3: Pass the pdfFileName
                                    isActive: $isLecturePDFButtonTapped, // Step 4: Use the appropriate state variable
                                    label: {
                                        Image("tree") // Make sure "stress" is the name of the image asset in your project
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 220, height: 250)
                                            .cornerRadius(25)
                                            .shadow(radius: 10)
                                            .padding()
                                            .padding(.top, -60)
                                            .padding(.leading, -20)
                                    }                            )
                                .padding()
                            }
                            .padding(.leading, 30)


                        }
                    }

                    .background(Color(red: 0 / 255, green: 74 / 255, blue: 174 / 255)

                        .shadow(
                            color: Color.black.opacity(0.5),
                            radius: 10,
                            x: 0, y: 10)
                    )
                    .padding(.top, 15)
                    
                    Spacer()
                    
                        .toolbar {
                            ToolbarItemGroup(placement: .bottomBar) {
                                NavigationLink(destination: MainPageView().navigationBarHidden(true)) {
                                    VStack {
                                        Image(systemName: "house")
                                            .font(.system(size: 30)) // Enlarge the house icon
                                    }
                                 //   .padding(.leading, 20)
                                }
                                //NavigationLink(destination: CalendarPage().navigationBarHidden(true)) {
                                  //  VStack {
                                    //    Image(systemName: "calendar")
                                      //      .font(.system(size: 30)) // Enlarge the calendar icon
                                  //  }
                                    //.padding(.trailing, 20)
                               // }

                                }
                            }

                }
                
                
                
            }
            
        }
        .navigationBarBackButtonHidden(true)

    }
            
}

struct SportsPerformancePage_Previews: PreviewProvider {
    static var previews: some View {
        SportsPerformancePage()
    }
}
