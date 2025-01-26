//
//  FrameworkTitleView.swift
//  Apple-Frameworks
//
//  Created by Akshit Saxena on 1/25/25.
//

import SwiftUI

struct FrameworkTitleView: View {
    let framework: Framework
    
    var body: some View {
        HStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 70, height: 70) // adjust this to number of columns
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6) // min.shrink value
                .padding()
        }
        
    }
}

#Preview {
    FrameworkTitleView(framework: MockData.sampleFramework)
}
