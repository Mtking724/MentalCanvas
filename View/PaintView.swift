
import SwiftUI

struct Drawing: Identifiable {
    var id = UUID()
    var path = Path()
    var color = Color.gray
    var lineWidth: CGFloat = 5
    
    init(color: Color = .gray, lineWidth: CGFloat = 5) {
        self.color = color
        self.lineWidth = lineWidth
    }
}

struct DrawingView: View {
    @State private var drawings: [Drawing] = []
    @State private var currentDrawing: Drawing = Drawing()

    var body: some View {
        VStack {
            Canvas { context, size in
                for drawing in drawings {
                    context.stroke(drawing.path, with: .color(drawing.color), lineWidth: drawing.lineWidth)
                }
                context.stroke(currentDrawing.path, with: .color(currentDrawing.color), lineWidth: currentDrawing.lineWidth)
            }
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        let point = value.location
                        currentDrawing.path.addLine(to: point)
                    }
                    .onEnded { value in
                        drawings.append(currentDrawing)
                        // 以下の行で直前の色と太さを保持し、初期化ではなく更新するように変更
                        currentDrawing = Drawing(color: currentDrawing.color, lineWidth: currentDrawing.lineWidth)
                    }
            )
            
            HStack {
                ColorButton(color: .blue, drawing: $currentDrawing)
                ColorButton(color: .red, drawing: $currentDrawing)
                ColorButton(color: .green, drawing: $currentDrawing)
                ColorButton(color: .yellow, drawing: $currentDrawing)
                ColorButton(color: .purple, drawing: $currentDrawing)
                ColorButton(color: .mint, drawing: $currentDrawing)
                ColorButton(color: .black, drawing: $currentDrawing)
                
                ThicknessButton(thickness: 5, drawing: $currentDrawing)
                ThicknessButton(thickness: 10, drawing: $currentDrawing)
                ThicknessButton(thickness: 15, drawing: $currentDrawing)
                EraserButton(drawing: $currentDrawing)
            }
        }
    }
}

struct ColorButton: View {
    var color: Color
    @Binding var drawing: Drawing

    var body: some View {
        Button(action: {
            drawing.color = color
        }) {
            Circle()
                .fill(color)
                .frame(width: 30, height: 30)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
        }
    }
}

struct ThicknessButton: View {
    var thickness: CGFloat
    @Binding var drawing: Drawing

    var body: some View {
        Button(action: {
            drawing.lineWidth = thickness
        }) {
            Circle()
                .fill(drawing.color)
                .frame(width: thickness + 10, height: thickness + 10)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
        }
    }
}

struct EraserButton: View {
    @Binding var drawing: Drawing

    var body: some View {
        Button(action: {
            drawing.color = .white
            drawing.lineWidth = 20
        }) {
            Image(systemName: "eraser")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundColor(.black)
        }
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
    }
}
