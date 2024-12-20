package com.example.hanju.details.mapper;

import com.example.hanju.details.model.Comment;
import com.example.hanju.details.model.Details;
import com.example.hanju.details.model.ProductSubImage;
import com.example.hanju.details.model.Subscribe;
import com.example.hanju.main.model.Product;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface DetailsMapper {
    List<Details> selectDetail(HashMap<String, Object> map);
    Product selectProduct(Map<String,Object> map);
    List<String> detailImage(Map<String,Object> map);
    List<Details> selectPickUpStore(Map<String,Object> map);
    List<Details> selectPickUpProduct(Map<String,Object> map);
    List<Comment> selectComment(Map<String,Object> map);
    List<Details> selectGroup(Map<String, Object> map);
    List<Details> countGroup(Map<String, Object> map);
    void insertGroup(HashMap<String, Object> map);
    Subscribe getSubscribe(Map<String, Object> map);
    List<Product> getSubscribeItem(Map<String, Object> map);
    List<ProductSubImage> getItemImage(Map<String, Object> map);
    int userSubCheck(Map<String, Object> map);
    int getFavorite(Map<String, Object> map);
    void deleteFavorite(Map<String,Object> map);
    void addFavorite(Map<String,Object> map);
}
