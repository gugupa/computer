package service;

import model.User;

public interface UserService {
	
	public boolean regUser(User user);
	public boolean editUser(User user);
    public User login(String email_username,User user);
    public User checkEmail(String email);
    public User checkUsername(String username);

}

