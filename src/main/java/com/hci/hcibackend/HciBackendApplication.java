package com.hci.hcibackend;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.hci.hcibackend.mapper")
@SpringBootApplication
public class HciBackendApplication {

    public static void main(String[] args) {
        SpringApplication.run(HciBackendApplication.class, args);
    }

}
