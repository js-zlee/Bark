//
//  CryptoSettingManager.swift
//  Bark
//
//  Created by huangfeng on 2023/3/2.
//  Copyright © 2023 Fin. All rights reserved.
//

import Foundation
import RxCocoa

class CryptoSettingManager: NSObject {
    static let shared = CryptoSettingManager()
    let defaults = UserDefaults(suiteName: "group.bark")
    var fields: CryptoSettingFields? {
        get {
            return defaults?.value(forKey: "cryptoSettingFields") as? CryptoSettingFields
        }
        set {
            defaults?.set(newValue, forKey: "cryptoSettingFields")
        }
    }

    override private init() {
        super.init()
    }
}

class CryptoSettingRelay: NSObject {
    static let shared = CryptoSettingRelay()
    let fields: BehaviorRelay<CryptoSettingFields?>

    override private init() {
        self.fields = BehaviorRelay<CryptoSettingFields?>(value: CryptoSettingManager.shared.fields)
        super.init()

        self.fields.subscribe { val in
            CryptoSettingManager.shared.fields = val
        }.disposed(by: rx.disposeBag)
    }
}
