package dev.flavio.api_est_discovery;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@EnableEurekaServer
@SpringBootApplication
public class ApiEstDiscoveryApplication {

	public static void main(String[] args) {
		SpringApplication.run(ApiEstDiscoveryApplication.class, args);
	}

}
