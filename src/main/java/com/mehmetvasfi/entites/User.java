package com.mehmetvasfi.entites;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "userss")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class User implements UserDetails {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
	
	@Column(name = "username")
	private String username;
	
    //@NotBlank(message = "First name cannot be blank")
    //@Size(max = 50, message = "First name cannot exceed 50 characters")
    @Column(name = "first_name")
    private String firstName;

    //@NotBlank(message = "Last name cannot be blank")
    //@Size(max = 50, message = "Last name cannot exceed 50 characters")
    @Column(name = "last_name")
    private String lastName;

//    @NotNull(message = "Birth date is required")
//    @Past(message = "Birth date must be in the past")
//    @JsonFormat(pattern = "yyyy-MM-dd")
    @Column(name = "birt_of_date")
    private Date birthOfDate;

//    @NotBlank(message = "Email is required")
//    @Email(message = "Email must be valid")
    @Column(name = "mail")
    private String mailProperties;

//    @NotBlank(message = "Password cannot be blank")
//    @Size(min = 8, max = 100, message = "Password must be between 8 and 100 characters")
    @Column(name = "password")
    private String password;

//    @Size(max = 250, message = "Bio cannot exceed 250 characters")
    @Column(name = "bio")
    private String bio;
    
    @Column(name = "email_verified")
    private boolean emailVerified = false;
    
    @Column(name = "verification_token")
    private String verificationToken;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)

    private List<Activity>activity;
    
     @ManyToMany
    @JoinTable(name="user_activity",
                joinColumns = @JoinColumn(name="user_id"),
                inverseJoinColumns = @JoinColumn(name="activity_id"))
    private List<Activity>attendedActivities=new ArrayList<>();

     @Override
 	public Collection<? extends GrantedAuthority> getAuthorities() {
 		return List.of();
 	}

     @Override
     public String getPassword() {
         return this.password; // password alanının değerini döndürür
     }

    





	
}
