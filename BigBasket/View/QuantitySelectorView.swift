import SwiftUI


// Quantity Selector View
struct QuantitySelectorView: View {
    @ObservedObject var quantityManager: QuantityManager
    @Binding var item: Product
    
    var body: some View {
        HStack {
            Text("-")
                .padding()
                .background( Color.blue)
                .cornerRadius(8)
                .onTapGesture {
                    if item.quantity > 0 {
                        item.quantity -= 1
                        quantityManager.updateQuantity(for: item.id, to: item.quantity)
                    }
                }
            
            Text("\(item.quantity)")
                .font(.title2)
                .frame(width: 40)
            
            Text("+")
                .padding()
                .background( Color.blue)
                .cornerRadius(8)
                .onTapGesture {
                    item.quantity += 1
                    quantityManager.updateQuantity(for: item.id, to: item.quantity)
                }
            
        }
    }
}


