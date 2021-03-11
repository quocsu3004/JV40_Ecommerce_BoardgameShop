/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.utils;

import com.mycompany.jv40_ecommerce_boardgameshop.entity.Cart;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author Admin
 */

public class OrderExcelExporter {
    
    private XSSFWorkbook workbook;
    private XSSFSheet sheet;
    private List<Cart> listOrders;

    public OrderExcelExporter(List<Cart> listOrders) {
        workbook = new XSSFWorkbook();
        this.listOrders = listOrders;
    }
    
    private void writeHeaderLine(){
        sheet = workbook.createSheet("Orders");
        
        Row row = sheet.createRow(0);
        
        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setBold(true);
        font.setFontHeight(16);
        style.setFont(font);
        
        createCell(row, 0, "id", style);
        createCell(row, 1, "Customr Name", style);
        createCell(row, 2, "Address", style);
        createCell(row, 3, "Phone Number", style);
        createCell(row, 4, "Gender", style);
        createCell(row, 5, "Birthdate", style);
        createCell(row, 6, "Order Date", style);
        createCell(row, 7, "Order Status", style);
        createCell(row, 8, "Total Price", style);
    }
    
    private void writeDataLines(){
        int rowCount = 1;
        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setFontHeight(14);
        style.setFont(font);
        
        for(Cart cart: listOrders){
            Row row = sheet.createRow(rowCount++);
            int columnCount = 0;
            
            createCell(row, columnCount++, cart.getId(), style);
            createCell(row, columnCount++, cart.getFullName(), style);
             createCell(row, columnCount++, cart.getAddress(), style);
            createCell(row, columnCount++, cart.getPhoneNumber(), style);
            createCell(row, columnCount++, cart.getGender().toString(), style);
            createCell(row, columnCount++, cart.getBirthDate().toString(), style);
            createCell(row, columnCount++, cart.getOrderDate().toString(), style);
            createCell(row, columnCount++, cart.getStatus().toString(), style);
            createCell(row, columnCount++, cart.getTotalPrice(),style);
        }
                
    }
    
    private void createCell(Row row, int columnCount, 
            Object value, CellStyle style){
        sheet.autoSizeColumn(columnCount);
        Cell cell = row.createCell(columnCount);
        if(value instanceof Integer){
            cell.setCellValue((Integer) value);
        }else if (value instanceof Boolean) {
            cell.setCellValue((Boolean) value);
        }else if (value instanceof Double) {
            cell.setCellValue((Double) value);}       
        else{
            cell.setCellValue((String) value);
        }
        cell.setCellStyle(style);
}

    public void export(HttpServletResponse response) throws IOException{
        writeHeaderLine();
        writeDataLines();
        
        ServletOutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();
        
        outputStream.close();
    }
    
}
