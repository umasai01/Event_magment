package com.dao;

import java.sql.*;
import java.util.*;
import com.bean.Event;

public class EventDao {

    // Method to retrieve all event records
    public static List<Event> getAllRecords() {
        List<Event> list = new ArrayList<Event>();
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/portal", "root", "toor");
            
            PreparedStatement ps = con.prepareStatement("SELECT * FROM events");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Event event = new Event();
                event.setId(rs.getInt("id"));
                event.setName(rs.getString("event_name"));
                event.setDate(rs.getDate("event_date").toLocalDate());
                event.setVenue(rs.getString("event_venue"));
                event.setDescription(rs.getString("event_desc"));
                event.setRequirements(rs.getString("event_req"));
                list.add(event);
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public static int delete(Event u){
		int status=0;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/portal", "root", "toor");
			PreparedStatement ps= con.prepareStatement("delete from events where id=?");
			ps.setInt(1, u.getId());
			status=ps.executeUpdate();
		}catch(Exception e){
			System.out.println(e);
		}
		return status;
	}

}