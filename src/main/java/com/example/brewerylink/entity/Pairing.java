package com.example.brewerylink.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "pairings")
@Data
public class Pairing {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // 多対1のリレーション（複数のペアリング投稿が、1つのSakeに紐づく）
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "sake_id", nullable = false)
    private Sake sake;

    // 多対1のリレーション（複数のペアリング投稿が、1つのDishに紐づく）
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "dish_id", nullable = false)
    private Dish dish;

    // 投稿したユーザー
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(columnDefinition = "TEXT")
    private String comment; // おすすめポイントや感想
}