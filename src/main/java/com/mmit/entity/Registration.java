package com.mmit.entity;

import java.io.Serializable;
import java.time.LocalDate;

import javax.persistence.*;
import static javax.persistence.GenerationType.IDENTITY;

/**
 * Entity implementation class for Entity: Registration
 *
 */
@Entity

public class Registration implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	private int id;
	
	private LocalDate registerdate;
	private int paidamount;
	
	@ManyToOne
	@JoinColumn(name = "student_id", referencedColumnName = "id")
	private Student student;
	
	@ManyToOne
	@JoinColumn(name = "class_id", referencedColumnName = "id")
	private Classes classes;
	
	public Registration() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDate getRegisterdate() {
		return registerdate;
	}

	public void setRegisterdate(LocalDate registerdate) {
		this.registerdate = registerdate;
	}

	public int getPaidamount() {
		return paidamount;
	}

	public void setPaidamount(int paidamount) {
		this.paidamount = paidamount;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}
	
	
}
