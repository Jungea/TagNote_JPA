package net.skhu.domain;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AccessLevel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Data
@ToString(exclude = { "user", "tms" })
@EqualsAndHashCode(exclude = { "user", "tms" })
@Entity
public class Memo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int memoNum;
	String memoText;

	@Getter(AccessLevel.NONE)
	Timestamp memoDate;
	int imptMemo;
	int delMemo;

	@ManyToOne
	@JoinColumn(name = "userNum")
	User user;

	@JsonIgnore
	@OneToMany(mappedBy = "memo")
	List<TM> tms;

	public String getMemoDate() {
		SimpleDateFormat f = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		return f.format(memoDate);
	}
}
