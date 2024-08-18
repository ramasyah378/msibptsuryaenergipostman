package com.contoh.demo.controller;

import com.contoh.demo.entity.Lokasi;
import com.contoh.demo.entity.Proyek;
import com.contoh.demo.service.LokasiService;
import com.contoh.demo.service.ProyekService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api")
public class ProyekController {

    @Autowired
    private ProyekService proyekService;

    @Autowired
    private LokasiService lokasiService;

    @PostMapping("/proyek")
    public ResponseEntity<Proyek> createProyek(@RequestBody Proyek proyek) {
        Proyek savedProyek = proyekService.saveProyek(proyek);
        return ResponseEntity.ok(savedProyek);
    }

    @GetMapping("/proyek")
    public ResponseEntity<List<Proyek>> getAllProyek() {
        List<Proyek> proyekList = proyekService.getAllProyek();
        return ResponseEntity.ok(proyekList);
    }

    @PutMapping("/proyek/{id}")
    public ResponseEntity<Proyek> updateProyek(@PathVariable Long id, @RequestBody Proyek proyek) {
        Optional<Proyek> existingProyek = proyekService.getProyekById(id);
        if (existingProyek.isPresent()) {
            Proyek updatedProyek = proyekService.updateProyek(proyek);
            return ResponseEntity.ok(updatedProyek);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/proyek/{id}")
    public ResponseEntity<Void> deleteProyek(@PathVariable Long id) {
        proyekService.deleteProyek(id);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/lokasi")
    public ResponseEntity<Lokasi> createLokasi(@RequestBody Lokasi lokasi) {
        Lokasi savedLokasi = lokasiService.saveLokasi(lokasi);
        return ResponseEntity.ok(savedLokasi);
    }


    @GetMapping("/lokasi")
    public ResponseEntity<List<Lokasi>> getAllLokasi() {
        List<Lokasi> lokasiList = lokasiService.getAllLokasi();
        return ResponseEntity.ok(lokasiList);
    }

    @PutMapping("/lokasi/{id}")
    public ResponseEntity<Lokasi> updateLokasi(@PathVariable Long id, @RequestBody Lokasi lokasi) {
        Optional<Lokasi> existingLokasi = lokasiService.getLokasiById(id);
        if (existingLokasi.isPresent()) {
            Lokasi updatedLokasi = lokasiService.updateLokasi(lokasi);
            return ResponseEntity.ok(updatedLokasi);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/lokasi/{id}")
    public ResponseEntity<Void> deleteLokasi(@PathVariable Long id) {
        lokasiService.deleteLokasi(id);
        return ResponseEntity.noContent().build();
    }
}
