//
//  ViewControllerAbilities.swift
//  SuperHeroApp_iOS
//
//  Created by Mañanas on 10/9/24.
//

import UIKit
import DGCharts

class ViewControllerAbilities: UIViewController {
    
    var superHero: SuperHero? = nil
    
    var radarChartView: RadarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Initialize the radar chart view
                radarChartView = RadarChartView()
                radarChartView.frame = CGRect(x: 0, y: 0, width: 350, height: 800)
                radarChartView.center = view.center
                view.addSubview(radarChartView)

                // Configure the radar chart
                configureRadarChart()
        
            }

            func configureRadarChart() {
                let entries = [
                    RadarChartDataEntry(value: convertStatToDouble(superHero?.powerstats.intelligence)),
                    RadarChartDataEntry(value: convertStatToDouble(superHero?.powerstats.strength)),
                    RadarChartDataEntry(value: convertStatToDouble(superHero?.powerstats.speed)),
                    RadarChartDataEntry(value: convertStatToDouble(superHero?.powerstats.durability)),
                    RadarChartDataEntry(value: convertStatToDouble(superHero?.powerstats.power)),
                    RadarChartDataEntry(value: convertStatToDouble(superHero?.powerstats.combat)),
                ]
                
                let dataSet = RadarChartDataSet(entries)
                dataSet.colors = [NSUIColor.blue]
                dataSet.valueColors = [NSUIColor.black]
                dataSet.lineWidth = 2
                dataSet.drawFilledEnabled = true
                dataSet.fillColor = NSUIColor.blue
                dataSet.fillAlpha = 0.5
                
                let data = RadarChartData(dataSet: dataSet)
                
                radarChartView.data = data

                        // Customize chart appearance
                        radarChartView.webLineWidth = 1
                        radarChartView.innerWebLineWidth = 0.5
                        radarChartView.webColor = NSUIColor.gray
                radarChartView.webAlpha = 0.7
                        radarChartView.legend.form = .circle
                        radarChartView.legend.textColor = NSUIColor.black
                
                radarChartView.xAxis.labelPosition = .bottom
                radarChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: ["Intelligence", "Strength", "Speed", "Durability", "Power", "Combat"])
                radarChartView.xAxis.granularity = 0
                
                radarChartView.yAxis.axisMinimum = 0
                radarChartView.yAxis.axisMaximum = 100
                radarChartView.yAxis.drawLabelsEnabled = true
                
                // Optionally hide other labels or elements
                radarChartView.xAxis.drawLabelsEnabled = true // Hide X-axis labels if needed
                radarChartView.legend.enabled = false // Hide legend if needed
            }
    
    func convertStatToDouble(_ string: String?, defaultValue: Double = 0.0) -> Double {
        // Use optional binding to check if the string is not nil
        if let stringValue = string {
            // Attempt to convert the non-nil string to a Double
            return Double(stringValue) ?? defaultValue
        } else {
            // Return the default value if the string was nil
            return defaultValue
        }
    }
        }
