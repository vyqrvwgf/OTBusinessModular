//
//  OTBusinessController.swift
//  OpalTrip
//
//  Created by lazy on 2018/2/26.
//  Copyright © 2018年 lazy. All rights reserved.
//

import UIKit
import WMPageController
import OTBaseModular
import OTMacro

public class OTBusinessController: OTBaseController, WMPageControllerDataSource {
    
    public struct OTBusinessConfig {
        let title: String
        let clazz: UIViewController
        
        init(title: String, clazz: UIViewController) {
            self.title = title
            self.clazz = clazz
        }
    }
    
    // MARK: - Private
    private let configList: [OTBusinessConfig] = [
        OTBusinessConfig(title: "business_tour", clazz: OTTourController()),
        OTBusinessConfig(title: "business_hotel", clazz: OTHotelController()),
        OTBusinessConfig(title: "business_ticket", clazz: OTTicketController())
    ]

    // MARK: - Life Cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(pageController.view)
    }
    
    // MARK: - WMPageControllerDataSource
    public func numbersOfChildControllers(in pageController: WMPageController) -> Int {
        return configList.count
    }
    
    public func pageController(_ pageController: WMPageController, titleAt index: Int) -> String {
        return configList[index].title
    }
    
    public func pageController(_ pageController: WMPageController, viewControllerAt index: Int) -> UIViewController {
        return configList[index].clazz
    }
    
    public func pageController(_ pageController: WMPageController, preferredFrameFor menuView: WMMenuView) -> CGRect {
        return CGRect(x: 0.0, y: 0.0, width: kScreenWidth, height: kStandardHeight)
    }
    
    public func pageController(_ pageController: WMPageController, preferredFrameForContentView contentView: WMScrollView) -> CGRect {
        return CGRect(x: 0.0, y: kStandardHeight, width: kScreenWidth, height: kScreenHeight - kStandardHeight)
    }
    
    // MARK: - Lazy Load
    private lazy var pageController: WMPageController = {
        let pageController = WMPageController()
        pageController.dataSource = self
        pageController.menuItemWidth = kScreenWidth/3.0
        return pageController
    }()
}
