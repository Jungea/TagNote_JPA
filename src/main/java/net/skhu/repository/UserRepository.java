package net.skhu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import net.skhu.domain.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	List<User> findByUserIdAndUserPass(String userId, String userPass); // 로그인

	int countByUserId(String userId); // 아이디 중복 확인

	List<User> findByUserIdAndPassFindQustAndPassFindAnsr(String userId, int passFindQust, String passFindAnsr); // 비밀번호
																													// 찾기

}
