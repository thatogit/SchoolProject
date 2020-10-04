package org.duplicateresearches.services;

import org.duplicateresearches.model.Student;
import org.duplicateresearches.repository.StudentRepository;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

import static org.eclipse.jdt.internal.compiler.problem.ProblemSeverities.Optional;

@Service
@Transactional
public class StudentService {

   private final StudentRepository studentRepository;

    public StudentService(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
    }

    public void saveStudent(Student student) {
        studentRepository.save(student);
    }

    public List<Student> showStudents(){
        List<Student> students =  new ArrayList<>();

        for (Student student:studentRepository.findAll()){
            students.add(student);
        }

        return students;
    }

    public void deleteStudent(int id){
        studentRepository.deleteById(id);
    }

    public Student getStudentUsingId(int id){
        return studentRepository.findById(id);
    }

    public Student findByUsernameAndPassword(String username,String password){

        return studentRepository.findByUsernameAndPassword(username,password);
    }
}
