package com.KoreaIT.MOMO.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.KoreaIT.MOMO.vo.Article;

@Mapper
public interface ArticleRepository {

	public void writeArticle(int memberId, String title, String body);

	public int getLastInsertId();

	public Article getArticleById(int id);

	public List<Article> getArticles();

	public void modifyArticle(int id, String title, String body);
	
	public void deleteArticle(int id);
	
}