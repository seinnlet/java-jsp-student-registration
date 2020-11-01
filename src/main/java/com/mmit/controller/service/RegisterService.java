package com.mmit.controller.service;

import javax.persistence.EntityManager;

import com.mmit.entity.Registration;

public class RegisterService {
	
	private EntityManager em;
	
	public RegisterService(EntityManager em) {
		this.em = em;
	}

	public void save(Registration r) {
		
		em.getTransaction().begin();
		em.persist(r);
		em.getTransaction().commit();
	}
}
