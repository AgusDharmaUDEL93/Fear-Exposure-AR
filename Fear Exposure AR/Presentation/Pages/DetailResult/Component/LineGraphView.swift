//
//  LineGraphView.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 11/11/24.
//

import SwiftUI
import Charts

struct LineGraphView: View {
    @Binding var heartRateData: [Double]  // Data for the graph
    @State private var selectedDataIndex: Int? = nil  // Track selected point index
    
    var body: some View {
        ZStack {
            Chart {
                if !heartRateData.isEmpty {
                    ForEach(Array(heartRateData.enumerated()), id: \.offset) { index, value in
                        LineMark(
                            x: .value("Time", index),
                            y: .value("Heart Rate", value)
                        )
                        .foregroundStyle(Color.red)
                        .lineStyle(StrokeStyle(lineWidth: 2))
                    }
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .chartXScale(domain: 0...(heartRateData.count > 1 ? heartRateData.count - 1 : 1))
            .chartYScale(domain: (heartRateData.min() ?? 50) - 10...((heartRateData.max() ?? 50) + 10))
            .frame(maxWidth: .infinity)
            
            
            // Tooltip Overlay
            if let index = selectedDataIndex, index < heartRateData.count {
                VStack {
                    Text("Heart Rate: \(heartRateData[index], specifier: "%.1f")")
                        .font(.caption)
                        .padding(5)
                        .background(Color.black.opacity(0.75))
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .position(x: CGFloat(index) / CGFloat(heartRateData.count - 1) * UIScreen.main.bounds.width * 0.95,
                                  y: 30)  // Adjust Y position as needed
                }
            }
        }
    }
}




struct LineChart: View {
    var data: [Double]
    
    var body: some View {
        Chart {
            if !data.isEmpty {
                ForEach(Array(data.enumerated()), id: \.offset) { index, value in
                    LineMark(
                        x: .value("Time", index),
                        y: .value("Heart Rate", value)
                    )
                }
            }
        }
        .chartYAxis {
            AxisMarks(position: .leading)
        }
        .chartXScale(domain: 0...(data.count > 1 ? data.count - 1 : 1))  // Ensure minimum of 1
        .chartYScale(domain: (data.min() ?? 0) - 10...((data.max() ?? 0) + 10))  // Provide fallback for empty array
    }
}
