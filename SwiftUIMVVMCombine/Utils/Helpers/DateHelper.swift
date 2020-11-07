//
//  DateHelper.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/7/20.
//

import Foundation

class DateHelper {
    static func getDateString(inputFormat: String = Strings.simpleDateFormat, outputFormat: String, dateString: String) -> String? {
        let dateFormatter = DateFormatter(dateFormat: inputFormat)
        guard let date = dateFormatter.date(from: dateString) else {
            return nil
        }
        dateFormatter.dateFormat = outputFormat
        return dateFormatter.string(from: date)
    }

    static func getYear(inputFormat: String = Strings.simpleDateFormat, dateString: String) -> String? {
        let dateFormatter = DateFormatter(dateFormat: inputFormat)
        guard let date = dateFormatter.date(from: dateString) else {
            return nil
        }
        return "\(Calendar.current.component(.year, from: date))"
    }

    static func minutesToHourMinutes(minutes: Int?) -> String? {
        guard let minutes = minutes, minutes > 0 else { return nil }
        if minutes / 60 >= 1 {
            return "\(minutes / 60)h \(minutes % 60)m"
        } else {
            return "\(minutes % 60)m"
        }
    }
}
