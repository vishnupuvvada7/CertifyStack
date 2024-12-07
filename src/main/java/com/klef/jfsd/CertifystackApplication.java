package com.klef.jfsd;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class CertifystackApplication {

	public static void main(String[] args) {
		SpringApplication.run(CertifystackApplication.class, args);
		System.out.println("CertifyStack Started..............!!!");
	}
}
