package com.mehmetvasfi.entites;

import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Activity {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "description")
	private String description;
	
	//private Location
	
	@Column(name = "category")
	private String category;
	
	@Column(name = "time_of_activity")
	private Date timeOfActivity;
	
//	@Column(name = "organizer")
//	private User organizer;
//	
	@Column(name = "team_size")
	private Integer teamSize;
	
//	@Column(name = "attendedUsers")
//	private List<User> attendedUsers;
// medya yukleencek
	
// requests eklenecek
	
	
}
