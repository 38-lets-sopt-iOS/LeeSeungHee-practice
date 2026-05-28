//
//  StoryView.swift
//  SOPT-38-SwiftUI
//
//  Created by 초긍정행운의포춘쿠키 on 5/16/26.
//
import SwiftUI

struct StoryView : View{

    let story: [StoryModel]
  
    @State private var selectedSet: Set<StoryModel.ID> = []
    
    var body: some View {
        
        VStack {
            
            hScrollView(story: story, selectedSet: $selectedSet)
            
            List(story) { story in
                
                Button {
                    if selectedSet.contains(story.id) {
                        selectedSet.remove(story.id)
                    } else {
                        selectedSet.insert(story.id)
                    }
                } label: {
                    HStack(spacing: 12) {
                        ZStack(alignment: .bottomTrailing) {
                            
                            if selectedSet.contains(story.id) {
                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .foregroundStyle(Color.blue)
                                    .frame(width: 50, height: 50)
                                
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: 12, height: 12)
                            } else {
                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .foregroundStyle(Color.gray)
                                    .frame(width: 50, height: 50)
                                
                                Circle()
                                    .fill(Color.gray)
                                    .frame(width: 12, height: 12)
                            }
                        }
                        
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(story.name)
                                .font(.headline)
                            
                            Text(story.message)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
    
                    }
                }
                .buttonStyle(.plain)
            }
            .listStyle(.plain)
        }
    }
}


struct hScrollView: View {
    
    let story: [StoryModel]
    
    @Binding var selectedSet: Set<StoryModel.ID>
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing: 20) {
                
                ForEach(story) { story in
                    Button {
                        if selectedSet.contains(story.id) {
                            selectedSet.remove(story.id)
                        } else {
                            selectedSet.insert(story.id)
                        }
                    } label: {
                            ZStack(alignment: .bottomTrailing) {
                                
                                if selectedSet.contains(story.id) {
                                    Image(systemName: "person.crop.circle.fill")
                                        .resizable()
                                        .foregroundStyle(Color.blue)
                                        .frame(width: 50, height: 50)
                                    
                                    Circle()
                                        .fill(Color.green)
                                        .frame(width: 12, height: 12)
                                } else {
                                    Image(systemName: "person.crop.circle.fill")
                                        .resizable()
                                        .foregroundStyle(Color.gray)
                                        .frame(width: 50, height: 50)
                                    
                                    Circle()
                                        .fill(Color.gray)
                                        .frame(width: 12, height: 12)
                                }
                            }
                            
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
        }
    }
}

#Preview {
    StoryView(story: users)
}
