package org.duplicateresearches.repository;

import org.duplicateresearches.model.Student;
import org.springframework.data.repository.CrudRepository;

public interface StudentRepository extends CrudRepository<Student, Integer> {

   public Student findById (int id);
   public Student findByUsernameAndPassword(String username,String password);
}
