//
//  ScrollView.swift
//  SOPT-38-SwiftUI
//
//  Created by 초긍정행운의포춘쿠키 on 5/16/26.
//

import SwiftUI

struct testSUView: View{
    
    var body: some View {
        
        VStack{
            Spacer()
                .frame(height: 100)
            
            testHScrollView()
                .padding()
                .foregroundStyle(.green)
            
            CounterView()
                .padding()
            
            testVScrollView()
                .padding()
                .foregroundStyle(.orange)
        }
    }
}

struct testVScrollView: View {
    
    var body: some View {
        
        ScrollView() {
            VStack {
                ForEach(1..<20) {
                    Text("Item \($0)")
                        .font(.title)
                }
            }
        }
    }
}

struct testHScrollView: View {
    
    var body: some View {
        
        ScrollView(.horizontal) {
            HStack{
                ForEach(1..<10) {
                    Text("Item \($0)")
                        .font(.title)
                }
            }
        }
    }
}

struct CounterView : View{
    
    @State private var count = 0
    
    var body: some View {
        
        VStack {
            Text("카운트 : \(count)")
            CounterButton(count: $count)
        }
    }
}

struct CounterButton: View {
    
    @Binding var count: Int
    
    var body: some View {
        Button("눌러") {
            count += 1
        }
    }
}

#Preview {
    testSUView()
}
