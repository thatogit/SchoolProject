package org.duplicateresearches;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
//@ComponentScan(basePackages= {"org.duplicateresearches"})
public class DuplicateResearchTopicsApplication {

	public static void main(String[] args) {
		SpringApplication.run(DuplicateResearchTopicsApplication.class, args);
	}

}
