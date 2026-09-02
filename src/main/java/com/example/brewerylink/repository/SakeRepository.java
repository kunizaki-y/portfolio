package com.example.brewerylink.repository;

import com.example.brewerylink.entity.Sake;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SakeRepository extends JpaRepository<Sake, Long> {

    List<Sake> findByNameContaining(String keyword);
}