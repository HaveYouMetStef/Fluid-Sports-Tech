import SwiftUI
import PDFKit

struct PDFViewer: View {
    // Name of the PDF file (without extension)
    let pdfFileName: String

    var body: some View {
        VStack {
                PDFViewWrapper(fileName: pdfFileName)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        //      .navigationBarBackButtonHidden(true)

    }
}

struct PDFViewWrapper: UIViewRepresentable {
    let fileName: String

    func makeUIView(context: Context) -> PDFView {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "pdf") else {
            fatalError("PDF file not found.")
        }

        let pdfView = PDFView()
        pdfView.autoScales = true
        pdfView.document = PDFDocument(url: url)
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {}
}
