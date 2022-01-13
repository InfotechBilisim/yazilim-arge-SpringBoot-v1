package com.infotech.entity;

public class ComboView {

	private String value;
	private String label;

	// Bazı durumlarda value label yerine id,text kullanımı oluyor. js tafaında
	// çeirimlerle uğraşıp sistemi yormamak için bu alanlar eklendi
	private String id;
	private String text;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

}
