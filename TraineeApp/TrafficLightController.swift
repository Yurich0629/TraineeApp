//
//  ViewController.swift
//  TraineeApp
//
//  Created by Илья Десятов on 11.12.2023.
//

import UIKit
import SnapKit

class TrafficLightController: UIViewController {
    
    let svetoforView = SvetoforView()
    
    @IBOutlet var turnButton: UIButton!
    
    //MARK: - system functions
    
    //экран БЫЛ загружен
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(svetoforView)
        
        svetoforView.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.greaterThanOrEqualTo(300)
            make.top.equalTo(64)
            make.centerX.equalToSuperview()
        }
    }
        
        //MARK: - Actions
        
        @IBAction func turnButtonAction(_ sender: Any) {
            svetoforView.switchMode()
        }
        
    
}
