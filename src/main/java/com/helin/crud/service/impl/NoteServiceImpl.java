package com.helin.crud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helin.crud.bean.Note;
import com.helin.crud.bean.NoteExample;
import com.helin.crud.bean.NoteExample.Criteria;
import com.helin.crud.dao.NoteMapper;
import com.helin.crud.service.NoteService;

@Service
public class NoteServiceImpl implements NoteService {

	@Autowired
	NoteMapper noteMapper;
	
	@Override
	public void saveNote(Note note) {
		
		noteMapper.insertSelective(note);

	}

	@Override
	public List<Note> getALL() {
		// TODO Auto-generated method stub
		return noteMapper.selectByExample(null);
	}

	@Override
	public Note getMassage(Integer id) {
		Note massage = noteMapper.selectByPrimaryKey(id);
		return massage;
	}

	@Override
	public void deleteBatch(List<Integer> ids) {
		NoteExample example = new NoteExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdIn(ids);
		noteMapper.deleteByExample(example);

	}

	@Override
	public void deleteMassage(Integer id) {
		// TODO Auto-generated method stub
		noteMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<Note> getNoteByUser(Integer id) {
		// TODO Auto-generated method stub
		return noteMapper.selectByUserId(id);
	}

	@Override
	public void update(Note note) {
		noteMapper.updateByPrimaryKeySelective(note);
		
	}

}
