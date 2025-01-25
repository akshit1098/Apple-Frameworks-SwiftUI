//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Akshit Saxena on 1/23/25.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    
    var body: some View {
        VStack{
            
            HStack {
                Spacer()
                
                Button {
                    isShowingDetailView = false
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
                isShowingSafariView = true
                
            } label: {
                AFButton(title: "Learn More")
            }
        }
        .preferredColorScheme(.dark)
        // can use sheet for 98% cover
        // can use .fullScreenCover for 100% cover
        .sheet(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
        })
    }
}

#Preview {
    // hard code to false
    FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
        .preferredColorScheme(.dark)
}
