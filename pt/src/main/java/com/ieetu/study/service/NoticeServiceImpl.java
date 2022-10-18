package com.ieetu.study.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ieetu.study.domain.FileDto;
import com.ieetu.study.domain.NoticeDto;
import com.ieetu.study.mapper.NoticeMapper;
import com.ieetu.study.paging.Criteria;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class NoticeServiceImpl implements NoticeService {
    
    @Autowired
    NoticeMapper noticeMapper;
    
    @Override
    public List<NoticeDto> readNoticeInfo(Criteria cri) {
        
        // XML에서 LIMIT에 연산자 사용 시 SQL 에러 발생
        // LIMIT을 사용한 페이징 처리를 위해 offset 값을 변경
        int nowPage = (cri.getPageNum()-1) * cri.getAmount();
        
        cri.setPageNum(nowPage);
        
        return noticeMapper.selectNoticeInfo(cri);
        
    }

    @Override
    public NoticeDto readNoticeInfoOne(int idx) {

        return noticeMapper.selectNoticeInfoOne(idx);
    }

    @Override
    public void registNoticeInfo(List<MultipartFile> files, NoticeDto notice) {
        
        // 파일 첨부가 없을 경우 공지사항 정보만 upload
        if (files == null || files.isEmpty()) {
            
            noticeMapper.insertNoticeInfo(notice);
            
        } else {
            
            // DB에 공지사항 내용 우선 저장
            noticeMapper.insertNoticeInfo(notice);
            
            // 파일이 존재할 경우 공지사항 내용과 첨부파일을 함께 업로드
            String path = "C:\\Files";

            File Folder = new File(path);

            // 지정 경로에 폴더 존재 유무 -> 없으면 임시 폴더 생성
            if (!Folder.exists()) {

                Folder.mkdir();

            }
            
            // List<MultipartFile> 에 담겨있는 file을 하나씩 가져와 해당 정보를 FileDto에 저장 -> DB 삽입 및 파일 저장
            for (MultipartFile file : files) {
                
                FileDto fileInfo = new FileDto(); 
                
                String fileName = file.getOriginalFilename();
                
                String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
                
                String uuid = UUID.randomUUID().toString();
                
                // DB에 업로드 파일 정보 저장
                fileInfo.setFileOwner(notice.getNtWriter());

                fileInfo.setFileOrgNm(file.getOriginalFilename());

                fileInfo.setFileSavedNm(uuid + "." + ext);

                fileInfo.setFileSavedPath(path + "\\" + fileInfo.getFileSavedNm());

                fileInfo.setFileSavedDate(notice.getNtRegDate());

                fileInfo.setFileSize(file.getSize());
                
                // List에 담긴 file 정보 순차적으로 DB에 저장
                noticeMapper.insertNoticeFile(fileInfo);
                
                try {
                    
                    // List에 담긴 file 순차적으로 Local에 저장
                    file.transferTo(new File(path, fileInfo.getFileSavedNm())); 
                    
                } catch (IOException e) {
                    
                    e.printStackTrace();
                    
                }
                
            } // end of for ()

        } // end of else {}
        
    }

    @Override
    public int getTotalCount(Criteria cri) {
        
        return noticeMapper.selectTotalCount(cri);
    }
    
    
    
    

}
