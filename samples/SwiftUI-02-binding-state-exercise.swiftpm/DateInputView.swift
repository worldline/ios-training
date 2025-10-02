import SwiftUI

struct DateInputView : View {
    @State private var year = "2025"
    @State private var month = "9"
    @State private var day = "2"
    @Binding var date: Date
    var body: some View {
        VStack {
            Text("DateInputView Content")
            Text("Year")
            TextField("Year", text: $year)
                .border(.secondary)
                .onChange(of: year) { oldValue, newValue in
                    updateDate()
                }
            Text("Month")
            TextField("Year", text: $month)
                .border(.secondary)
                .onChange(of: month) { oldValue, newValue in
                    updateDate()
                }
            Text("Day")
            TextField("Year", text: $day)
                .border(.secondary)
                .onChange(of: day) { oldValue, newValue in
                    updateDate()
                }
            Text("Date is \(date)")
        }.padding()
            .border(.primary)
    }
    
    func updateDate(){
        let dateString = "\(day)/\(month)/\(year)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        let inputDate = dateFormatter.date(from: dateString)
        date = inputDate ?? Date()
    }
}

struct CustomInputViewPreviewProvider: PreviewProvider {
    @State static var date: Date = Date()
    static var previews: some View {
        DateInputView(date: $date)
    }
}
