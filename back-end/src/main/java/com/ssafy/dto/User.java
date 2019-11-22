package com.ssafy.dto;

public class User {
	private String id;
	private String password;
	private String name;
	private String address;
	private String phone_number;
	private String allergy;

	public User() {
	}

	public User(String id, String password, String name, String address, String phone_number, String allergy) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.phone_number = phone_number;
		this.allergy = allergy;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone_number;
	}

	public void setPhone(String phone) {
		this.phone_number = phone;
	}

	public String getAllergy() {
		return allergy;
	}

	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", password=" + password + ", name=" + name + ", address=" + address
				+ ", phone_number=" + phone_number + ", allergy=" + allergy + "]";
	}

}
