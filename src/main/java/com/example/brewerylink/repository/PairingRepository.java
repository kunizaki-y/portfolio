package com.example.brewerylink.repository;

import com.example.brewerylink.entity.Pairing;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PairingRepository extends JpaRepository<Pairing, Long> {

    // 特定の日本酒（sakeId）に紐づくペアリング一覧を取得
    List<Pairing> findBySakeId(Long sakeId);

    // 特定のユーザー（userId）が投稿したペアリング一覧を取得
    List<Pairing> findByUserId(Long userId);
}