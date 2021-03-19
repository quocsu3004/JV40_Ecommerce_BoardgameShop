/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.utils;

import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Image;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfTable;
import com.lowagie.text.pdf.PdfWriter;
import com.mycompany.jv40_ecommerce_boardgameshop.entity.Cart;
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
    
    private Cart cart;
    
    public OrderDetailPDFExporter(List<CartDetail> listCartDetail, Cart cart) {
        this.listCartDetail = listCartDetail;
        this.cart = cart;
    }
    
    private void writeTableCustomerInfo(PdfPTable pdfPTable1) {
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(Color.DARK_GRAY);
        cell.setPadding(2);
        
        Font font = FontFactory.getFont(FontFactory.TIMES_ROMAN);
        font.setColor(Color.WHITE);
        
        cell.setPhrase(new Phrase("Customer Name", font));
        pdfPTable1.addCell(cell);
        
        cell.setPhrase(new Phrase("Gender", font));
        pdfPTable1.addCell(cell);
        
        cell.setPhrase(new Phrase("Birth Date", font));
        pdfPTable1.addCell(cell);
        
        cell.setPhrase(new Phrase("Address", font));
        pdfPTable1.addCell(cell);
        
        cell.setPhrase(new Phrase("Phone Number", font));
        pdfPTable1.addCell(cell);
        
        cell.setPhrase(new Phrase("Order Date", font));
        pdfPTable1.addCell(cell);
        
    }
    
    private void writeTableCustomerInfoData(PdfPTable pdfPTable1) {
        for (CartDetail cartDetail : listCartDetail) {
            pdfPTable1.addCell(cartDetail.getCartId().getFullName());
            pdfPTable1.addCell(cartDetail.getCartId().getGender().toString());
            pdfPTable1.addCell(cartDetail.getCartId().getBirthDate().toString());
            pdfPTable1.addCell(cartDetail.getCartId().getAddress());
            pdfPTable1.addCell(cartDetail.getCartId().getPhoneNumber());
            pdfPTable1.addCell(String.valueOf(cartDetail.getCartId().getOrderDate()));
            
        }
    }
    
    private void writeTableHeader(PdfPTable pdfPTable) {
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(Color.CYAN);
        
        cell.setPadding(5);
        
        Font font = FontFactory.getFont(FontFactory.TIMES_ROMAN);
        font.setColor(Color.BLACK);
        
        cell.setPhrase(new Phrase("Cart Number", font));
        pdfPTable.addCell(cell);
        
        cell.setPhrase(new Phrase("Product", font));
        pdfPTable.addCell(cell);
        
        cell.setPhrase(new Phrase("Price Each", font));
        pdfPTable.addCell(cell);
        
        cell.setPhrase(new Phrase("Quantity", font));
        pdfPTable.addCell(cell);
        

        
    }
    
    private void writeTableData(PdfPTable pdfPTable) {
        for (CartDetail cartDetail : listCartDetail) {
            pdfPTable.addCell(String.valueOf(cartDetail.getCartId().getCode()));
            pdfPTable.addCell(cartDetail.getProductId().getName());
            pdfPTable.addCell("$" + String.valueOf(cartDetail.getPrice()));
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
        
        Paragraph p = new Paragraph("Invoice", font);
        p.setAlignment(p.ALIGN_CENTER);
        
        document.add(p);
        
        PdfPTable pdfPTable1 = new PdfPTable(6);
        pdfPTable1.setWidthPercentage(100f);
        pdfPTable1.setWidths(new float[]{3.0f, 1.5f, 3.0f, 3.0f, 3.0f, 3.0f});
        pdfPTable1.setSpacingBefore(10);
        
        
        writeTableCustomerInfo(pdfPTable1);
        writeTableCustomerInfoData(pdfPTable1);
        
        document.add(pdfPTable1);
        
         Paragraph p1 = new Paragraph("Details", font);
        p.setAlignment(p.ALIGN_CENTER);
        
        document.add(p1);
        
        
        PdfPTable pdfPTable = new PdfPTable(4);
        pdfPTable.setWidthPercentage(100f);
        pdfPTable.setWidths(new float[]{2f, 3.5f, 3.0f, 3.0f});
        pdfPTable.setSpacingBefore(10);
        
        writeTableHeader(pdfPTable);
        writeTableData(pdfPTable);
        
        document.add(pdfPTable);
        
        String totalPrice =  String.valueOf(cart.getTotalPrice());
        
        Paragraph p2 = new Paragraph("Total Price: $" + totalPrice, font);
        p2.setAlignment(p2.ALIGN_RIGHT);
        
        document.add(p2);
        
        document.close();
        
    }
    
}
