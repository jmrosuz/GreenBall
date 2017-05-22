package com.bj.greenball.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.swing.text.MaskFormatter;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.bj.greenball.model.Player;

public class XlsReader {
	
	public List<Integer> erroneos = new ArrayList<Integer>();
	
	
	public Set<Player> readFile(String path) throws IOException{
		Set<Player> players = new HashSet<Player>();
    try {
		FileInputStream inputStream = new FileInputStream(new File(path));
		Workbook workbook = new XSSFWorkbook(inputStream);
        Sheet firstSheet = workbook.getSheetAt(0);
        
        for (int f=0;f<=firstSheet.getLastRowNum();f++){
            Row nextRow = firstSheet.getRow(f);
            if (f==0){
	            for(int i=0;i<nextRow.getLastCellNum();i++){
	            	 Cell cell = nextRow.getCell(i);
	            	 
	            	
	                    switch (i){
	                    case 0:
	                    	if (!cell.getStringCellValue().equals("Nombre")){
	                    		return players;
	                    	}
	                    	break;
	                    case 3:
	                    	if (!cell.getStringCellValue().equals("Club")){
	                    		return players;
	                    	}
	                    	break;
	                    case 5:
	                    	if (!cell.getStringCellValue().equals("Email")){
	                    		return players;
	                    	}
	                    	break;
	                    }	
	            }
            }
            else{
            	Player player = new Player();
            	 for(int s=0;s<=nextRow.getLastCellNum();s++){
	            	 Cell cell = nextRow.getCell(s);
	            	 switch (s) {
	                    case 0:
	                    	if(cell != null && cell.getCellType() != Cell.CELL_TYPE_BLANK && cell.getStringCellValue().matches("^[a-zA-Z0-9][a-zA-Z0-9 ]*$")){
	                    		player.setName(cell.getStringCellValue());
	                    	}
	                    	else{
	                    		erroneos.add(s+1);
	                    	}
	                        break;
	                    case 1:
	                    	if(cell != null && cell.getCellType() != Cell.CELL_TYPE_BLANK && cell.getStringCellValue().matches("^[a-zA-Z0-9][a-zA-Z0-9 ]*$")){
	                    		player.setMiddleName(cell.getStringCellValue());
	                    	}
	                    	else{
	                    		erroneos.add(s+1);
	                    	}
	                        break;
	                        
	                    case 2:
	                    	if(cell != null && cell.getCellType() != Cell.CELL_TYPE_BLANK && cell.getStringCellValue().matches("^[a-zA-Z0-9][a-zA-Z0-9 ]*$")){
	                    		player.setLastName(cell.getStringCellValue());
	                    	}
	                    	else{
	                    		erroneos.add(s+1);
	                    	}
	                        break;
	                    case 3:
	                    	if(cell != null && cell.getCellType() != Cell.CELL_TYPE_BLANK){
	                    		player.setClub(cell.getStringCellValue());
	                    	}
	                    	else{
	                    		erroneos.add(s+1);
	                    	}
	                       break;
	                    case 4:
	                    	String phoneMask= "(###) ###-####";
							try {
								MaskFormatter maskFormatter= new MaskFormatter(phoneMask);
								if(cell != null && cell.getCellType() != Cell.CELL_TYPE_BLANK){
									
									maskFormatter.setValueContainsLiteralCharacters(false);
									DataFormatter df = new DataFormatter();
									String value = df.formatCellValue(cell);
									player.setTelephone(maskFormatter.valueToString(value));
								}
								else{
		                    		erroneos.add(s+1);
		                    	}
							} catch (ParseException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
	                   	 
	                       break;
	                    case 5:
	                        if(cell != null && cell.getCellType() != Cell.CELL_TYPE_BLANK && 
	                        	cell.getStringCellValue().matches("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$")){
	                        	player.setEmail(cell.getStringCellValue());
	                        }
	                        else{
	                    		erroneos.add(s+1);
	                    	}
	                       break;
	                    case 6:
	                    	if(cell != null && cell.getCellType() != Cell.CELL_TYPE_BLANK){
	                    		if (cell.getStringCellValue().equals("M") || cell.getStringCellValue().equals("F")){
	                    			player.setSex(cell.getStringCellValue().charAt(0));
	                    		}
	                    		else{
	                    			player.setSex('M');
	                    		}
	                    	}
	                    	else{
	                    		player.setSex('M');
	                    	}
	                       break;
	                    case 7:
	                    	if(cell != null && cell.getCellType() != Cell.CELL_TYPE_BLANK){
	                    		player.setKid(Boolean.valueOf(cell.getStringCellValue()));
	                    	}else{
	                    		player.setKid(false);
	                    	}
	                       break;
	                     
	                }
	            	 
	            	 
	            }
            	 players.add(player);
            }
            
            
            System.out.println();
        }
         
        workbook.close();
        inputStream.close();
        
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    
    return players;
    
	}


}
