package net.skhu.domain;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@ToString(exclude = { "memos", "tags" })
@EqualsAndHashCode(exclude = { "memos", "tags" })
@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int userNum;
	String userId;
	String userPass;
	int passFindQust;
	String passFindAnsr;

	@JsonIgnore
	@OneToMany(mappedBy = "user")
	List<Memo> memos;

	@JsonIgnore
	@OneToMany(mappedBy = "user")
	List<Tag> tags;

}
