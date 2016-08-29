package exercise3;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Scanner;
import java.util.*;

public class FileSystems {
	
static ArrayList<String> fileNames=new ArrayList<>();
public static void main(String[] args) throws IOException{
	
	Scanner scan=new Scanner(System.in);
		
	//to input source folder
	System.out.println("Enter the source folder");
	String source=scan.nextLine();
	File sourceFile=new File(source);
		
	//to input destination folder
	System.out.println("Enter destination folder");
	String destination=scan.nextLine();
	File destinationFile=new File(destination);
	
	copyFolder(sourceFile,destinationFile);
	getNames(destinationFile);
	
	String filePath="/users/sanjanasripathi/desktop/fileDetail.txt";
	FileWriter writer=new FileWriter(filePath,true);
	writer.write("File Details");
	
	for(String name:fileNames){
		//FileWriter writer=new FileWriter(filePath,true);
		File file=new File(name);
		writer.write(name+"   "+file.length());
		writer.flush();
		
	}
	writer.close();
}

public static void copyFolder(File src,File dest) throws IOException{
	if(src.isDirectory()){
		if(!dest.exists()){
			dest.mkdir();
		}
		
		String fileList[]=src.list();
		
		for(String file:fileList){
			File srcFile=new File(src,file);
			File destFile=new File(src,file);
			copyFolder(srcFile,destFile);
		}
		
	}
	else {
		InputStream in=new FileInputStream(src);
		OutputStream out=new FileOutputStream(dest);
		byte buffer[]=new byte[1024];
		int length;
		
		while((length=in.read(buffer))>0){
			out.write(buffer, 0, length);
		}
		in.close();
		out.close();
	}
}

public static void getNames(File dest){
	if(dest.isDirectory()){
		String fileList[]=dest.list();
		
		for(String file:fileList){
		File destFile=new File(dest,file);
		getNames(destFile);
		
		}	
	}
	else{
		fileNames.add(dest.getName());
	}
	
}
}