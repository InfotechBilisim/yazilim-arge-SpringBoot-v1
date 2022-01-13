package com.infotech.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;


@Transactional(readOnly = true)
public class BaseDaoImpl<T> implements BaseDao<T> {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public <T> Object persist(T transientInstance) {
	    return this.getSession().save(transientInstance);
	}

	@Override
	public <T> void remove(T persistentInstance) {
	    this.getSession().delete(persistentInstance);

	}

	@Override
	public <T> T merge(T detachedInstance) {
	    return (T) this.getSession().merge(detachedInstance);
	}

	@Override
	public T findById(Long identifier, Class<?> persistClass) {
	    return (T) this.getSession().get(persistClass, identifier);
	}

	public SessionFactory getSessionFactory() {
	    return sessionFactory;
	}

	public Session getSession() {
	    return getSessionFactory().getCurrentSession();
	}
}
