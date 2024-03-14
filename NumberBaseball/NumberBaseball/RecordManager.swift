//
//  RecordManager.swift
//  NumberBaseball
//
import Foundation

// MARK: - 게임 기록 관리 클래스
class RecordManager {
    var record: [Int] = []
    func add(_ trialCount: Int) {
        record.append(trialCount)
    }
    func showRecords() {
        // 게임 기록
        for (idx, record) in record.enumerated() {
            print("\(idx+1)번째 게임 : 시도 횟수 - \(record)")
        }
        print()
    }
}
