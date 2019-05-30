package com.example.board.domain;

import java.util.Date;

public class ArticleVO {
	private int article_id;
	private int board_id;
	private String writer_name;
	private String email;
	private String title;
	private String author;
	private String password;
	private int read_count;
	private int comment_count;
	private int like_count;
	private int ref;
	private int step;
	private int depth;
	private Date createdAt;
	private Date modifiedAt;
	private String content;
	private String ip;
	private String secret;
	
	public Integer getArticle_id() {
		return article_id;
	}
	public void setArticle_id(Integer article_id) {
		this.article_id = article_id;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getWriter_name() {
		return writer_name;
	}
	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getModifiedAt() {
		return modifiedAt;
	}
	public void setModifiedAt(Date modifiedAt) {
		this.modifiedAt = modifiedAt;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	@Override
	public String toString() {
		return "ArticleVO [article_id=" + article_id + ", board_id=" + board_id + ", writer_name=" + writer_name
				+ ", email=" + email + ", title=" + title + ", author=" + author + ", password=" + password
				+ ", read_count=" + read_count + ", comment_count=" + comment_count + ", like_count=" + like_count
				+ ", ref=" + ref + ", step=" + step + ", depth=" + depth + ", createdAt=" + createdAt + ", modifiedAt="
				+ modifiedAt + ", content=" + content + ", ip=" + ip + ", secret=" + secret + "]";
	}
}