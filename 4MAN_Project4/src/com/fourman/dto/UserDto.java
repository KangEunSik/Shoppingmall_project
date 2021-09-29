package com.fourman.dto;

public class UserDto {
		private String Id;
		private String Pw;
		private String UserName;
		private String Email;
		private String Address;
		private String PhoneNum;


		@Override
		public String toString() {
			return "UserDto [Id=" + Id + ", Pw=" + Pw + ", UserName=" + UserName + ", Email=" + Email + ", Address=" + Address
					+ ", PhoneNum=" + PhoneNum + "]";
		}
		public UserDto() {}


		public UserDto(String id, String pw, String userName, String email, String address, String phoneNum) {
			super();
			Id = id;
			Pw = pw;
			UserName = userName;
			Email = email;
			Address = address;
			PhoneNum = phoneNum;
		}

		public String getId() {
			return Id;
		}
		public void setId(String id) {
			Id = id;
		}
		public String getPw() {
			return Pw;
		}
		public void setPw(String pw) {
			Pw = pw;
		}
		public String getUserName() {
			return UserName;
		}
		public void setUserName(String userName) {
			UserName = userName;
		}
		public String getEmail() {
			return Email;
		}
		public void setEmail(String email) {
			Email = email;
		}
		public String getAddress() {
			return Address;
		}
		public void setAddress(String address) {
			Address = address;
		}
		public String getPhoneNum() {
			return PhoneNum;
		}
		public void setPhoneNum(String phoneNum) {
			PhoneNum = phoneNum;
		}
}
