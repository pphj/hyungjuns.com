package com.hj.home.DTO;

import java.util.Date;

import lombok.Data;

@Data
public class BoardReply {
	private int replyNum;
    private int boardNum;
    private String replyWriter;
    private String replyPass;
    private String replyContent;
    private int replyRef;
    private int replyLev;
    private int replySeq;
    private Date creDate;
    private Date modiDate;
    private String deletePass;
    
    
    
}
