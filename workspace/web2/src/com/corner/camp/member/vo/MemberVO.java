package com.corner.camp.member.vo;

public class MemberVO {
    private String memberId;
    private String memberPw;
    private String memberEmail;
    private String memberEmailHash;
    private int memberEmailChecked; // 0,1
//    private String memberName;
//    private int memberAge;
//    private String memberGender;
//    private String memberTel;
//    private String memberZipcode;
//    private String memberAddress;
//    private String memberAddressDetail;
//    private String memberAddressEtc;

    public MemberVO() {
        ;
    }
    
	public MemberVO(String memberId, String memberPw, String memberEmail, String memberEmailHash,
		int memberEmailChecked) {
	this.memberId = memberId;
	this.memberPw = memberPw;
	this.memberEmail = memberEmail;
	this.memberEmailHash = memberEmailHash;
	this.memberEmailChecked = memberEmailChecked;
}


	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberEmailHash() {
		return memberEmailHash;
	}

	public void setMemberEmailHash(String memberEmailHash) {
		this.memberEmailHash = memberEmailHash;
	}

	public int getMemberEmailChecked() {
		return memberEmailChecked;
	}

	public void setMemberEmailChecked(int memberEmailChecked) {
		this.memberEmailChecked = memberEmailChecked;
	}

   
}

