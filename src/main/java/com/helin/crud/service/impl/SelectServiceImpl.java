package com.helin.crud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.helin.crud.service.SelectService;

@Service
@Transactional
public class SelectServiceImpl implements SelectService {

//	@Autowired
//	UrlMapper urlMapper;
//	@Autowired
//	WifiMapper wifiMapper;
//	@Autowired
//	DateBaseMapper dateBaseMapper;
//	@Autowired
//	AddressMapper addressMapper;
//	@Autowired
//	BankMapper bankMapper;
//	@Override
//	public List<Url> findUrlByNameAndUId(Integer id, String keyword) {
//		// TODO Auto-generated method stub
//		return urlMapper.findUrlByNameAndUId(id,keyword);
//	}
//	@Override
//	public List<Wifi> findWifiByNameAndUId(Integer id, String keyword) {
//		// TODO Auto-generated method stub
//		return wifiMapper.findWifiByNameAndUId(id,keyword);
//	}
//	@Override
//	public List<DateBase> findDBByNameAndUId(Integer id, String keyword) {
//		// TODO Auto-generated method stub
//		return dateBaseMapper.findDBByNameAndUId(id,keyword);
//	}
//	@Override
//	public List<Address> findAddressByNameAndUId(Integer id, String keyword) {
//		// TODO Auto-generated method stub
//		return addressMapper.findAddressByNameAndUId(id,keyword);
//	}
//	@Override
//	public List<Bank> findBankByNameAndUId(Integer id, String keyword) {
//		// TODO Auto-generated method stub
//		return bankMapper.findBankByNameAndUId(id,keyword);
//	}

}
