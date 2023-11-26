package com.hci.hcibackend.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hci.hcibackend.mapper.BmsBillboardMapper;
import com.hci.hcibackend.model.entity.BmsBillboard;
import com.hci.hcibackend.service.BmsBillboardService;
import org.springframework.stereotype.Service;

@Service
public class BmsBillboardServiceImpl extends ServiceImpl<BmsBillboardMapper, BmsBillboard>
    implements BmsBillboardService {

}
