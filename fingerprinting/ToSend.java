import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.io.File;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import javax.imageio.IIOException;

public class ToSend{
    public static void main(String[] args) {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://172.17.0.1:3320/exchange","root","mysql");
            String src = ToSend.class.getProtectionDomain().getCodeSource().getLocation().getPath()+"06_03_2020/",
            dest = ToSend.class.getProtectionDomain().getCodeSource().getLocation().getPath()+"to_send_on_060320/";
            File f = null;
            BufferedImage image = null;
		        int notFound = 0;
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select t.emr_id from temp t where t.emr_id not in (select emr_id from emrid);"); //la table temp est creee pour recevoir les donnees provenant de la classe EMRID
            while(rs.next()){
		            try {
                    String pic = rs.getInt(1)+".jpeg";
                    System.out.println(src+pic);
                    f = new File(src+pic);
                    image = ImageIO.read(f);
                    System.out.println(dest+pic);
                    f = new File(dest+pic);  //output file path
                    ImageIO.write(image, "jpeg", f);
                } catch(IIOException e){
                    notFound++;
                }
          }
	         System.out.print("Not found: "+notFound);
            con.close();
        }catch(Exception e){System.out.println(e);}
    }
}
