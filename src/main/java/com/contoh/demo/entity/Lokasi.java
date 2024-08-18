package com.contoh.demo.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDateTime;
import java.util.Set;

@Entity
@Data
public class Lokasi {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String namaLokasi;
    private String negara;
    private String provinsi;
    private String kota;

    private LocalDateTime createdAt = LocalDateTime.now();

    @ManyToMany(mappedBy = "lokasi")
    private Set<Proyek> proyek;
}
