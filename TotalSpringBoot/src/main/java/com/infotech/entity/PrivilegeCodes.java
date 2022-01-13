package com.infotech.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="privilege_codes")
public class PrivilegeCodes {

	@Id
	@Column(name = "privilege",unique=true,nullable=false)
	private Long privilege;
	
	
	@Column(name = "name")
	private String name;


	public Long getPrivilege() {
		return privilege;
	}


	public void setPrivilege(Long privilege) {
		this.privilege = privilege;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "PrivilegeCodes [name=" + name + ", cprivilegempany=" + privilege +"]";
	}
}
