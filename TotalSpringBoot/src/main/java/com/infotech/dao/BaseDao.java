package com.infotech.dao;

public interface BaseDao<T> {

	/**
	 * @Purpose :Save object of type T
	 * @param transientInstance
	 */
	public <T> Object persist(final T transientInstance);

	/**
	 * @Purpose :Delete object of type T
	 * @param persistentInstance
	 */
	public <T> void remove(final T persistentInstance);

	/**
	 * @Purpose :Update Object of type T
	 * @param detachedInstance
	 * @return
	 */
	public <T> T merge(final T detachedInstance);

	/**
	 * @Purpose :Find object by 'id' of type T
	 * @param identifier
	 * @return
	 */
	public T findById(final Long identifier, Class<?> persistClass);
	
}
