package com.codingdojo.loginreg.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.loginreg.models.LoginUser;
import com.codingdojo.loginreg.models.User;
import com.codingdojo.loginreg.repositories.UserRepository;

@Service
public class UserService {

	@Autowired
	UserRepository UserRepo;
	
	public User register(User newUser, BindingResult result) {
		
// see if email already exist in the DB
		Optional<User> potentialUser = UserRepo.findByEmail(newUser.getEmail());
		// email exist = throw error
		if(potentialUser.isPresent()) {
			result.rejectValue("email","matches", "Account already exist. Log in. ");
			return null;
		}
		// if password matches the confirm password
		if (!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm","matches", "Confirm Password must match. ");
			return null;
		}
		
		if(result.hasErrors()) {
			return null;
		}
		
		
		String hashedPass = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashedPass);
		// no error? hash and salt the password and save the user in DB
		
		return UserRepo.save(newUser);
	}
	
	public User login(LoginUser newLoginUser, BindingResult result) {
		//Check if user exist by email
		Optional<User> potentialUser = UserRepo.findByEmail(newLoginUser.getEmail());
		if(!potentialUser.isPresent()) {
			result.rejectValue("email","matches",  "Invalid Email/Password");
			return null;
		}
		User user = potentialUser.get();
		if(!BCrypt.checkpw(newLoginUser.getPassword(),user.getPassword())) {
			result.rejectValue("password", "matches", "Invalid Email/Password");
			return null;
		}
		if(result.hasErrors()) {
			return null;
		}
		return user;
		//if they do exist check password against password in DB using BCrypt
		// if both things fail = throw error
		
	}
	public User getUserById(Long id) {
	    Optional<User> user = UserRepo.findById(id);
        if(user.isPresent()) {
            return user.get();
        } else {
            return null;
        }
    }
}
