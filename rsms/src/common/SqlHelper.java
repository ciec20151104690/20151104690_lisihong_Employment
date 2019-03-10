package common;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SqlHelper {
	
    public int getCountBySql(String sql) {
        Connection conn = null;
        try {
            conn = JDBCUtil.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet re = stmt.executeQuery();  
            if(re.next()) {
                return re.getInt(1);
            }
            return 0;
        } catch (Exception e) {  
            e.printStackTrace();
            return 0;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                    return 0;
                }
            }
        }
    }
    
    public List<Map<String, String>> getDataBySql(String sql) {
        Connection conn = null;
        try {
            conn = JDBCUtil.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            
            ResultSet re = stmt.executeQuery();  
            return resultSetToList(re);
        } catch (Exception e) {  
            e.printStackTrace();
            return null;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }
    }
    
    public boolean executeBySql(String sql) {
        Connection conn = null;
        try {
            conn = JDBCUtil.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            int count = stmt.executeUpdate(sql);
            return count >= 0 ? true : false;
        } catch (Exception e) {  
            e.printStackTrace();
            return false;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                    return false;
                }
            }
        }
    }
    
    private List<Map<String, String>> resultSetToList(ResultSet rs) throws java.sql.SQLException {
        if (rs == null) {
            return null;
        }
        ResultSetMetaData md = rs.getMetaData();   
        int columnCount = md.getColumnCount();   
        List<Map<String, String>> list = new ArrayList<Map<String, String>> (); 
        Map<String, String> rowData = new HashMap<String, String>();   
        while (rs.next()) {   
            rowData = new HashMap<String, String> (columnCount);   
            for (int i = 1; i <= columnCount; i++) {   
                rowData.put(md.getColumnName(i), rs.getObject(i) == null?"":rs.getObject(i).toString());   
            }   
            list.add(rowData);   
        }   
        return list;   
    }
	
}