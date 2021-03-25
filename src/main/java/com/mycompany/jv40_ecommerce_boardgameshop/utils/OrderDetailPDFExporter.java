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

    private final List<CartDetail> listCartDetail;

    private final Cart cart;
    
    

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
        pdfPTable1.addCell(cart.getFullName());
        pdfPTable1.addCell(cart.getGender().toString());
        pdfPTable1.addCell(cart.getBirthDate().toString());
        pdfPTable1.addCell(cart.getAddress());
        pdfPTable1.addCell(cart.getPhoneNumber());
        pdfPTable1.addCell(String.valueOf(cart.getOrderDate()));
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
        
        cell.setPhrase(new Phrase("Discounted", font));
        pdfPTable.addCell(cell);

        cell.setPhrase(new Phrase("Quantity", font));
        pdfPTable.addCell(cell);

    }

    private void writeTableData(PdfPTable pdfPTable) {
        for (CartDetail cartDetail : listCartDetail) {
            pdfPTable.addCell(String.valueOf(cartDetail.getCartId().getCode()));
            pdfPTable.addCell(cartDetail.getProductId().getName());
            pdfPTable.addCell("$" + String.valueOf(cartDetail.getPrice()));
            pdfPTable.addCell( String.valueOf(cartDetail.getDiscountPrice())+ "%");
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

        Font font1 = FontFactory.getFont(FontFactory.TIMES);
        font1.setSize(14);
        font1.setColor(Color.BLACK);
        
        Font font2 = FontFactory.getFont(FontFactory.TIMES);
        font2.setSize(25);
        font2.setColor(Color.BLUE);

        Paragraph p = new Paragraph("Invoice From Hippo Mepplo", font2);
        p.setAlignment(p.ALIGN_CENTER);

        document.add(p);

        Paragraph p3 = new Paragraph("Order Date: " + cart.getOrderDate().toString(), font1);
        p3.setAlignment(p3.ALIGN_LEFT);
        document.add(p3);
        Paragraph p4 = new Paragraph("Order Number: " + cart.getCode(), font1);
        p4.setAlignment(p4.ALIGN_LEFT);
        document.add(p4);

        Paragraph p5 = new Paragraph("CustomerName: " + cart.getFullName(), font1);
        p5.setAlignment(p5.ALIGN_RIGHT);
        document.add(p5);
        Paragraph p6 = new Paragraph("Address: " + cart.getAddress(), font1);
        p6.setAlignment(p6.ALIGN_RIGHT);
        document.add(p6);
        Paragraph p7 = new Paragraph("BithDate: " + cart.getBirthDate().toString(), font1);
        p7.setAlignment(p7.ALIGN_RIGHT);
        document.add(p7);
        Paragraph p8 = new Paragraph("Phone Number: " + cart.getPhoneNumber().toString(), font1);
        p8.setAlignment(p8.ALIGN_RIGHT);
        document.add(p8);
        Paragraph p9 = new Paragraph("Gender: " + cart.getGender().toString(), font1);
        p9.setAlignment(p9.ALIGN_RIGHT);
        document.add(p9);

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

        PdfPTable pdfPTable = new PdfPTable(5);
        pdfPTable.setWidthPercentage(100f);
        pdfPTable.setWidths(new float[]{2f, 3.5f, 3.0f,2f,3.0f});
        pdfPTable.setSpacingBefore(10);

        writeTableHeader(pdfPTable);
        writeTableData(pdfPTable);

        document.add(pdfPTable);

        String totalPrice = String.valueOf(cart.getTotalPrice());

        Paragraph p2 = new Paragraph("Total Price: $" + totalPrice, font);
        p2.setAlignment(p2.ALIGN_RIGHT);

        document.add(p2);

        document.close();

    }

}
