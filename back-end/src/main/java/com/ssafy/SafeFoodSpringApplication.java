package com.ssafy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication
@EnableSwagger2
public class SafeFoodSpringApplication {

	public static void main(String[] args) {
		SpringApplication.run(SafeFoodSpringApplication.class, args);
	}

	@Bean
	public Docket api() {
		return new Docket(DocumentationType.SWAGGER_2)
				.groupName("phone management")
				.apiInfo(metaData())
				.select()
				.paths(PathSelectors.any())
				.build();
	}
	
	// 일반적인 정보를 생성
	private ApiInfo metaData() {
		return new ApiInfoBuilder().title("SafeFood API")
				.description("학수형!! 경무랑 가즈아~!")
				.version("1.0").build();
	}
}
