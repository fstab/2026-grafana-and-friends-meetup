package de.fstab.demo.grotdb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@SpringBootApplication
@Controller
public class GrotDbService {

    private final GrotRepository grotRepository;

    public GrotDbService(GrotRepository grotRepository) {
        this.grotRepository = grotRepository;
    }

    @GetMapping(path = "/grots")
    public @ResponseBody Iterable<Grot> getAllGrots() throws InterruptedException {
        Thread.sleep(800);
        Iterable<Grot> result = grotRepository.findAll();
        List<Grot> resultList = new ArrayList<>();
        result.forEach(resultList::add);
        System.out.println("DB query for all grots yields " + resultList.size() + " results.");
        return resultList;
    }

    // This will throw HTTP 500 if the name already exists.
    @PostMapping(path = "/grots")
    public ResponseEntity<String> addNewUser(@RequestParam("name") String name) {
        Grot grot = new Grot();
        grot.setName(name);
        grotRepository.save(grot);
        return ResponseEntity.status(HttpStatus.OK).body("Added entry for Grot \"" + name + "\".\n");
    }

	public static void main(String[] args) {
		SpringApplication.run(GrotDbService.class, args);
	}
}