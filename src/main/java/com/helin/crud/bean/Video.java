package com.helin.crud.bean;

public class Video {
    private Integer id;

    private Integer camId;

    private String videoName;

    private String video;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCamId() {
        return camId;
    }

    public void setCamId(Integer camId) {
        this.camId = camId;
    }

    public String getVideoName() {
        return videoName;
    }

    public void setVideoName(String videoName) {
        this.videoName = videoName == null ? null : videoName.trim();
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video == null ? null : video.trim();
    }
}