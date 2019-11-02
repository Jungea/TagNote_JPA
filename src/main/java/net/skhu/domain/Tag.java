package net.skhu.domain;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@ToString(exclude = { "user", "tms" })
@EqualsAndHashCode(exclude = { "user", "tms" })
@Entity
public class Tag {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int tagNum;
	String tagName;

	@ManyToOne
	@JoinColumn(name = "userNum")
	User user;

	@JsonIgnore
	@OneToMany(mappedBy = "tag")
	List<TM> tms;
}
