//
//  ContentView.swift
//  OcularLog
//
//  Created by Nikolai Pesudovs on 19/10/2023.
//

import SwiftUI
import Neumorphic
import Foundation

extension Date {
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
}
extension Date {

  static func today() -> Date {
      return Date()
  }

  func next(_ weekday: Weekday, considerToday: Bool = false) -> Date {
    return get(.next,
               weekday,
               considerToday: considerToday)
  }

  func previous(_ weekday: Weekday, considerToday: Bool = false) -> Date {
    return get(.previous,
               weekday,
               considerToday: considerToday)
  }

  func get(_ direction: SearchDirection,
           _ weekDay: Weekday,
           considerToday consider: Bool = false) -> Date {

    let dayName = weekDay.rawValue

    let weekdaysName = getWeekDaysInEnglish().map { $0.lowercased() }

    assert(weekdaysName.contains(dayName), "weekday symbol should be in form \(weekdaysName)")

    let searchWeekdayIndex = weekdaysName.firstIndex(of: dayName)! + 1

    let calendar = Calendar(identifier: .gregorian)

    if consider && calendar.component(.weekday, from: self) == searchWeekdayIndex {
      return self
    }

    var nextDateComponent = calendar.dateComponents([.hour, .minute, .second], from: self)
    nextDateComponent.weekday = searchWeekdayIndex

    let date = calendar.nextDate(after: self,
                                 matching: nextDateComponent,
                                 matchingPolicy: .nextTime,
                                 direction: direction.calendarSearchDirection)

    return date!
  }

}

// MARK: Helper methods
extension Date {
  func getWeekDaysInEnglish() -> [String] {
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: "en_US_POSIX")
    return calendar.weekdaySymbols
  }

  enum Weekday: String {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
  }

  enum SearchDirection {
    case next
    case previous

    var calendarSearchDirection: Calendar.SearchDirection {
      switch self {
      case .next:
        return .forward
      case .previous:
        return .backward
      }
    }
  }
}
let averageKeyToday = Date.now.formatted(date: .numeric, time: .omitted)+"average"
let averageKeyYesterday = Date().dayBefore.formatted(date: .numeric, time: .omitted)+"average"
let averageKeyMonday = Date().previous(.monday).formatted(date: .numeric, time: .omitted)+"average"
let defaults = UserDefaults.standard
struct HomeView: View {
    var todaysLogAverage = defaults.double(forKey: averageKeyToday)
    var yesterdaysLogAverage = defaults.string(forKey: averageKeyYesterday)
    var mondaysLogAverage = defaults.string(forKey: averageKeyMonday)
    var body: some View {
        VStack (alignment: .leading) {
            Text("Today")
                .font(.largeTitle)
                .bold()
            VStack() {
                if todaysLogAverage != nil {
                    Text("Activity Limit Score: "+String(todaysLogAverage))
                }
                else {
                    Text("No log for today")
                }
            }
                .frame(width: 350, height: 300)
                .padding()
                .background(RoundedRectangle(cornerRadius: 25).fill(Color.Neumorphic.main).softOuterShadow().frame(width: 350, height: 300))
            Text("Yesterday")
                .font(.title2)
                .bold()
            VStack () {
                Text(yesterdaysLogAverage ?? "No log for yesterday")
            }
                .frame(width: 350, height: 100)
                .padding()
                .background(RoundedRectangle(cornerRadius: 25).fill(Color.Neumorphic.main).softOuterShadow().frame(width: 350, height: 100))
            Text("Last Monday")
                .font(.title2)
                .bold()
            VStack () {
                Text(mondaysLogAverage ?? "No log for monday")
            }
                .frame(width: 350, height: 100)
                .padding()
                .background(RoundedRectangle(cornerRadius: 25).fill(Color.Neumorphic.main).softOuterShadow().frame(width: 350, height: 100))
            Spacer()
        }
        .padding()
    }
    
}
#Preview {
    HomeView()
}
