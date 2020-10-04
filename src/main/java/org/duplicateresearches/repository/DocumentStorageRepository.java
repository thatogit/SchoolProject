package org.duplicateresearches.repository;

import org.duplicateresearches.model.DocumentStorage;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface DocumentStorageRepository extends CrudRepository<DocumentStorage, Integer> {
    @Query("Select a from DocumentStorage a where user_id=?1 and file_name=?2")
    DocumentStorage checkDocumentByStudNumId(String userId,String fileNme);

    @Query("Select fileName from DocumentStorage a where user_id=?1 and file_name=?2")
    String getUploadDocumentPath(String userId,String fileNme);

}
