package com.mehmetvasfi.entites;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.Size;
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
public class User {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @NotBlank(message = "First name cannot be blank")
    @Size(max = 50, message = "First name cannot exceed 50 characters")
    @Column(name = "first_name")
    private String firstName;

    @NotBlank(message = "Last name cannot be blank")
    @Size(max = 50, message = "Last name cannot exceed 50 characters")
    @Column(name = "last_name")
    private String lastName;

    @NotNull(message = "Birth date is required")
    @Past(message = "Birth date must be in the past")
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Column(name = "birt_of_date")
    private Date birthOfDate;

    @NotBlank(message = "Email is required")
    @Email(message = "Email must be valid")
    @Column(name = "mail")
    private String mailProperties;

    @NotBlank(message = "Password cannot be blank")
    @Size(min = 8, max = 100, message = "Password must be between 8 and 100 characters")
    @Column(name = "password")
    private String passwordString;

    @Size(max = 250, message = "Bio cannot exceed 250 characters")
    @Column(name = "bio")
    private String bio;
    
    @Column(name = "email_verified")
    private boolean emailVerified = false;
    
    @Column(name = "verification_token")
    private String verificationToken;

	
}
