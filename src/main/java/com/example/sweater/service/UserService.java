package com.example.sweater.service;

import com.example.sweater.domain.Role;
import com.example.sweater.domain.User;
import com.example.sweater.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Collections;
import java.util.UUID;

@Service
public class UserService implements UserDetailsService {


    private UserRepo userRepo;

    private final MailSenderService mailSenderService;

    @Autowired
    public UserService(UserRepo userRepo, MailSenderService mailSenderService) {
        this.userRepo = userRepo;
        this.mailSenderService = mailSenderService;
    }

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        return userRepo.findByUsername(s);
    }


    public Boolean addUser(User user) {

        User userFromDb = userRepo.findByUsername(user.getUsername());

        if (userFromDb != null) {
            return false;
        }


        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());

        userRepo.save(user);
        if (!StringUtils.isEmpty(user.getEmail())) {


            String message = String.format("Please, visit nex link to activate your account:" +
                    "http://localhost:8080/activate/%s", user.getActivationCode());
            mailSenderService.send(user.getEmail(), "Activation code", message);
        }

        return true;
    }

    public boolean activateUser(String code) {

        User user =  userRepo.findByActivationCode(code);
        if (user == null){
            return false;
        }
        user.setActivationCode(null);
        userRepo.save(user);

        return true;

    }
}
