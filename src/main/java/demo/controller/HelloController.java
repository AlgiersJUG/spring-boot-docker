package demo.controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.http.MediaType;

@RestController
@RequestMapping(value="/", produces=MediaType.APPLICATION_JSON_VALUE)
public class HelloController {

	@RequestMapping("/hello")
	public String sayHello(){
		return "Hello there !";
	}
}