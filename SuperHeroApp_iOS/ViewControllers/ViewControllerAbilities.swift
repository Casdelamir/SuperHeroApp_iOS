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
    
    @IBOutlet weak var inteligence: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        inteligence.text = superHero?.powerstats.intelligence
        
                configureBarChart()
        
            }

            func configureBarChart() {
                let entries = [
                    RadarChartDataEntry(value: 1.0, data: 50),
                    RadarChartDataEntry(value: 1.0, data: 100),
                    RadarChartDataEntry(value: 1.0, data: 90),
                    RadarChartDataEntry(value: 1.0, data: 40)
                ]
                
                let data = RadarChartData(dataSet: entries)
                radarChartView.data = data
                
                radarChartView.xAxis.labelPosition = .bottom
                radarChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: ["Intelligence", "Strength", "Speed", "Durability"])
                radarChartView.xAxis.granularity = 1
            }
        }
