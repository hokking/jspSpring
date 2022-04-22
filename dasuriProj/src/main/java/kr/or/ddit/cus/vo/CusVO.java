package kr.or.ddit.cus.vo;

import java.util.Arrays;
import java.util.List;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class CusVO {
	private String cusNum;
	@NotBlank
	private String cusNm;
	@NotBlank
	private String addr;

	private String addr1;
	private String addr2;

	@NotBlank
	private String pne;

	private int rnum;

	// 다중 파일 객체
	private MultipartFile[] uploadFile;
	// 다중 파일 업로드 객체
	private List<AttachFilesVO> attachFilesVO;
	// 다중 파일 객체의 파일명
	private String uploadFileName;

	public String getCusNum() {
		return cusNum;
	}

	// VW_USER 뷰테이블
	private String username;
	private String password;
	private String enabled;
	private int sal;

	// 1 : N = CusVO : UserAuth
	List<UserAuth> userAuthList;

	public void setCusNum(String cusNum) {
		this.cusNum = cusNum;
	}

	public String getCusNm() {
		return cusNm;
	}

	public void setCusNm(String cusNm) {
		this.cusNm = cusNm;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getPne() {
		return pne;
	}

	public void setPne(String pne) {
		this.pne = pne;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public MultipartFile[] getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile[] uploadFile) {
		this.uploadFile = uploadFile;
	}

	public List<AttachFilesVO> getAttachFilesVO() {
		return attachFilesVO;
	}

	public void setAttachFilesVO(List<AttachFilesVO> attachFilesVO) {
		this.attachFilesVO = attachFilesVO;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		this.sal = sal;
	}

	public List<UserAuth> getUserAuthList() {
		return userAuthList;
	}

	public void setUserAuthList(List<UserAuth> userAuthList) {
		this.userAuthList = userAuthList;
	}

	@Override
	public String toString() {
		return "CusVO [cusNum=" + cusNum + ", cusNm=" + cusNm + ", addr=" + addr + ", addr1=" + addr1 + ", addr2="
				+ addr2 + ", pne=" + pne + ", rnum=" + rnum + ", uploadFile=" + Arrays.toString(uploadFile)
				+ ", attachFilesVO=" + attachFilesVO + ", uploadFileName=" + uploadFileName + ", username=" + username
				+ ", password=" + password + ", enabled=" + enabled + ", sal=" + sal + ", userAuthList=" + userAuthList
				+ "]";
	}

}
