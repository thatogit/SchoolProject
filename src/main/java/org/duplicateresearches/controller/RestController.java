package org.duplicateresearches.controller;

import org.duplicateresearches.model.Student;
import org.duplicateresearches.services.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@org.springframework.web.bind.annotation.RestController
public class RestController {

    @Autowired
    private StudentService studentService;
    @GetMapping("/")
    public String hello(){
        return "This is home page";
    }

    @GetMapping("/savestudent")
    public String saveStudent(@RequestParam String username,@RequestParam String firstname, @RequestParam String lastname,@RequestParam String studentnumber ,@RequestParam String email, @RequestParam String password){
        Student student = new Student(username,firstname,lastname,studentnumber,email,password);
        studentService.saveStudent(student);
        return "Student data saved";
    }


}
