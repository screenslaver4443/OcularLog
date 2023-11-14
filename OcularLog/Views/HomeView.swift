//
//  ContentView.swift
//  OcularLog
//
//  Created by Nikolai Pesudovs on 19/10/2023.
//

import SwiftUI
import Neumorphic
import Foundation
import Charts

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


let decoder = JSONDecoder()
let KeyToday = Date.now.formatted(date: .numeric, time: .omitted)
let KeyYesterday = Date().dayBefore.formatted(date: .numeric, time: .omitted)
let KeyMonday = Date().previous(.monday).formatted(date: .numeric, time: .omitted)
let defaults = UserDefaults.standard

func getLogs(Key: String) -> UserLog{
    if let LogEncoded: Data = defaults.object(forKey: Key) as? Data{
        if let Log = try? decoder.decode(UserLog.self, from: LogEncoded){
            return Log
        }
    }
        return UserLog(answersArray: [], averageScore: 0.0, empty: true)
}

struct HomeView: View {
    let todaysLog = getLogs(Key: KeyToday)
    let yesterdaysLog = getLogs(Key: KeyYesterday)
    let mondaysLog = getLogs(Key: KeyMonday)
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Today")
                .font(.largeTitle)
                .bold()
            VStack() {
                if todaysLog.empty ?? false{
                    Text("No log for today")
                }
                else {
                    Text("Activity Limit Score: "+String(todaysLog.averageScore))
                    Chart{
                        ForEach(todaysLog.answersArray, id: \.self){answer in
                                BarMark(x: .value("Question", "1"),
                                        y: .value("Answer", answer)
                                )
                            }
                        }
                    
                    }
                }
                .frame(width: 350, height: 300)
                .padding()
                .background(RoundedRectangle(cornerRadius: 25).fill(Color.Neumorphic.main).softOuterShadow().frame(width: 350, height: 300))
            Text("Yesterday")
                .font(.title2)
                .bold()
            VStack() {
                if yesterdaysLog.empty ?? false{
                    Text("No log for yesterday")
                }
                else {
                    Text("Activity Limit Score: "+String(yesterdaysLog.averageScore))
                }
            }
                .frame(width: 350, height: 100)
                .padding()
                .background(RoundedRectangle(cornerRadius: 25).fill(Color.Neumorphic.main).softOuterShadow().frame(width: 350, height: 100))
            Text("Monday")
                .font(.title2)
                .bold()
            VStack() {
                if mondaysLog.empty ?? false{
                    Text("No log for monday")
                }
                else {
                    Text("Activity Limit Score: "+String(mondaysLog.averageScore))
                }
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
