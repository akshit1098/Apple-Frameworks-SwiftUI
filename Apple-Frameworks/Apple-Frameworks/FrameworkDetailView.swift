//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Akshit Saxena on 1/23/25.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    
    var framework: Framework
    @Binding var isShowDetailView: Bool
    
    
    var body: some View {
        VStack{
            
            HStack {
                Spacer()
                
                Button {
                    isShowDetailView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(Color(.label)) // this will enable fading in x mark which will behave black in white background and vice versa
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }
            .padding()
            
            Spacer()
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                
            } label: {
               
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    // hard code to false
    FrameworkDetailView(framework: MockData.sampleFramework, isShowDetailView: .constant(false))
        .preferredColorScheme(.dark)
}
