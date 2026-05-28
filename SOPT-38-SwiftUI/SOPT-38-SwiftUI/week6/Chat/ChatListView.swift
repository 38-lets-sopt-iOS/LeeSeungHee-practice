//
//  ContentView.swift
//  SOPT-38-SwiftUI
//
//  Created by 초긍정행운의포춘쿠키 on 5/16/26.
//

import SwiftUI

struct ChatView: View {
    
    let chatList: ChatListModel
    
    var body: some View {
        
        VStack{
            
            HStack {
                
                Image(chatList.profileImg)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment:.leading){
                    
                    HStack {
                        Text(chatList.name)
                            .font(.headline)
                        
                        Text(chatList.place)
                            .font(.subheadline)
                    }
                    
                    Text(chatList.message)
                        .font(.caption)
                }
                
                Spacer()
                
                Image(chatList.itemImg)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
            }
            .padding(10)
        }
    }
}

struct ChatListView: View {
    
    let chatLists: [ChatListModel]
    
    var body: some View {
        
        List(chatLists) { chatList in
            
            VStack{
                
                ChatView(chatList: chatList)
                
                Divider()
            }
            .listRowInsets(EdgeInsets())
        }
        .listStyle(.plain)
    }
}

#Preview {
    ChatListView(chatLists: ChatListModel.chatDummy)
}
