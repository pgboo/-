package com.paotui.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class FileUploadUtil {

    public static String upload(MultipartFile file, HttpServletRequest request, String dir) {
        if (file == null || file.isEmpty()) {
            return null;
        }
        String originalFilename = file.getOriginalFilename();
        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
        String newFileName = UUID.randomUUID().toString().replace("-", "") + suffix;

        String datePath = new SimpleDateFormat("yyyyMMdd").format(new Date());
        String realPath = request.getServletContext().getRealPath("/" + dir + "/" + datePath);
        File targetDir = new File(realPath);
        if (!targetDir.exists()) {
            targetDir.mkdirs();
        }
        File targetFile = new File(targetDir, newFileName);
        try {
            file.transferTo(targetFile);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
        return "/" + dir + "/" + datePath + "/" + newFileName;
    }
}
