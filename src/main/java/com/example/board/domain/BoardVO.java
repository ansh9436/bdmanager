package com.example.board.domain;

import java.util.Date;

public class BoardVO {
	private Integer board_id;
	private String board_name;
	private String board_type;
	private String url;
	private String secret;
	private String read_allow;
	private String write_allow;
	private String reply_allow;
	private String modify_allow;
	private String remove;
	private String download;
	private String upload;
	private Integer nAttach;
	private String aSize;
	private Integer display_format;
	private Date creating_date;
	private String board_desc;
	private Integer nofArticle;
	
	public Integer getBoard_id() {
		return board_id;
	}
	public void setBoard_id(Integer board_id) {
		this.board_id = board_id;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	public String getRead_allow() {
		return read_allow;
	}
	public void setRead_allow(String read_allow) {
		this.read_allow = read_allow;
	}
	public String getWrite_allow() {
		return write_allow;
	}
	public void setWrite_allow(String write_allow) {
		this.write_allow = write_allow;
	}
	public String getReply_allow() {
		return reply_allow;
	}
	public void setReply_allow(String reply_allow) {
		this.reply_allow = reply_allow;
	}
	public String getModify_allow() {
		return modify_allow;
	}
	public void setModify_allow(String modify_allow) {
		this.modify_allow = modify_allow;
	}
	public String getRemove() {
		return remove;
	}
	public void setRemove(String remove) {
		this.remove = remove;
	}
	public String getDownload() {
		return download;
	}
	public void setDownload(String download) {
		this.download = download;
	}
	public String getUpload() {
		return upload;
	}
	public void setUpload(String upload) {
		this.upload = upload;
	}
	public Integer getnAttach() {
		return nAttach;
	}
	public void setnAttach(Integer nAttach) {
		this.nAttach = nAttach;
	}
	public String getaSize() {
		return aSize;
	}
	public void setaSize(String aSize) {
		this.aSize = aSize;
	}
	public Integer getDisplay_format() {
		return display_format;
	}
	public void setDisplay_format(Integer display_format) {
		this.display_format = display_format;
	}
	public Date getCreating_date() {
		return creating_date;
	}
	public void setCreating_date(Date creating_date) {
		this.creating_date = creating_date;
	}
	public String getBoard_desc() {
		return board_desc;
	}
	public void setBoard_desc(String board_desc) {
		this.board_desc = board_desc;
	}
	public Integer getNofArticle() {
		return nofArticle;
	}
	public void setNofArticle(Integer nofArticle) {
		this.nofArticle = nofArticle;
	}
	@Override
	public String toString() {
		return "BoardVO [board_id=" + board_id + ", board_name=" + board_name + ", board_type=" + board_type + ", url="
				+ url + ", secret=" + secret + ", read_allow=" + read_allow + ", write_allow=" + write_allow
				+ ", reply_allow=" + reply_allow + ", modify_allow=" + modify_allow + ", remove=" + remove
				+ ", download=" + download + ", upload=" + upload + ", nAttach=" + nAttach + ", aSize=" + aSize
				+ ", display_format=" + display_format + ", creating_date=" + creating_date + ", board_desc="
				+ board_desc + ", nofArticle = " + nofArticle + "]";
	}
}