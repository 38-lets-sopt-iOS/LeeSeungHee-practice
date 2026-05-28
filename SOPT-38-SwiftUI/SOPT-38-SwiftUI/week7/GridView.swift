//
//  Grid.swift
//  SOPT-38-SwiftUI
//
//  Created by 초긍정행운의포춘쿠키 on 5/23/26.
//

import SwiftUI

struct GridView: View{
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(1...20, id: \.self) { number in
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue.opacity(0.7))
                            .frame(width: 170, height:150)
                        
                        VStack{
                            
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.yellow)
                                .frame(width: 140, height:100)
                            
                            Text("아이템 \(number)")
                                .font(.subheadline)
                        }
                    }
                    .frame(height: 150)
                }
            }
            .padding()
        }
    }
}

#Preview{
    GridView()
}
