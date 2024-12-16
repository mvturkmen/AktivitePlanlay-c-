package com.mehmetvasfi.entites;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
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
    @NotEmpty(message = "Title alanı boş bırakılamaz")
    @Size(min = 3, max = 100, message = "Title en az 3 karakter olmalı ve en fazla 100 karakter olmalı.")
    private String title;
    
    @Column(name = "description")
    @NotEmpty(message = "Description alanı boş bırakılamaz")
    @Size(min = 20, message = "Description en az 20 karakter olmalı.")
    private String description;
    
    @Column(name = "category")
    @NotEmpty(message = "Category alanı boş bırakılamaz")
    private String category;
    
    @Column(name = "time_of_activity")
    @NotNull(message = "Activity time boş bırakılamaz")
    private Date timeOfActivity;
    
    @Column(name = "team_size")
    @NotNull(message = "Team size boş bırakılamaz")
    @Min(value = 1, message = "Team size en az 1 olmalı.")
    private Integer teamSize;
	
//	@Column(name = "attendedUsers")
//	private List<User> attendedUsers;
// medya yukleencek
	
// requests eklenecek

     @ManyToOne
     //@JoinColumn(name = "user_id")
     @JsonIgnore
     private User user;

  //  @ManyToMany
  //  @JoinTable(
   //   name = "activity_user", 
    //  joinColumns = @JoinColumn(name = "activity_id"), 
      //inverseJoinColumns = @JoinColumn(name = "user_id"))
    //private List<User> attendedUsers ;
    //public List<User> getUsers() {
      //  return attendedUsers;
    //}

  
     
     
     @OneToMany(mappedBy = "activity", cascade = CascadeType.ALL)
    private List<Request> requests = new ArrayList<>();


    public List<Request> getRequests() {
        return requests;
    }

    public void setRequests(List<Request> requests) {
        this.requests = requests;
    }


	
}
