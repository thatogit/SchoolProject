package org.duplicateresearches.model;


public class DocumentStorageException extends  RuntimeException {
    public DocumentStorageException(String message){ super(message);}
    public DocumentStorageException(String message,Throwable cos){super(message,cos);}
}
