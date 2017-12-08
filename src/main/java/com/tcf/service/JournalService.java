package com.tcf.service;

import java.io.Serializable;
import java.util.List;

import com.tcf.entity.Journal;

public interface JournalService {
	List<Journal> getJournalForUser(String username,int pageIndex,int pageSize);
	Journal getJournalById(int id);
	Serializable addJournal(Journal journal);
}
