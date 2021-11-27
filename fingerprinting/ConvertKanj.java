import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.io.File;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import javax.imageio.IIOException;

public class ConvertKanj {
    public static void main(String[] args) {      ///workspace/KANJ/BELLADERE_030719/fp_images/hms_id

        if (args == null || args.length == 0) {
            System.out.println(
                    "You must set the name of the site as an argument for the program."
                            + " Example: java -cp 'mysql-connector.jar:.' convertKanj BELLADERE ");
            return;
        }

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://172.17.0.1:3320/exchange", "root", "mysql");
            String src = "files/" + args[0].toUpperCase() + "/fp_images/", dest = "files/" + args[0].toUpperCase() + "/fp_images_with_emr_id/";

            File f = null;
            BufferedImage image = null;
            int notFound = 0;

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(
                    "select p.id, p.hivemr from person p where p.hivemr is not null and (p.left_index is not null or p.right_index is not null); ");

            while (rs.next()) {

                try {
                    System.out.println("Processing: "+src + rs.getInt(1) + "_leftIndex");
                    f = new File(src + rs.getInt(1) + "_leftIndex");                   
                    if (f.exists()) {
                        image = ImageIO.read(f);
                        f = new File(dest + rs.getInt(2) + ".jpeg"); // output file path
                    } else {
                        f = new File(src + rs.getInt(1) + "_rightIndex");
                        image = ImageIO.read(f);
                        f = new File(dest + rs.getInt(2) + ".jpeg"); // output file path
                    }
                    ImageIO.write(image, "jpeg", f);
                } catch (IIOException e) {
                    notFound++;
                }

            }

            System.out.println("Not found: " + notFound);
            

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        System.out.println("Operation terminated successfully");
    }
}
