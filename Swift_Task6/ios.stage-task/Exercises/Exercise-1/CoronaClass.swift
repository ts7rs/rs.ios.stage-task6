import Foundation

class CoronaClass {
 
    var seats = [Int]()
    var n: Int
    var seatStudent = 0
    
    init(n: Int) {
      self.n = n
    }
    
    func seat() -> Int {
      let rawSeats = Array(0...n-1)
        
        if rawSeats.count == 1{
          seatStudent = rawSeats[0]
          seats.append(seatStudent)
          return seatStudent
        }
        
        if rawSeats.count == 2{
          if !seats.contains(seatStudent) {
            seatStudent = rawSeats[0]
            seats.append(seatStudent)
                
            if seats.count < 2 && seats.contains(seatStudent){
              seatStudent = rawSeats[n-1]
              seats.append(seatStudent)
            }
                
          }
          return seatStudent
        }
        
        if rawSeats.count > 2{
          if seats.isEmpty {
            seats.append(seatStudent)
            return seatStudent
          }
            
          if seats.count < 2 && seats.contains(seatStudent){
            seatStudent = rawSeats[n-1]
            seats.append(seatStudent)
            return seatStudent
          }
            
         var mid = 0
            
         for el in 1..<seats.count {
           if (seats[el] - seats[el - 1]) / 2 > mid {
            mid = (seats[el] - seats[el - 1]) / 2
            seatStudent = seats[el - 1] + mid
           }
           if seats.last != rawSeats[n - 1] {
            seatStudent = n - 1
            seats.append(n - 1)
            return seatStudent
           }
           if seats.first != rawSeats[0]{
            seatStudent = 0
            seats.insert(seatStudent, at: 0)
            return seatStudent
           }
          }
          seats.append(seatStudent)
          seats.sort { $0 < $1 }
        }
        return seatStudent
     }
     
     func leave(_ p: Int) {
        if seats.contains(p){
            if let index = seats.firstIndex(of: p) {
              seats.remove(at: index)
            }
        }
     }
}
