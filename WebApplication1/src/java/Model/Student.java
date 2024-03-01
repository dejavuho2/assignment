/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DAO.StudentDao;
import java.io.Serializable;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class Student implements Serializable{
    private int id;
    private String name;
    private char gender;
    private Date dob;
    public Student() {
    }


    public Student(String name, String gender, String dob) {
        this.name = name;
        this.gender = gender.charAt(0);
        setDob(dob);
    }
    
    public Student(int id, String name, String gender, Date dob) {
        this.id = id;
        this.name = name;
        this.gender = gender.charAt(0);
        this.dob = dob;
    }
    public Student(Student s){
        this(s.id,s.name,s.getGender(),s.dob);
    }
    public Student(int id){
//        this(StudentDao.getStudent(id));
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        switch(gender){
            case 'M': return "Male";
            case 'F': return "Female";
            case 'L': return "LGBT";
            default: return "Other";
        }
    }
    
    public void setGender(String gender) {
        this.gender = gender.charAt(0);
    }

    public String getDob() {
        SimpleDateFormat sd= new SimpleDateFormat("dd/MM/yyyy");
        return sd.format(dob);
    }

    public Date getDateOB(){
        return dob;
    }
    public void setDob(String dob) {
        SimpleDateFormat sd= new SimpleDateFormat("dd/MM/yyyy");
        try {
            this.dob = new Date(sd.parse(dob).getTime());
        } catch (Exception ex) {
            throw new RuntimeException("Invalid DOB");
        }
    }

    @Override
    public String toString() {
        return "Student{" + "id=" + id + ", name=" + name + ", gender=" + getGender() + ", dob=" + getDob() + '}';
    }
    
    public List<Student> getAll( ){
        List<Student> listStudent = new ArrayList<Student>();
        listStudent = StudentDao.getAllStudents();
        return listStudent;
    }
    public int addNew(){
        return StudentDao.addStudent(this);
    }
//
    public void update(){
         StudentDao.updateStudent(this);
    }
//    
    public void delete(int id){
         StudentDao.deleteStudent(id);
    }
    public Student getStudent(int id){
        Student s = new Student();
        s = StudentDao.getStudent(id);
        return s;
    }
    
}


