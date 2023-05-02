package com.example.postgrestest.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Entity
@Table(name = "json_test")
@Data
public class JsonTest
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDateTime createTime;

    @Column(name = "json", columnDefinition = "text" )
    private String json;


}

