package service;

import model.User;

public interface UserService {
	
	public boolean regUser(User user);
    public User login(User user);
    public User queryUser(String email);

}

