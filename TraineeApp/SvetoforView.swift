//
//  SvetoforNew.swift
//  TraineeApp
//
//  Created by Илья Десятов on 15.12.2023.
//

import UIKit
import SnapKit

class SvetoforView: UIView {
    
    private let sections: [SvetoforSectionView] = [
        SvetoforSectionView(colorLight: .red),
        SvetoforSectionView(colorLight: .orange),
        SvetoforSectionView(colorLight: .green),
        SvetoforSectionView(colorLight: .red),
        SvetoforSectionView(colorLight: .orange),
        SvetoforSectionView(colorLight: .green)
    ]
    
    private let stackView = UIStackView(frame: .zero)

    init() {
        super.init(frame: .zero)
        
        configureStackView()
        
        setStartState()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public

    func switchMode() {
        
        
        if let indexOfFirstOnSection = sections.firstIndex(where: { $0.isOn} ), indexOfFirstOnSection < sections.count - 1 {
            sections[indexOfFirstOnSection].turnOff()
            sections[indexOfFirstOnSection + 1].turnOn()
            // секция горит
        } else {
            // секции не горят
            sections.forEach( { $0.turnOff() } )
            sections.first?.turnOn()
        }
//        if firstSectionView.isOff &&
//            secondSectionView.isOff &&
//            thirdSectionView.isOff {
//            firstSectionView.turnOn()
//        } else if firstSectionView.isOn {
//            firstSectionView.turnOff()
//            secondSectionView.turnOn()
//        } else if secondSectionView.isOn {
//            secondSectionView.turnOff()
//            thirdSectionView.turnOn()
//        } else if thirdSectionView.isOn {
//            thirdSectionView.turnOff()
//        }
        
    }
    
    //MARK: Private
    
    private func configureStackView() {
        addSubview(stackView)
        
        stackView.spacing = 12
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        
        sections.forEach { section in
            stackView.addArrangedSubview(section)
            
            section.snp.makeConstraints { make in
                make.width.height.equalTo(100)
            }
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
//        firstSectionView.snp.makeConstraints { make in
//            make.width.height.equalTo(100)
//        }
//        
//        secondSectionView.snp.makeConstraints { make in
//            make.width.height.equalTo(100)
//        }
//        
//        thirdSectionView.snp.makeConstraints { make in
//            make.width.height.equalTo(100)
//        }
    }
    
    private func setStartState() {
        
        sections.forEach( { $0.turnOff() } )
    }
    
}


