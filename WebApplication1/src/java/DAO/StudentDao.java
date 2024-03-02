/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Student;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class StudentDao {

    public static PreparedStatement stmt = null;
    public static ResultSet rs = null;

    public static java.sql.Date convertStringToSqlDate(String dob) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            java.util.Date utilDate = sdf.parse(dob);
            return new java.sql.Date(utilDate.getTime());
        } catch (ParseException e) {
            throw new RuntimeException("Invalid DOB format");
        }
    }

    public static int addStudent(Student student) {
        int id = -1;
        try (Connection con = DBConnection.getConnection()) {
            stmt = con.prepareStatement("Insert into Student(name, gender,dob) output inserted.id values(?,?,?)");
            stmt.setString(1, student.getName());
            stmt.setString(2, student.getGender().substring(0, 1));
            stmt.setDate(3, convertStringToSqlDate(student.getDob()));
            rs = stmt.executeQuery();
            if (rs.next()) {
                id = rs.getInt(1);
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return id;
    }

    public static Student getStudent(int id) {
        String getStudent = "SELECT * FROM [dbo].[Student] where id=?";
        try (Connection con = DBConnection.getConnection()) {
            if (con != null) {
                stmt = con.prepareStatement(getStudent);
                stmt.setInt(1, id);
                rs = stmt.executeQuery();
                if (rs.next()) {
                    Student st = new Student(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4));
                    return st;
                }
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static List<Student> getAllStudents() {
        List<Student> listStudent = new ArrayList<>();
        String getAllStudent = "SELECT * FROM [dbo].[Student]";
        try (Connection con = DBConnection.getConnection()) {
            if (con != null) {
                stmt = con.prepareStatement(getAllStudent);
                rs = stmt.executeQuery();
                while (rs.next()) {
                    Student st = new Student(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4));
                    listStudent.add(st);
                }
                return listStudent;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void updateStudent(Student student) {
        String checkExistence = "SELECT * FROM [dbo].[Student] WHERE Id=?";
        String update = "UPDATE [dbo].[Student]\n"
                + "   SET [Name] =?\n"
                + "      ,[Gender] =?\n"
                + "      ,[Dob] =?\n"
                + " WHERE Id =?";
        try (Connection con = DBConnection.getConnection()) {
            stmt = con.prepareStatement(checkExistence);
            stmt.setInt(1, student.getId());
            rs = stmt.executeQuery();
            if (rs.next()) {
                stmt = con.prepareStatement(update);
                stmt.setString(1, student.getName());
                stmt.setString(2, student.getGender().substring(0, 1));
                stmt.setDate(3, convertStringToSqlDate(student.getDob()));
                stmt.setInt(4, student.getId());
                stmt.executeUpdate();
            } else {
                System.out.println("Don't exist id = " + student.getId());
            }
        } catch (Exception e) {
        }
    }

    public static void deleteStudent(int id) {
        String deleted = "DELETE FROM [dbo].[Student] WHERE id=?";
        try (Connection con = DBConnection.getConnection()) {
            if (con != null) {
                stmt = con.prepareStatement(deleted);
                stmt.setInt(1, id);
                stmt.executeQuery();
            }
        } catch (Exception e) {
        }

    }

}
