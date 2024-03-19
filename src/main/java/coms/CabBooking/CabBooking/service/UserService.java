package coms.CabBooking.CabBooking.service;

import coms.CabBooking.CabBooking.entities.User;

public interface UserService {
    User getUserByUsername(String username);
    void saveUser(User user);
}
