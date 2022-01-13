package com.infotech.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="outbox")
public class Outbox {
	
	@Column(name = "data")
	private String data;
	
	@Column(name = "destination")
	private String destination;
	
	@Column(name = "gateway")
	private String gateway;
	
	@Column(name = "generator")
	private String generator;
	
	@Column(name = "generator_rowno")
	private Integer generatorRowNo;

	@Column(name = "mobile")
	private Long mobile;
	
	@Column(name = "process_module_instance")
	private Integer processModuleInstance;
	
	@Column(name = "process_module_name")
	private String processModuleName;
	
	@Column(name = "process_status")
	private Integer processStatus;
	
	@Column(name = "process_time_stamp")
	private Date processTimeStamp;
	
	@Column(name = "psender")
	private String psender;
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "idSequence")
	@SequenceGenerator(schema = "INFOAPP", name = "idSequence", sequenceName = "SEQ_OUTBOX_ROWNO", allocationSize = 1)
	@Column(name = "rowno",unique=true,nullable=false)
	private Long rowno;
	
	@Column(name = "serviceno")
	private String serviceno;
	
	@Column(name = "time_stamp")
	private Date timeStamp;

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getGateway() {
		return gateway;
	}

	public void setGateway(String gateway) {
		this.gateway = gateway;
	}

	public String getGenerator() {
		return generator;
	}

	public void setGenerator(String generator) {
		this.generator = generator;
	}

	public Integer getGeneratorRowNo() {
		return generatorRowNo;
	}

	public void setGeneratorRowNo(Integer generatorRowNo) {
		this.generatorRowNo = generatorRowNo;
	}

	public Long getMobile() {
		return mobile;
	}

	public void setMobile(Long mobile) {
		this.mobile = mobile;
	}

	public Integer getProcessModuleInstance() {
		return processModuleInstance;
	}

	public void setProcessModuleInstance(Integer processModuleInstance) {
		this.processModuleInstance = processModuleInstance;
	}

	public String getProcessModuleName() {
		return processModuleName;
	}

	public void setProcessModuleName(String processModuleName) {
		this.processModuleName = processModuleName;
	}

	public Integer getProcessStatus() {
		return processStatus;
	}

	public void setProcessStatus(Integer processStatus) {
		this.processStatus = processStatus;
	}

	public Date getProcessTimeStamp() {
		return processTimeStamp;
	}

	public void setProcessTimeStamp(Date processTimeStamp) {
		this.processTimeStamp = processTimeStamp;
	}

	public String getPsender() {
		return psender;
	}

	public void setPsender(String psender) {
		this.psender = psender;
	}

	public Long getRowno() {
		return rowno;
	}

	public void setRowno(Long rowno) {
		this.rowno = rowno;
	}

	public String getServiceno() {
		return serviceno;
	}

	public void setServiceno(String serviceno) {
		this.serviceno = serviceno;
	}

	public Date getTimeStamp() {
		return timeStamp;
	}

	public void setTimeStamp(Date timeStamp) {
		this.timeStamp = timeStamp;
	}
	
}
