package com.datacollect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BaseDao
{
  public Connection getConn()
    throws Exception
  {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vendorsystem?useUnicode=true&characterEncoding=utf-8", "root", "root");
    return conn;
  }

  public void closeAll(Connection conn, PreparedStatement pstmt, ResultSet rs)
  {
    try
    {
      if (rs != null)
        rs.close();

      if (pstmt != null)
        pstmt.close();

      if (conn == null) return;
      conn.close();
    }
    catch (Exception ex)
    {
      ex.printStackTrace();
    }
  }

  public int executeSQL(String StrSQL, String[] param)
  {
    int num = -1;
    Connection conn = null;
    PreparedStatement pstmt = null;
    try
    {
      conn = getConn();
      pstmt = conn.prepareStatement(StrSQL);
      if (param != null)
        for (int i = 0; i < param.length; ++i)
          pstmt.setString(i + 1, param[i]);


      num = pstmt.executeUpdate();
    }
    catch (SQLException ex)
    {
      ex.printStackTrace();

      closeAll(conn, pstmt, null);
    }
    catch (Exception ex)
    {
      ex.printStackTrace();

      closeAll(conn, pstmt, null); } finally { closeAll(conn, pstmt, null);
    }
    return num;
  }
}