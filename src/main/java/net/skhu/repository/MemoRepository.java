package net.skhu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import net.skhu.domain.Memo;

public interface MemoRepository extends JpaRepository<Memo, Integer> {
	List<Memo> findByUser_UserNumOrderByMemoDateDesc(int userNum);
}
