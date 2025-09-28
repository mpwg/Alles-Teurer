//
//  StatisticCard.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 26.09.25.
//


import Charts
import SwiftData
import SwiftUI

struct StatisticCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
            
            Text(value)
                .font(.headline)
                .fontWeight(.semibold)
            
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
