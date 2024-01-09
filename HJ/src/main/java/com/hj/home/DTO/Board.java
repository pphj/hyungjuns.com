package com.hj.home.DTO;

import java.util.Date;

import lombok.Data;

@Data
public class Board {
    private int boardNum;
    private String id;
    private String cateName;
    private String boardTitle;
    private String boardContent;
    private Date creDate;
    private Date modiDate;
    private int boardView;
    private String key;
    private String boardState;
    private int replyCount;
    
}
