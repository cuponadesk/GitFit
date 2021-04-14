package com.techelevator.controller;


import com.techelevator.dao.ExerciseDAO;
import com.techelevator.dao.UserDAO;
import com.techelevator.model.User;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")


public class UserController {

	private UserDAO userDAO;

	public UserController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(path = "/allUsers", method = RequestMethod.GET)
	public List<String> getAllUsers() {
		List<User> users = userDAO.findAll();

		List<String> usernames = new ArrayList<>();
		for (User user : users) {
			Object e = user.getAuthorities();
			if (!user.getAuthorities().toString().contains("ROLE_ADMIN")) {
				usernames.add(user.getUsername());
			}
		}
		return usernames;
	}
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(path = "/user/{username}", method = RequestMethod.GET)
	public int getIdFromUsername(@PathVariable String username){
		return userDAO.findIdByUsername(username);
	}

}
