package com.helin.crud.service;

import java.util.List;

import com.helin.crud.bean.Note;

public interface NoteService {

	public void saveNote(Note note);

	public List<Note> getALL();

	public Note getMassage(Integer id);

	public void deleteBatch(List<Integer> del_ids);

	public void deleteMassage(Integer id);

	public List<Note> getNoteByUser(Integer id);

	public void update(Note note);
}
