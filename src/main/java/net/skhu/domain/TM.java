package net.skhu.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@ToString(exclude = { "tag", "memo" })
@EqualsAndHashCode(exclude = { "tag", "memo" })
@Entity
public class TM {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int tagMemoNum;

	@ManyToOne
	@JoinColumn(name = "tagNum")
	Tag tag;

	@ManyToOne
	@JoinColumn(name = "memoNum")
	Memo memo;
}
