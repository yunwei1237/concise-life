package com.tcf.service.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tcf.dao.Dao;
import com.tcf.entity.Journal;
import com.tcf.service.JournalService;

@Service
public class JournalServiceImpl implements JournalService {
	
	@Autowired
	private Dao dao;
	
	public List<Journal> getJournalForUser(String username, int pageIndex,
			int pageSize) {
		// TODO Auto-generated method stub
		String hql = String.format("from Journal where userinfo.username = '%s'",username);
		return dao.find(hql, pageIndex, pageSize);
	}

	public Journal getJournalById(int id) {
		// TODO Auto-generated method stub
		return (Journal) dao.get(Journal.class, id);
	}

	public Serializable addJournal(Journal journal) {
		// TODO Auto-generated method stub
		return dao.save(journal);
	}

}
