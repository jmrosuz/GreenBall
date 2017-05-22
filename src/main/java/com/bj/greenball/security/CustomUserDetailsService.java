package com.bj.greenball.security;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bj.greenball.model.User;
import com.bj.greenball.model.UserRoles;
import com.bj.greenball.service.UserRolesService;
import com.bj.greenball.service.UserService;

//@Service("customUserDetailsService")
public class CustomUserDetailsService implements UserDetailsService{
 
    //@Autowired
    private UserService userService;
    private UserRolesService userRolesService;
    
    
    public void setUserService(UserService sf){
		this.userService = sf;	
	}
    
    public void setUserRolesService(UserRolesService sf){
		this.userRolesService = sf;	
	}
    
    
     
    @Transactional(readOnly=true)
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
    	
    	 System.out.println("Hola en loadUserByUsername");
    	 System.out.println(userService);
        User user = userService.getUserById(username);
        System.out.println("Hola en loadUserByUsername, el username es: " + username);
        System.out.println("User : "+user);
        if(user==null){
            System.out.println("User not found");
            throw new UsernameNotFoundException("Username not found");
        }
            return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), 
                 user.getEnabled() == 1, true, true, true, getGrantedAuthorities(user));
    }
 
     
    private List<GrantedAuthority> getGrantedAuthorities(User user){
    	
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
      
        for(UserRoles userProfile : userRolesService.listUsersRoles(user.getUsername())){
            authorities.add(new SimpleGrantedAuthority(userProfile.getRole()));
        }
        return authorities;
    }
     
}
