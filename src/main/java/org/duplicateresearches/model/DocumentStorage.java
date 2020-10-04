package org.duplicateresearches.model;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import javax.persistence.*;
import java.sql.Struct;

//@Configuration
//@ConfigurationProperties(prefix = "file")
@Entity
@Table(name="student_document")
public class DocumentStorage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name="user_id")
    private int userId;
    @Column(name="file_name")
    private String fileName;
    @Column(name="document_type")
    private String documentType;
    @Column(name="document_title")
    private String title;
    @Column(name="document_Keyword")
    private String keywords;
    @Column(name="upload_dir")
    private String uploadDir;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(unique = true)
    private Student student;

    public DocumentStorage() {

    }

    public DocumentStorage(int userId, String fileName, String documentType, String title, String keywords, String uploadDir, Student student) {
        this.userId = userId;
        this.fileName = fileName;
        this.documentType = documentType;
        this.title = title;
        this.keywords = keywords;
        this.uploadDir = uploadDir;
        this.student = student;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getDocumentType() {
        return documentType;
    }

    public void setDocumentType(String documentType) {
        this.documentType = documentType;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getUploadDir() {
        return uploadDir;
    }

    public void setUploadDir(String uploadDir) {
        this.uploadDir = uploadDir;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
}
