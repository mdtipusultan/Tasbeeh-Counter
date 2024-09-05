//
//  TasbeehView.swift
//  Bank_app
//
//  Created by Tipu on 4/9/24.


import SwiftUI

struct TasbeehView: View {
    @State private var count: Int = UserDefaults.standard.integer(forKey: "Count") // Load count from UserDefaults
    @State private var totalCount: Int = UserDefaults.standard.integer(forKey: "TotalCount") // Load totalCount from UserDefaults
    
    var body: some View {
        VStack {
            ZStack {
                Image("Tasbeeh_counter")
                
                Text(String(format: "%02d", count)) // Display count as two digits
                    .foregroundColor(.white)
                    .frame(width: 107, height: 56, alignment: .center)
                    .font(.custom("Digital-7", size: 26))
                    .padding(.top, -80)
            }
            
            HStack {
                Spacer()
                ZStack {
                    Rectangle()
                        .fill(Color(uiColor: UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)))
                        .frame(width: 66, height: 32)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("PrimaryColor"), lineWidth: 1.5)
                        )
                    
                    Text(String(totalCount)) // Display the total count
                        .font(.custom("Digital-7", size: 19))
                }
            }
            .padding(.top, -60)
            .padding(.trailing)
            
            Text("Total Count")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
                .font(.system(size: 11))
                .padding(.top, -30)
            
            HStack {
                Spacer()
                Button(action: {
                    totalCount += 1
                    if count < 99 {
                        count += 1
                    } else {
                        count = 0
                    }
                    UserDefaults.standard.set(count, forKey: "Count") // Save count to UserDefaults
                    UserDefaults.standard.set(totalCount, forKey: "TotalCount") // Save totalCount to UserDefaults
                }) {
                    Text("COUNT")
                        .font(.system(size: 26))
                        .foregroundColor(.white)
                        .frame(width: 147, height: 73)
                        .background(Color("PrimaryColor"))
                        .cornerRadius(20)
                }
                Spacer()
                Button(action: {
                    count = 0
                    totalCount = 0
                    UserDefaults.standard.set(count, forKey: "Count") // Reset and save count to UserDefaults
                    UserDefaults.standard.set(totalCount, forKey: "TotalCount") // Reset and save totalCount to UserDefaults
                }) {
                    Text("RESET")
                        .font(.system(size: 26))
                        .foregroundColor(.white)
                        .frame(width: 147, height: 73)
                        .background(Color("PrimaryColor"))
                        .cornerRadius(20)
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    TasbeehView()
}
