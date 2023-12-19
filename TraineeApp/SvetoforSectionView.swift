//
//  SvetoforSectionView.swift
//  TraineeApp
//
//  Created by Илья Десятов on 15.12.2023.
//

import UIKit

enum Colors {
    case red
    case orange
    case green
    
    func color() -> UIColor {
        switch self {
            
        case .red:
            return UIColor.red
        case .orange:
            return UIColor.orange
        case .green:
            return UIColor.green
        }
    }
}

class SvetoforSectionView: UIView {

    var colorLight: Colors?
    
    init(colorLight: Colors) {
        super.init(frame: .zero)
        
        self.colorLight = colorLight
        
       setuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //момент создания из сториборда объекта
    override func awakeFromNib() {
        super.awakeFromNib()
        
       setuperView()
        
    }
    
    //MARK: Public
    // здесь назначается цвет секции при создании вью через сториборд
    func setColorLight(_ colorLight: Colors) {
        self.colorLight = colorLight
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setuperView()
    }
    
    func setuperView() {
        layer.cornerRadius = frame.size.width / 2
        layer.borderWidth = 5
        layer.borderColor = UIColor.yellow.cgColor
        backgroundColor = .clear
    }
    
    
    //включение
    func turnOn() {
        backgroundColor = colorLight?.color()
    }
    
        //выключение
    func turnOff() {
        backgroundColor = .clear
    }
    
    var isOn: Bool {
         backgroundColor != .clear
    }
    
//    func isOn() -> Bool {
//        return backgroundColor != .clear
//    }
    
    var isOff: Bool {
         backgroundColor == .clear
    }
    
//    func isOff() -> Bool {
//        return backgroundColor == .clear
//    }
    
}
