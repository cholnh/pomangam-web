package com.mrporter.pomangam.common.security.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.mrporter.pomangam.common.login.dao.UserCrudDAO;
import com.mrporter.pomangam.common.login.vo.UserBean;
import com.mrporter.pomangam.common.security.model.domain.Role;
import com.mrporter.pomangam.common.security.model.domain.User;

@Service
public class UserService implements UserDetailsService {

    @Override
    public User loadUserByUsername(final String username) throws UsernameNotFoundException {
    	User user = new User();
    	UserBean userBean = new UserCrudDAO().getMember(username);
    	
    	if (userBean == null) {
    		throw new UsernameNotFoundException("접속자 정보를 찾을 수 없습니다.");
    	} else {
        	user.setUsername(userBean.getUsername());
        	user.setPassword(userBean.getPassword());
        	
        	user.setName(userBean.getName());
        	user.setNickname(userBean.getNickname());
        	user.setTargetidx(userBean.getIdx_target());
        	user.setSubscribeidx(userBean.getIdx_subscribe());
        	user.setModdate(userBean.getModdate());
        	user.setRegdate(userBean.getRegdate());
        	user.setPhonenumber(userBean.getTel());
        	
        	List<Role> roles = new ArrayList<Role>();
        	
        	// 기본 권한
        	Role role = new Role();
    		role.setName("ROLE_USER");
    		roles.add(role);
        	
        	user.setAuthorities(roles);
    	}
    	
    	return user;
    }
}
