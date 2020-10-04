package org.duplicateresearches.model;

import javax.persistence.*;

@Entity
@Table(name="student")
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String username;
    private String firstname;
    private String lastname;
    private String studentnumber;
    private String email;
    private String password;
    @OneToOne(mappedBy = "student")
    private DocumentStorage documentStorage;

    public DocumentStorage getDocumentStorage() {
        return documentStorage;
    }

    public void setDocumentStorage(DocumentStorage documentStorage) {
        this.documentStorage = documentStorage;
    }

    public Student() {
    }

    public Student(String username, String firstname, String lastname, String studentnumber, String email, String password) {
        this.username = username;
        this.firstname = firstname;
        this.lastname = lastname;
        this.studentnumber = studentnumber;
        this.email = email;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getStudentnumber() {
        return studentnumber;
    }

    public void setStudentnumber(String studentnumber) {
        this.studentnumber = studentnumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", firstname='" + firstname + '\'' +
                ", lastname='" + lastname + '\'' +
                ", studentname='" + studentnumber + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
