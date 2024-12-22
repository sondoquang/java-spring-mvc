package com.fpt.laptopshop.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UploadFileService {

    private final ServletContext servletContext;

    public UploadFileService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String uploadFile(MultipartFile file, String folder) throws IOException {
        byte[] bytes = file.getBytes();
        String rootPath = this.servletContext.getRealPath(folder);
        String fileName = file.getOriginalFilename();
        File dir = new File(rootPath + File.separator + "avatar");
        if (!dir.exists())
            dir.mkdirs();

        // Create the file on server
        File serverFile = new File(dir.getAbsolutePath() + File.separator +
                +System.currentTimeMillis() + "-" + fileName);

        BufferedOutputStream stream = new BufferedOutputStream(
                new FileOutputStream(serverFile));
        stream.write(bytes);
        stream.close();
        return fileName;
    }
}
