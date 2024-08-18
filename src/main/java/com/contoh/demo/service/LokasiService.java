package com.contoh.demo.service;

import com.contoh.demo.entity.Lokasi;
import com.contoh.demo.repository.LokasiRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class LokasiService {

    @Autowired
    private LokasiRepository lokasiRepository;

    public List<Lokasi> getAllLokasi() {
        return lokasiRepository.findAll();
    }

    public Optional<Lokasi> getLokasiById(Long id) {
        return lokasiRepository.findById(id);
    }

    public Lokasi saveLokasi(Lokasi lokasi) {
        return lokasiRepository.save(lokasi);
    }

    public void deleteLokasi(Long id) {
        lokasiRepository.deleteById(id);
    }

    public Lokasi updateLokasi(Lokasi lokasi) {
        return lokasiRepository.save(lokasi);
    }
}
