package message;

import java.io.File;
import java.io.FileWriter;
import java.util.Scanner;

public class Main {
    private String code;

     public void Main(String code){
        this.code=code;
    }
    public void write(){

        try{
            FileWriter fileWriter=new FileWriter("D:\\卓面\\code文件.txt");
            fileWriter.write(code);

            fileWriter.close();
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e);
        }
    }
    public String read(){
         String c="";
        File readfile=new File("D:\\卓面\\code文件.txt");
        try {
            Scanner scanner=new Scanner(readfile);
            while(scanner.hasNextLine()){
                String Line=scanner.nextLine();
                //System.out.println(Line);
                c=Line;
            }
            scanner.close();
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e);
        }
        return c;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
