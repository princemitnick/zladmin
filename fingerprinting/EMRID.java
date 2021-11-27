import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;


import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.Path;

import java.io.IOException;
import java.util.List;
import java.util.stream.Stream;
import java.util.stream.Collectors;


import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import javax.imageio.IIOException;

public class EMRID {
    public static void main(String[] args) {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://172.17.0.1:3320/exchange","root","mysql");
            //ResultSet rs = stmt.executeQuery("select pa.id, pa.emr_id from patient pa inner join person p on pa.id=p.id where pa.emr_id is not null and concat('', pa.emr_id*1)=pa.emr_id and p.has_finger ='y';");
            
	    String belladeres = "Belladeres/", 
                   cerca = "Cerca la Source/", 
		   hinche = "Hinche/",
		   hum = "HUM/",
		   lacollines = "Lacollines/",
                   sspe = "SSPE/", 
		   thomonde = "Thomonde/",
                   verrettes="Verrettes/",
		   pra="PRA/";
		
		String[] sites = {belladeres, cerca, hinche, hum, lacollines, sspe, thomonde, verrettes, pra};
		for(String st : sites){
			try (Stream<Path> walk = Files.walk(Paths.get(st))) {
				List<String> result = walk.filter(Files::isRegularFile).map(x -> x.toString().substring(st.length(), x.toString().length()-5)).collect(Collectors.toList());
		    		Statement stmt = con.createStatement();
				//stmt.executeUpdate("insert into emrid values ( "+s+" )");
				result.forEach(s -> {
					try {
						stmt.executeUpdate("insert into temp(emr_id, url) values ( "+s+", '"+st+"' )");
					} catch(SQLException q){
						q.printStackTrace();
					}
				});

			} catch(SQLException s){
				s.printStackTrace();
			}
		}		
        }catch(Exception e){
		System.out.println(e);
	}
    }
}
