/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.utils;

import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfTable;
import com.lowagie.text.pdf.PdfWriter;
import com.mycompany.jv40_ecommerce_boardgameshop.entity.CartDetail;
import java.awt.Color;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class OrderDetailPDFExporter {

    private List<CartDetail> listCartDetail;

    public OrderDetailPDFExporter(List<CartDetail> listCartDetail) {
        this.listCartDetail = listCartDetail;
    }

    private void writeTableHeader(PdfPTable pdfPTable) {
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(Color.CYAN);
        cell.setPadding(5);

        Font font = FontFactory.getFont(FontFactory.TIMES_ROMAN);
        font.setColor(Color.BLACK);

        cell.setPhrase(new Phrase("Cart Id", font));
        pdfPTable.addCell(cell);

        cell.setPhrase(new Phrase("Product", font));
        pdfPTable.addCell(cell);

        cell.setPhrase(new Phrase("Price", font));
        pdfPTable.addCell(cell);

        cell.setPhrase(new Phrase("Quantity", font));
        pdfPTable.addCell(cell);

    }

    private void writeTableData(PdfPTable pdfPTable) {
        for (CartDetail cartDetail : listCartDetail) {
            pdfPTable.addCell(String.valueOf(cartDetail.getCartId().getId()));
            pdfPTable.addCell(cartDetail.getProductId().getName());
            pdfPTable.addCell(String.valueOf(cartDetail.getPrice()));
            pdfPTable.addCell(String.valueOf(cartDetail.getQuantity()));

        }
    }

    public void export(HttpServletResponse response) throws IOException {
        Document document = new Document(PageSize.A4);
        PdfWriter.getInstance(document, response.getOutputStream());

        document.open();
        Font font = FontFactory.getFont(FontFactory.TIMES_ROMAN);
        font.setSize(20);
        font.setColor(Color.BLACK);
        
        Paragraph p = new Paragraph("Cart Detail", font);
        p.setAlignment(p.ALIGN_JUSTIFIED);
        
        document.add(p);
        
        PdfPTable pdfPTable = new PdfPTable(4);
        pdfPTable.setWidthPercentage(100f);
        pdfPTable.setWidths(new float[] {1.5f, 3.5f, 3.0f, 3.0f} );
        pdfPTable.setSpacingBefore(10);
        
        writeTableHeader(pdfPTable);
        writeTableData(pdfPTable);
        
        document.add(pdfPTable);
        
        document.close();

    }

}
