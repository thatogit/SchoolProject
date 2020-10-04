package org.duplicateresearches.services;

import org.duplicateresearches.model.DocumentStorage;
import org.duplicateresearches.model.DocumentStorageException;
import org.duplicateresearches.repository.DocumentStorageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;

@Service
public class DocumentStorageService {
//    private final Path fileStorageLocation;

    @Autowired
    DocumentStorageRepository documentStorageRepository;

//    @Autowired
//    public DocumentStorageService(DocumentStorage documentStorage) {
//        this.fileStorageLocation = Paths.get(documentStorage.getUploadDir()).toAbsolutePath().normalize();
//        try {
//            Files.createDirectories(this.fileStorageLocation);
//
//        } catch (Exception ex) {
//            throw new DocumentStorageException("Could not create the directory where the uploaded files will be stored.", ex);
//        }
//    }

    public List<DocumentStorage> fetchAllDocumentStorage() {
        List target = new ArrayList<DocumentStorage>();
        documentStorageRepository.findAll().forEach(target :: add);
        return target;
    }

    public void deleteDocumentStorage(Integer id) {
        documentStorageRepository.deleteById(id);
    }

    public DocumentStorage findDocumentStorageById(Integer id) {
        return documentStorageRepository.findById(id).get();
    }

    public void saveDocument(DocumentStorage newDocument) {
        documentStorageRepository.save(newDocument);
    }

    public String storeFile(MultipartFile file, String title,String studNum,String keyword) {
            String originalFileName = StringUtils.cleanPath(file.getOriginalFilename());
            String fileName = "";

            String fileExtension = "";
            try {
                if (originalFileName.contains("..")) {
                    throw new DocumentStorageException("Sorry! Filename contains invalid path sequence " + originalFileName);

                }

                try {
                    fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                } catch (Exception ex) {
                    fileExtension = "";
                }

                fileName = originalFileName;
                // Copy file to the target location (Replacing existing file the same name)

//                Path targetLocation = this.fileStorageLocation.resolve(fileName);
                Path targetLocation = null;
                Files.copy(file.getInputStream(),targetLocation, StandardCopyOption.REPLACE_EXISTING);

                DocumentStorage doc =documentStorageRepository.checkDocumentByStudNumId(studNum,fileName);

                if (doc !=null){
                    doc.setFileName(fileName);
                    documentStorageRepository.save(doc);
                }else{
                    DocumentStorage newDoc = new DocumentStorage();
                    newDoc.setFileName(fileName);
//                    newDoc.setStudent_number(studNum);
//                    newDoc.setTitle(title);
//                    newDoc.setKeywrd(keyword);
                    documentStorageRepository.save(newDoc);
                }
                return fileName;
            } catch (IOException ex) {
                throw new DocumentStorageException("Could not store file " + fileName + " . Please try again!", ex);
            }
        }

        public Resource loadFileAsResource(String fileName) throws Exception{
            try{
//                Path filePath = this.fileStorageLocation.resolve(fileName).normalize();
                Path filePath =  null;
                        Resource resource= new UrlResource(filePath.toUri());

                if (resource.exists()){
                    return resource;
                }else {
                    throw new FileNotFoundException("File not found "+ fileName);
                }

            }catch (MalformedURLException ex){
                throw new FileNotFoundException("File not found "+ fileName);
            }
        }

        public String getDocumentName(String stdN, String docType){
        return documentStorageRepository.getUploadDocumentPath(stdN, docType);
        }


}
