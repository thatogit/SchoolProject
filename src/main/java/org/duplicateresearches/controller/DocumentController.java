package org.duplicateresearches.controller;

import org.duplicateresearches.model.UploadFileResponse;
import org.duplicateresearches.services.DocumentStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@RestController
public class DocumentController {
    @Autowired
    private DocumentStorageService documentStorageService;


    @PostMapping("/uploadFile")
    public  UploadFileResponse uploadFile(@RequestParam("file") MultipartFile file,
                                                @RequestParam("title") String title,
                                                @RequestParam("studNum") String studNum,
                                          @RequestParam("keyword") String keywrd){
        String fileName=documentStorageService.storeFile(file,title,studNum,keywrd);
        String fileDownloadUri= ServletUriComponentsBuilder
                .fromCurrentContextPath().path("/downloadFile/")
                .path(fileName)
                .toUriString();
        return new UploadFileResponse(fileName,fileDownloadUri,file.getContentType(),file.getSize());
    }


    public ResponseEntity<Resource> downloadFile(@RequestParam("studNum") String studN,
                                                 @RequestParam("docType") String docType,
                                                 HttpServletRequest request){

        String fileName = documentStorageService.getDocumentName(studN, docType);
        Resource resource=null;

        if (fileName !=null && !fileName.isEmpty()){
            try{
                resource=documentStorageService.loadFileAsResource(fileName);
            }catch (Exception e){
                e.printStackTrace();
            }

            String contentType=null;
            try{
                contentType=request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
            }catch (IOException ex){

            }

            if (contentType==null){
                contentType="application/octet-stream";
            }

            return ResponseEntity.ok().contentType(MediaType.parseMediaType(contentType))
                    .header(HttpHeaders.CONTENT_DISPOSITION,"attachment;filename=\""+
                            resource.getFilename()+"\"").body(resource);

        }else {
            return ResponseEntity.notFound().build();
        }

    }


}
