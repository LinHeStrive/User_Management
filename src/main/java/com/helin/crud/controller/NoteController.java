package com.helin.crud.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.helin.crud.bean.Msg;
import com.helin.crud.bean.Note;
import com.helin.crud.bean.User;
import com.helin.crud.service.NoteService;
import com.helin.crud.service.UserService;

@Controller
public class NoteController {

	@Autowired
	NoteService noteService;
	@Autowired
	UserService userService;
	@RequestMapping(value="/note/{id}",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveNote(@PathVariable("id")Integer id,@RequestParam("Content") String content,@RequestParam("title") String title,@RequestParam("setitle") String setitle,HttpSession session) {
		Note note = new Note();
		note.setContent(content);
		note.setTitle(title);
		note.setSetilte(setitle);
		note.setState(1);
		note.setUserId(id);
		noteService.saveNote(note);
		return Msg.success();
	}
	@RequestMapping(value="/to_user_notes/{ids}",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveNotes(@PathVariable("ids")String ids,@RequestParam("Content") String content,@RequestParam("title") String title,@RequestParam("setitle") String setitle,HttpSession session) {
		if(ids.contains("-")) {
			List<Integer> to_ids = new ArrayList<>();
			String [] str_ids = ids.split("-");
			for (String string : str_ids) {
				to_ids.add(Integer.parseInt(string));
			}
			for (Integer id : to_ids) {
		 		Note note = new Note();
				note.setContent(content);
				note.setTitle(title);
				note.setSetilte(setitle);
				note.setState(1);
				note.setUserId(id);
				noteService.saveNote(note);
			}
		}else {
			Integer id = Integer.parseInt(ids);
			Note note = new Note();
			note.setContent(content);
			note.setTitle(title);
			note.setSetilte(setitle);
			note.setState(1);
			note.setUserId(id);
			noteService.saveNote(note);
		}
		
		return Msg.success();
	}
	@RequestMapping(value="/note",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveNoteForAllUser(@RequestParam("Content") String content,@RequestParam("title") String title,@RequestParam("setitle") String setitle,HttpSession session) {
		List<User> users = userService.getAll();
		for (User user : users) {
			Note note = new Note();
			note.setContent(content);
			note.setTitle(title);
			note.setSetilte(setitle);
			note.setState(1);
			note.setUserId(user.getId());
			noteService.saveNote(note);
			
		}
		return Msg.success();
	}
	@RequestMapping("/notes")
	@ResponseBody
	public Msg getMassageWithUser(@RequestParam(value="pn",defaultValue="1")Integer pn,HttpSession session) {
		
		Integer id =  (Integer) session.getAttribute("id");
		System.out.println(id);
		List<Note> notes = noteService.getNoteByUser(id);
		PageInfo page = new PageInfo(notes,5);
		return Msg.success().add("pageInfo", page);
	}
	
	@ResponseBody
	@RequestMapping(value="/note/{id}",method=RequestMethod.GET)
	public Msg getMassage(@PathVariable("id")Integer id) {
		System.out.println(id);
		Note massage = noteService.getMassage(id);
		return Msg.success().add("massage", massage);
	}
	@ResponseBody
	@RequestMapping(value="/note_close/{id}",method=RequestMethod.GET)
	public Msg getMassage_close(@PathVariable("id")Integer id,HttpSession session,HttpServletRequest request) {
		//通过id获取note
		Note massage = noteService.getMassage(id);
		//通过id获取user
		Integer userid =  (Integer) session.getAttribute("id");
		User user = userService.getUser(userid);
		//获取未阅读数
		Integer allNote = (Integer) session.getAttribute("allNote");
		//设为0，表示已经阅读
		massage.setState(0);
		noteService.update(massage);
		user.setAllnote(allNote-1);
		request.getSession().setAttribute("allNote", user.getAllnote());
		userService.update(user);
		return Msg.success().add("massage", massage);
	}
	@ResponseBody
	@RequestMapping(value="/note/{ids}",method=RequestMethod.DELETE)
	public Msg deleteMassageById(@PathVariable("ids")String ids) {
		if(ids.contains("-")) {
			List<Integer> del_ids = new ArrayList<>();
			String [] str_ids = ids.split("-");
			for (String string : str_ids) {
				del_ids.add(Integer.parseInt(string));
			}
			noteService.deleteBatch(del_ids);
		}else {
			Integer id = Integer.parseInt(ids);
			noteService.deleteMassage(id);
		}
		
		return Msg.success();
	}
}
