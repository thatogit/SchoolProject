package org.duplicateresearches.model;

import javax.persistence.*;

@Entity
@Table(name="DocumentContent")
public class DocumentMetadata {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "DocumentContent_id" )
    private Integer id;

    @Column(name="doc_title")
    private String title;

    @Column(name="doc_keyword")
    private String keyword;

/*
    @ManyToOne
    @JoinColumn(name = "document_id")
    private DocumentStorage documentStorage;
*/

/*
    public DocumentStorage getDocumentStorage() {
        return documentStorage;
    }

    public void setDocumentStorage(DocumentStorage documentStorage) {
        this.documentStorage = documentStorage;
    }*/

    public DocumentMetadata(String title, String keyword) {
        this.title = title;
        this.keyword = keyword;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

}
