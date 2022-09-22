// DB에서 UserDetail를 얻어와 AuthenticationManager에게 제공하는 역할을 수행
// 아래 코드에서는 DB 없이 하드코딩된 User List에서 get userDetail 수행
// password 부분이 해싱되어있는데, 
// Spring Security 5.0에서는 Password를 BryptEncoder를 통해 Brypt화하여 저장 -> 하드코딩으로 작성
// https://www.javainuse.com/onlineBcrypt 에서 user_pw를 Bcrypt화 가능
//  id : user_id, pw: user_pw로 고정해 사용자 확인하고, 사용자 확인 실패시 throw Exception을 제공
package com.yh2.db.config;

import java.util.ArrayList;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class JwtUserDetailsService implements UserDetailsService {
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		if ("user_id".equals(username)) {
			return new User("user_id", "$2a$10$9XiFiy8jJ4hk8Yb4Ss9S3.m1yzk8DgZJKGfyf68RzmwixXNp8xZIK", new ArrayList<>());
		} else {
			throw new UsernameNotFoundException("User not found with username: " + username);
		}
	}
}
