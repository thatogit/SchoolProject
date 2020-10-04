package org.duplicateresearches.controller;

import org.duplicateresearches.model.DocumentStorage;
import org.duplicateresearches.model.Student;
import org.duplicateresearches.services.DocumentStorageService;
import org.duplicateresearches.services.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ApplicationController {

    @Autowired
    private DocumentStorageService documentStorageService;

    @Autowired
    private StudentService studentService;

    @RequestMapping("/welcome")
    public String welcome(HttpServletRequest request){

        request.setAttribute("mode","MODE_HOME");
        return "welcomepage";
    }
    @RequestMapping("/search")
    public String search(HttpServletRequest request){

        request.setAttribute("mode","MODE_SEARCH");
        return "searchpage";
    }


    @RequestMapping("/register")
    public String registration(HttpServletRequest request){
        request.setAttribute("mode","MODE_REGISTER");

        return "welcomepage";
    }

    @RequestMapping("/save-student")
    public String registerStudent(@ModelAttribute Student newStudent, BindingResult bindingResult, HttpServletRequest request){
        studentService.saveStudent(newStudent);
        request.setAttribute("newStudent", new Student());
        request.setAttribute("students",studentService.showStudents());
        request.setAttribute("mode","ALL_STUDENTS");
        return "welcomepage";
    }

    @RequestMapping("/show-students")
    public String showStudents(HttpServletRequest request){
        request.setAttribute("newStudent", new Student());
        request.setAttribute("students", studentService.showStudents());
        request.setAttribute("mode","ALL_STUDENTS");
        return "welcomepage";
    }

    @RequestMapping("/delete-student")
    public String deleteStudent(@RequestParam int id, HttpServletRequest request){
        studentService.deleteStudent(id);
        request.setAttribute("newStudent", new Student());
        request.setAttribute("students", studentService.showStudents());
        request.setAttribute("mode","ALL_STUDENTS");
        return "welcomepage";
    }

    @RequestMapping("/edit-student")
    public String editStudent(@RequestParam int id, HttpServletRequest request){
        request.setAttribute("students", studentService.showStudents());
        request.setAttribute("newStudent", studentService.getStudentUsingId(id));
        request.setAttribute("mode","ALL_STUDENTS");
        return "welcomepage";
    }


    @RequestMapping("/save-document")
    public String saveDocument(@ModelAttribute DocumentStorage newDocument, BindingResult bindingResult, HttpServletRequest request){
        Student student = (Student) request.getAttribute("student");
        newDocument.setStudent(studentService.getStudentUsingId(student.getId()));
        documentStorageService.saveDocument(newDocument);
        request.setAttribute("documents", documentStorageService.fetchAllDocumentStorage());
        request.setAttribute("newDocument", new DocumentStorage());
        request.setAttribute("mode","ALL_DOCUMENTS");
        return "welcomepage";
    }

    @RequestMapping("/show-documents")
    public String showDocuments(HttpServletRequest request){
        request.setAttribute("documents", documentStorageService.fetchAllDocumentStorage());
        request.setAttribute("studentList", studentService.showStudents());
        request.setAttribute("newDocument", new DocumentStorage());
        request.setAttribute("mode","ALL_DOCUMENTS");
        return "welcomepage";
    }

    @RequestMapping("/delete-document")
    public String deleteDocument(@RequestParam int id, HttpServletRequest request){
        documentStorageService.deleteDocumentStorage(id);
        request.setAttribute("documents", documentStorageService.fetchAllDocumentStorage());
        request.setAttribute("newDocument", new DocumentStorage());
        request.setAttribute("studentList", studentService.showStudents());
        request.setAttribute("mode","ALL_DOCUMENTS");
        return "welcomepage";
    }

    @RequestMapping("/edit-document")
    public String editDocument(@RequestParam int id, HttpServletRequest request){
        request.setAttribute("documents", documentStorageService.fetchAllDocumentStorage());
        request.setAttribute("newDocument", documentStorageService.findDocumentStorageById(id));
        request.setAttribute("studentList", studentService.showStudents());
        request.setAttribute("mode","ALL_DOCUMENTS");
        return "welcomepage";
    }

    @RequestMapping("/reset-document")
    public String resetDocument(HttpServletRequest request){
        request.setAttribute("documents", documentStorageService.fetchAllDocumentStorage());
        request.setAttribute("newDocument", new DocumentStorage());
        request.setAttribute("studentList", studentService.showStudents());
        request.setAttribute("mode","ALL_DOCUMENTS");
        return "welcomepage";
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest request){
        request.setAttribute("mode","MODE_LOGIN");
        return "welcomepage";
    }
    @RequestMapping("/login-student")
    public String loginStudent(@ModelAttribute Student student,HttpServletRequest request){
        if (studentService.findByUsernameAndPassword(student.getUsername(),student.getPassword())!=null){
            return "homepage";
        }else{
            request.setAttribute("error","Invalid username or password");
            request.setAttribute("mode","MODE_LOGIN");
            return "welcomepage";
        }

    }

}
